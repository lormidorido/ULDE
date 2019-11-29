#!/usr/bin/perl

eval 'exec /usr/bin/perl  -S $0 ${1+"$@"}'
    if 0; # not running under some shell

BEGIN {
	push(@INC,'/opt/ulde/development/ULDE/lib');
}

use ULDE::Web::Service::REST::Server::ELE;
use Digest::HMAC_SHA1;
use ULDE::Component::Product;
use Data::Dumper;
use ULDE::Schema::ULDE;
use DBI;

#my $ulde = ULDE::Schema::ULDE->connect('dbi:Pg:dbname=ulde.db','ulde');

my $dbh = DBI->connect('dbi:Pg(AutoCommit=>0):dbname=ulde.db','ulde');
print "not connected\n" unless $dbh->ping;

if (1) {

  foreach (@{$dbh->selectall_arrayref(qq{select * from legal_sub_categories})}) {
    last;
    my $category_id = $dbh->selectall_arrayref(qq{select distinct category from document_templates where sub_category = $_->[0]});
    print "$_->[0] ---> " . join(', ', map {$_->[0]} grep {$_->[0]} @{$category_id}) . "\n";
    foreach my $category (grep {$_->[0]} @{$category_id}) {
      $dbh->do(qq{insert into category_sub_category_relations values ($category->[0], $_->[0])});
    }
  }
#  $dbh->commit();
  foreach my $pro (@{$dbh->selectall_arrayref(qq{select id from products})}) {
    my ($p, $b, $a, $c, $i) = ('false','false','null','null', 0);
    foreach (@{$dbh->selectall_arrayref(qq{select t.area, t.category, t.personal, t.business from document_templates t, product_document_templates p where p.product = $pro->[0] and p.document_template = t.id})}) {
      ($p, $b, $a, $c) = ($_->[2] ? 'true' : 'false' , $_->[3] ? 'true' : 'false' , $_->[0] || 'null', $_->[1] || 'null') unless $i;
      if ($i++) {
	$p = 'false' unless $_->[2];
        $b = 'false' unless $_->[3];
        $a = 'null' unless $_->[0];
        $c = 'null' unless $_->[1];
      }
    }
    $dbh->do(qq{update products set personal = '$p', business = '$b', category = $c, area = $a where id = $pro->[0]});
  }
  $dbh->commit();
  $dbh->disconnect();
}


if (0) {
open(F,"</opt/ulde/development/Legal_Documents_for_England_and Wales.txt");

my $struct;
my $i = 1;
my $skip = 0;
my @d = ();
foreach (<F>) {
#  if ($skip) { $skip = 0 } else { $skip = 1 }

#  next if $skip;

  next if $_ !~ /\w+/;

  chomp;
  push(@d, $_);
  print "--> push " . $_ . "\n";
  if ($i++ % 4 == 0) {
    print "--> ADD " . join(" | ", @d) . "\n";
    $struct->{$d[0]} = {bp => $d[1], area => $d[2], category => $d[3]};
    @d = ();
  }
}

$not_found = 0;
foreach (keys %{$struct}) {
  my $area_id = $dbh->selectall_arrayref(qq{select id from legal_areas where name = } . $dbh->quote($struct->{$_}->{area}));
  unless (@{$area_id}) {
    $dbh->do(qq{insert into legal_areas (name) values (} . $dbh->quote($struct->{$_}->{area}) . qq{)});
    $area_id = $dbh->selectall_arrayref(qq{select id from legal_areas where name = } . $dbh->quote($struct->{$_}->{area}));
  }
  my $category_id = $dbh->selectall_arrayref(qq{select id from legal_categories where name = } . $dbh->quote($struct->{$_}->{category}));
  unless (@{$category_id}) {
    $dbh->do(qq{insert into legal_categories (name) values (} . $dbh->quote($struct->{$_}->{category}) . qq{)});
    $category_id = $dbh->selectall_arrayref(qq{select id from legal_categories where name = } . $dbh->quote($struct->{$_}->{category}));
  }

  my $template_id = $dbh->selectall_arrayref(qq{select id from document_templates where name = } . $dbh->quote($_));
  print "found -> $template_id->[0][0]\n" if @{$template_id};
  $not_found++ unless @{$template_id};
  my ($p, $b) = ('false','false');
  ($p, $b) = ('true','true') if $struct->{$_}->{bp} eq 'Both';
  $p = 'true' if $struct->{$_}->{bp} eq 'Personal';
  $b = 'true' if $struct->{$_}->{bp} eq 'Business';
  $dbh->do(qq{update document_templates set personal = $p, business = $b, area = $area_id->[0][0], category = $category_id->[0][0] where id = $template_id->[0][0]}) if @{$template_id};
  $dbh->commit();
}

print $not_found . "\n";

# print Dumper($struct) . "\n";
$dbh->disconnect();
} 

die;
my $api = ULDE::Web::Service::REST::Server::ELE->new(
	host		=> 'staging.epoq.co.uk',
	base_urn	=> '/elccs/api.cfm/',
	token		=> '8183d96c-e77f-56f5-ba6d3b04256e8397',
	secret		=> '6081a45bce17e0a3',
	website		=> 'UKLawOnline',
#	format		=> 'json',
#	type            => 'application/xml');
#	type		=> 'multipart/form-data');
#	type		=> 'application/x-www-form-urlencoded');	
);
unless (1) {
$api->create_quick_account(undef,{ customer => {
					customerlogin		=> '',
					customerfirstname	=> '',
					customerlastname	=> '',
					customeremail		=> '',
					customerpassword	=> ''
					}});
}
unless (1) {
$api->update_account({epoq_customer_id => '14543701'} ,{ customer => {
                                        customerlogin           => 'some_login',
                                        customerlastname        => 'Rottenberg',
                                        customeremail           => 'ragnar@signal.bz',
                                        customerpassword        => '1234567890'
                                        }});
}
unless (1) {
$api->create_document({epoq_customer_id => '14543701', epoq_template_id => '4512'}, undef, 1);
}

unless (1) {
$api->get_document_details({epoq_customer_id => '14543701', epoq_document_id => '11276704'});
}

unless (1) {
$api->get_flattened_document({epoq_customer_id => '14543701', epoq_document_id => '11276704'}, {'water_mark_txt','Draft Only'}, 'doc');
}

unless (1) {
$api->update_document({epoq_customer_id => '14543701', epoq_document_id => '11276704'},{ document => { documentpaidoffline => 0 } });
}


unless (1) {
$api->get_documents({epoq_customer_id => '14543701'},{page_no => 2, page_size => 5});
}

unless (1) {
$api->get_templates({page_no => 2, page_size => 5});
}

unless (1) {
$api->get_template_details({epoq_template_id => 4512});
}

unless (1) {
$api->get_templates();
}

unless (0) {
$api->get_products();
}

unless (1) {
$api->get_product_details({epoq_product_id => 10678});
}


#print Dumper($api->{result}->{ele_response}) . "\n";
print scalar @{$api->{result}->{ele_response}->{result}} . "\n";
foreach (@{$api->{result}->{ele_response}->{result}}) {
if (1) {
  my $category_id = $dbh->selectall_arrayref(qq{select id from legal_sub_categories where name = } . $dbh->quote($_->{sub_category}));
  unless (@{$category_id}) {
    $dbh->do(qq{insert into legal_sub_categories (legal_category, name) values (154,} . $dbh->quote($_->{sub_category}) . qq{)});
    $category_id = $dbh->selectall_arrayref(qq{select id from legal_sub_categories where name = } . $dbh->quote($_->{sub_category}));
  }
  $dbh->do(qq{insert into products (name, sub_category) values (} . $dbh->quote($_->{name}) . qq{, $category_id->[0][0])});
  my $product_id = $dbh->selectall_arrayref(qq{select currval('products_id_seq')});
  $product_id = $product_id->[0][0];
  my $last_template_id = undef;
  foreach my $t_id (@{$_->{templates}}) {
    my $template_id = $dbh->selectall_arrayref(qq{select id from document_templates where foreign_template_id = $t_id});
    if (@{$template_id}) {
      $dbh->do(qq{insert into product_document_templates values ($product_id, $template_id->[0][0])});
      $last_template_id = $template_id;
    } else {
      print "--> foreign_template_id not found - product_id: $product_id, foreign_template_id = $t_id, foreign_product_id: $_->{id}\n";
    }
  }
  foreach (@{$dbh->selectall_arrayref(qq{select jurisdiction from document_template_jurisdictions where document_template = $last_template_id->[0][0]})}) {
    $dbh->do(qq{insert into product_jurisdictions values ($product_id, $_->[0])});
  }
  $dbh->do(qq{insert into product_service_definitions values ($product_id, 1)});
  my $service_id = $dbh->selectall_arrayref(qq{select id from service_levels where name ~* '$_->{service_level}'});
  unless (@{$service_id}) {
    $dbh->do(qq{insert into service_levels (name) values (} . $dbh->quote($_->{service_level}) . qq{)});
    $service_id = $dbh->selectall_arrayref(qq{select currval('service_level_id_seq')});
  }
  $dbh->do(qq{insert into product_fees values ($product_id, 1, $service_id->[0][0], '$_->{price}')});
  $dbh->commit();
} else {

  my $category_id = $dbh->selectall_arrayref(qq{select id from legal_sub_categories where name = '$_->{sub_category}'});
  unless (@{$category_id}) { 
    $dbh->do(qq{insert into legal_sub_categories (legal_category, name) values (154, } . $dbh->quote($_->{sub_category}) . qq{)});
    $category_id = $dbh->selectall_arrayref(qq{select id from legal_sub_categories where name = } . $dbh->quote($_->{sub_category}));
  }

  $dbh->do(qq{insert into document_templates (name, description, foreign_template_id, document_assembly_provider, sub_category)
		values (} . $dbh->quote($_->{name}) . qq{, } . ${$_->{description} ? \$dbh->quote($_->{description}) : \'null'} . qq{, $_->{id}, 1, $category_id->[0][0])});

  my $template_id = $dbh->selectall_arrayref(qq{select id from document_templates where foreign_template_id = $_->{id}});

  $dbh->do(qq{insert into document_template_versions (document_template, version, date) 
		values ($template_id->[0][0], '$_->{version}', '$_->{version_date}')}) if $_->{version_date} || $_->{version};

  foreach (@{$_->{jurisdiction}}) {
    $dbh->do(qq{insert into document_template_jurisdictions values ($template_id->[0][0], $_)});
  }
  $dbh->commit();
}
}

$dbh->disconnect();

