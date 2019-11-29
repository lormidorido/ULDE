#!/usr/bin/perl

BEGIN {
  push(@INC,'/var/www/html/uklo/ulde/lib');
}

#use ULDE::Web::Service::WebSite::ELE;
#use ULDE::Web::Service::REST::ELE;
#use ULDE::Web::Service::REST::Client;
use Data::Dumper;
use List::Util qw(first);
#use URL::Encode qw(url_params_flat url_decode url_params_mixed);
#use HTML::TreeBuilder 5 -weak;
#use ULDE::Web::Model::DB::ULDE;
#use ULDE::Schema::ULDE;
#use ULDE::Component::Account;
#use ULDE::Config;
#use ULDE::Component;
#use ULDE::Component::Country;
#use ULDE::Web::Component::Form::Account::Register;
#use ULDE::Component::Address;
use ULDE::Component::Customer;
use ULDE::Component::Account::Customer;
use ULDE::Component::ServiceDefinition;
#use ULDE::Component::Provider;
use ULDE::Component::Product;
use ULDE::Interface::DocumentAssembler;
#use ULDE::Utilities;
#use ULDE::Component::LegalArea;
#use ULDE::Component::DocumentAssemblyProvider;
#use ULDE::Component::Product::ServiceDefinition;
#use ULDE::Component::ServiceLevel::Product;
use ULDE::Component::Product::Instance;
#use ULDE::Component::Template::Instance
#use ULDE::Component::Template;
use ULDE::Component::Associate;
use ULDE;
#use URI;
use ULDE::Web::Component::Session;
use ULDE::Utilities;
use ULDE::Interface::DocumentAssembler;
#use DBI;
#use ULDE::Component::ForeignProvider;
#use ULDE::Component::ForeignAccount;
use ULDE::Component::Template::Product;
use ULDE::Component::Product::Template;
#use ULDE::Component::Template;
use ULDE::Component::Template::Instance;
use ULDE::Component::ReviewServiceResponsibility;
use ULDE::Component::Reviewer;
use ULDE::Component::Session;
use ULDE::Component::Product::Instance;
use ULDE::Component::DiscountVoucher;
use ULDE::Component::PurchaseTransaction;
use ULDE::Component::FileStorage;

my $f = ULDE::Component::FileStorage->new;
print $f->storage_root . "\n";
die;
my $instance = ULDE::Component::Template::Instance->new({ id => 585});
$instance->create_flattened_instance;
die;
#my $util = ULDE::Utilities->new;
#$util->migrate_update_account(2421);

die;
my $instance = ULDE::Component::Template::Instance->new({ id => 484 });
$instance->create_flattened_instance('fork');

die;
my $assembler = ULDE::Interface::DocumentAssembler->new;
$assembler->get_flattened_document(53191,'pdf');
print $assembler->response->{doc};
die;
my $instance = ULDE::Component::Template::Instance->new({ id => 484});
# print $instance->get_service_level . "\n";
$instance->change_status(4);
die;
foreach (map { $_->service_level } @{ULDE::Component::ServiceDefinition->new({ id => 4 })->product}) {
	if (grep { $_->ele_service_option } @{$_}) {

		my $sl_1 = first { $_->service_level->id == 1 } @{$_};
		my $sl_2 = first { $_->service_level->id == 2 } @{$_};

		my $cost_1 = do { $sl_1->price =~ /^.(.*?)$/; $1} + do { $sl_2->ele_service_option->price =~ /^.(.*?)$/; $1};
		my $cost_2 = do { $sl_2->price =~ /^.(.*?)$/; $1};
		print $sl_1->product . ' | ' . $cost_1 . ' == ' . $cost_2 . "\n" unless $cost_1 == $cost_2;;
	}
}


die;
my $assembler = ULDE::Interface::DocumentAssembler->new;
$assembler->purchase_product(['anders@gmail.com','pV5br1!Bh'], 837, 52802, {card_number => '4659423491856282', exp_date => '0416', ccv => '628', card_type => 'visa', name_on_card => 'R Castillo', address => '41 Exeter Road', postcode => 'BH2 5AF', amount => '00.65', discount_voucher => 'SL99', voucher_discount => '99'});
print Dumper($assembler->response) . "\n";
# print Dumper($assembler->http_response) . "\n";


die;
my $acc = ULDE::Component::Account::Customer->new({ id => 160 });
print $acc->basket_cost('SL50')->{voucher} . "\n";


die;
my $session = ULDE::Component::Session->new({ id => '8e6fc2236e7b21e6e91b2ed5429d60caaac0ff25' });
# $session->product->[0]->update({ quantity => 3 });
$session->remove_product(4,1015, 3);
# print $session->add_product(4,992,undef,5) . "\n";
# print $session->service_definition . "\n";

die;
#my $assembler = ULDE::Interface::DocumentAssembler->new;
# $assembler->get_products;
#$assembler->get_product_info('838');

#print Dumper($assembler->response) . "\n";

#die;
my $u = ULDE::Utilities->new;
$u->extract_products;




die;
my $sd = ULDE::Web::Component::Session->new({ host => 'shopfront.uklawonline.com' });
print $sd->srv_def->{associate} . "\n";
die;
#my $p_instance = ULDE::Component::Product::Instance->new({id => 242});
#$p_instance->create_template_instance(1786,218);
#my $assembler = ULDE::Interface::DocumentAssembler->new;
#$assembler->create_quick_account(['lalala@tnsn.com','passkdkdkd']);
# die;
my $account = ULDE::Component::Account::Customer->new({id => 94});
my $t = $account->add_product_instance(949)->create_template_instance(1786,218)->foreign_id;
print $t . "\n";
# my $t = $p->create_template_instance(1786,218);

# print ULDE::Component::Account::Customer->new({ id => 0, service_definition => 4, customers => { user_name => 'ragnar@ableworks.co.uk', password => 'bra12BREW' } })->object_created . "\n";

#print ULDE::Component::Account::Customer->new({ id => 0, user_name => 'ragnar@ableworks.co.uk', password => 'bra12BREW'})->object_created . "\n";
die;

if ((my $customer = ULDE::Component::Customer->new({user_name => 'ragnar@sigfnal.bz'}))->count) {
	print $customer->first_name . "\n";
	print $customer->role->[0]->name . "\n";
}


die;
my $pro_ins = ULDE::Component::Product::Instance->new({ id => 221 });
print $pro_ins->is_pack . "\n";
print $pro_ins->name . "\n";
die;
#my $assembler = ULDE::Interface::DocumentAssembler->new;
#$assembler->change_document_status('50834',3,4,'fork');
#die;
#my $srv_def = ULDE::Component::ServiceDefinition->new({id => 4});
#my $p = [grep { $_->business } @{$srv_def->product}];
#print scalar @{$p} . "\n";
#print $srv_def->product->[0]->name . "\n";
#die;
#my $resp = ULDE::Component::ReviewServiceResponsibility->new({ id => 1});
#print scalar @{$resp->product_instance} . "\n";
#die;
#my $r = ULDE::Component::Reviewer->new({ id => 1});
#print scalar @{$r->product_instance} . "\n";
#die;
#my $pp = ULDE::Component::Product::Instance->new({ id => 124});
#print $pp->associate->name . "\n" if $pp->associate;
#die;
#my $account = ULDE::Component::Account::Customer->new({ id => 126});
#print scalar @{$account->product} . "\n";
#my $prod = $account->product->[0];
#print $prod->name . "\n";
#print $prod->added . "\n";

#$prod->create({ event_logs => {
#						event_id => 1,
#						detail => 'review'
#				}});
#die;
#my $assembler = ULDE::Interface::DocumentAssembler->new;
# $assembler->get_client_documents(['ragnar@signal.bz', 'bbggttrr']);
#$assembler->get_client_documents(['bookers@uklo.co.uk', 'halifax2']);
#print Dumper($assembler->response) . "\n";
#die;
#my $ass = ULDE::Interface::DocumentAssembler->new;
#$ass->submit_document(50784);
#die;
#my $ok_now = ULDE::Component::Template::Product->new({ id => 1786, product => 949 });
#print $ok_now->count . "\n";

# my $templ = ULDE::Component::Template->new({id => 1786});
#print $templ->count . "\n";

#my $test_t = ULDE::Component::Template::Product->new({ id => 1786, product => 949});
#print $test_t->product . "\n";
# $test_t->retrieve(1786);
#print $test_t->count . "\n";
#print $test_t->description . "\n";
#$test_t->update({ description => 'some description'});
#print $test_t->description . "\n";


#my $test_p = ULDE::Component::Product::Template->new({ id => 949, document_template => 1786});
# $test_p->retrieve(949);
#print $test_p->count . "\n";
#print $test_p->description . "\n";
#$test_p->update({ description => undef });
#print $test_p->description . "\n";

#my $product = ULDE::Component::Product->new({id => 949});
#print scalar @{$product->template} . "\n";
#print $product->template->[0]->description . "\n";
#print $product->template->[0] . "\n";

# my $template = ULDE::Component::Template->new({id => 1787});
#die;
my $util = ULDE::Utilities->new;
$util->migrate_update_account(31216,5);

die;
my $fp = ULDE::Component::ForeignProvider->new({id => 1});
print $fp->name . "\n";
print scalar @{$fp->foreign_account} . "\n";
die;
my $ele = ULDE::Interface::DocumentAssembler->new;
$ele->get_account_password('23376',1);
print Dumper($ele->response);
die;
my $dbh = DBI->connect('dbi:Pg(AutoCommit=>0):dbname=ulde.db','ulde');

die unless $dbh->ping;

open (F,"</home/ulde/docs_etc/template_prices.txt");
foreach (<F>) {
chomp;
my @d = split("\t",$_);
next unless $d[0] =~ /^\d/;
my $p = $dbh->selectall_arrayref(qq{select product from product_document_template where document_template = $d[0]});
print "multiple: " . $d[0] . "\n" if @{$p} > 1;
next if @{$p} > 1;
#print pop(@d) . "\n";
#print $p->[0][0] . "\n";
my $price = pop(@d);
$price =~ s/^(.*).$/$1/;
#chomp $price;
#print '|' . $price . "|\n";
#print qq{update product_service_level set price = '} . $price . qq{' where service_level = 2 and product = $p->[0][0]} . "\n";
$dbh->do(qq{update product_service_level set price = '} . $price . qq{' where service_level = 2 and product = $p->[0][0]});
$dbh->commit;
}

close F;
$dbh->disconnect();

die;

die;
my $rapidocs = ULDE::Web::Service::WebSite::ELE->new;
$rapidocs->get_rapidocs(1793);
print $rapidocs->success . "\n";
die;
my $products = ULDE::Component::Product->new({ all => 1});
print $products->count . "\n";

foreach ($products->all) {
	$products->retrieve($_->id);
	print $_->id . "\n" if $products->is_pack;
}
die;
my $sd = ULDE::Component::ServiceDefinition->new({id => 4});
print scalar @{$sd->product} . "\n";
die; 
my $country = ULDE::Component::Country;
# print $country->name . "\n";
die;
#my $instance = ULDE::Component::Product::Instance->new({id => 1});
#$instance->create({template_instances => {template => 1786}});
#print $instance . "\n";

# die;
my $ca = ULDE::Component::Account::Customer->new({id => 94});
$ca->create({customer_account_products => { service_level => 2, product => 949, service_definition => 4}});
#print "products: " . scalar @{$ca->product} . "\n";
die;
my $u = ULDE::Utilities->new;
$u->extract_products;
die;
#my $ro = $ulde->ulde_schema->resultset('Customer')->find(218)->add_to_addresses('line_1' => 'lsls', country => 323, town => 'town', postcode => 'postcode');
#my $link_ro = $ulde->ulde_schema->resultset('Customer')->find(218)->find_related('customer_addresses', {customer => 218, address => $ro->id});
my @struct = $ulde->ulde_schema->resultset('ProductServiceDefinition')->result_source->primary_columns;
print Dumper($ulde->ulde_schema->resultset('ProductServiceDefinition')->result_source->columns_info(\@struct)) . "\n";
# print $link_ro->result_source->name . "\n";

# print $ro->result_source->name . "\n";
#$ro->delete;
die;
my $account = ULDE::Component::Account::Customer->new({id => 94 });
#$account->create({customers => { account => 94, title => 'Mr', first_name => 'Ragnar', user_name => 'ragnar@able.works', password => 'bra4hund', 
#	addresses => [	[{ line_1 => 'Flat 1, Loreto',, line_2 => '41 Cavendish Road', town => 'Bournemouth', postcode => 'BH1 1QZ', country => 409}],
#									[{ line_1 => 'Vallgatan 23', town => 'Gothenburg', postcode => '411 16', country => 368}]]}});
print "customers: " . scalar @{$account->customer} . "\n";
#$account->customer->[0]->update({dob => '10 aug 1978'});
print "products: " . scalar @{$account->product} . "\n";
die;
#print Dumper($account->customer->[0]->dob) . "\n";

#print $sd->product->[0]->name . "\n";
# $sd->product->[0]->update({description => 'new descritpiopfds'});
#$sd->product->[0]->service_level->[0]->update({description => 'hohoho', price => '43'});

#print $sd->product->[0]->service_level->[0]->price . ' | ' . $sd->product->[0]->service_level->[0]->max_price . ' | ' . $sd->product->[0]->service_level->[0]->name . "\n";
#print $sd->product->[0]->service_level->[0]->description . "\n";
#$sp->update({active => 0});
# $sp->update({description => undef});
#print $sp->name . ' | ' . $sp->active . ' | ' . $sp->description . "\n";
#die;
my $prod = ULDE::Component::Product::ServiceDefinition->new({id => 797, service_definition => 4});
#$prod->update({name => 'dsads'});
print $prod->name . "\n";
print scalar @{$prod->service_level} . "\n";

die;
my $comp = ULDE::Component->new({by_pass_constr => 1});
#my $rs = $comp->ulde_schema->resultset('ProductServiceDefinition')->search(
#		{ service_definition => 4},
#		{ prefetch => 'product'}
#	);
my $rs = $comp->ulde_schema->resultset('ProductServiceDefinition')->search({ service_definition => 4})->search_related('product');
# print $rs->count . "\n";
while (my $ro = $rs->next) {
#	print Dumper($ro);
#	$ro->product->update({ name => 'hho'});
	print $ro->name . ' | ' .  $ro->name . "\n";
}

die;
my $u = ULDE::Utilities->new;
$u->extract_products;

#die;
#my $c = ULDE::Component::Customer->new({ id => 209 });
#print $c->first_name . "\n";
#$c->delete;
die;
#my $comp = ULDE::Component->new;
#my $source = $comp->ulde_schema->resultset('Customer')->result_source;

#print Dumper($source->related_source('customer_addresses')->relationships) . "\n";
# my $c = ULDE::Component::Customer->new({ id => 0, account => 1, title => 'mm', first_name => 'dddd', user_name => int(rand(100)), password => 'fsdfdsf', addresses => [[{ line_1 => 'linfeffwfff 1', town => 'town', postcode => 'postcode', country => 264}],[{ line_1 => 'linwwe 1', town => 'town', postcode => 'postcode', country => 264}]]});
# my $p = ULDE::Component::Provider->new({ id => 1});
# print $p->name . "\n";
# die;

#my $sd = ULDE::Component::ServiceDefinition->new({ id => 1});
#print $sd->result_object->product_service_definitions . "\n";
#my @products = $sd->result_object->product_service_definitions;
#print $products[0]->active . "\n";
#die;
#my $acc = ULDE::Component::Account::Customer->new({ id => 94});
# $acc->customer->[0]->create({ addresses => [{ line_1 => 'Vallgatan 23', town => 'Gothenburg', country => 368, postcode => '411 16'}]});
#print $#{$acc->customer->[0]->address} . "\n";
#print $acc->customer->[0]->account->created;
# $acc->customer->[0]->address_h->{166}->delete;
#print $acc->customer->[0]->address_h->{166};
#print $#{$acc->customer->[0]->address} . "\n";
#print $acc->customer->[0]->roles;
# $acc->customer->[0]->address->[1]->delete;
# my $acc = ULDE::Component::Account::Customer->new({ id => 0, service_definition => 4, customers => { title => 'Mr', first_name => 'Ragnar', surname => 'Castillo', user_name => 'ragnar@able.works', password => 'bra12brew', roles => [1], addresses => [{ line_1 => 'Flat 1, Loreto', line_2 => '41 Cavendish Road', town => 'Bournemouth', postcode => 'BH1 1QZ', country => 409 }] }});
# my $acc = ULDE::Component::Account::Customer->new({ id => 0, service_definition => 4, customers => { ROWS => [{ title => 'mm', first_name => 'dddd', user_name => int(rand(100)), password => 'fsdfdsf'},{ title => 'mm', first_name => 'dddd', user_name => int(rand(100)), password => 'fsdfdsf'}]}  });
#print Dumper($acc->result_object->get_inflated_column('created')) . "\n";
#print $#{$acc->customer} . "\n";
#print $acc->created . "\n";
# $acc->delete;

#my $acc = ULDE::Component::Account::Customer->new({ id => 94});
# $acc->retrieve(94);
#print $acc->service_definition->url . "\n";
#print $acc->customer->[0]->address->[0]->country->name . "\n";
#$acc->customers->delete;
# $acc->customer->[0]->delete;
# $acc->create({ customers => { title => 'Mr', first_name => 'Ragnar', surname => 'Castillo', user_name => 'ragnar@ableworks.co.uk', password => 'bra12brew', roles => [4], addresses => [{ line_1 => 'Flat 2, Loreto', line_2 => '41 Cavendish Road', town => 'Bournemouth', postcode => 'BH1 1QZ', country => 409 }] }});
#die;
# die;

#my $a = ULDE::Component::Address->new({id => 60});


#die;
# my $c = ULDE::Component::Customer->new({ id => 0, account => 1, title => 'mm', first_name => 'dddd', user_name => int(rand(100)), password => 'fsdfdsf', addresses => [[{ line_1 => 'lineffwfff 1', town => 'town', postcode => 'postcode', country => 264}],[{ line_1 => 'linwwe 1', town => 'town', postcode => 'postcode', country => 264}]]});

#print $#{$c->address} . "\n";
# $c->result_object->addresses->delete;
# $c->delete;
#print $#{$c->address} . "\n";
#print $c->address->[0]->line_1 . "\n";

# die;
#my $c = ULDE::Component::Customer->new({ id => 45 });
#$c->delete;
#print $#{$c->address} . "\n";
#print $c->address->[0]->postcode . "\n";
#print $c->address->[0]->update({ postcode => 'postcode 4' }) . "\n";
#print $c->address->[0]->postcode . "\n";
#$c->create({ addresses => [[{ line_1 => 'YEedddfffsS 2"!', town => 'town', postcode => 'postcode', country => 255}], [{ line_1 => 'YESdddfff@£e 1!', town => 'town', postcode => 'postcode', country => 255}]] });
#print $#{$c->address} . "\n";
#$c->retrieve(46);
#print $#{$c->address} . "\n";

 # print Dumper($c->result_object) . "\n";

# my $c = ULDE::Component::Address->new({ id => 0, line_1 => 'line 1', town => 'town', postcode => 'postcode', country => {267});
#print $c->first_name . "\n";
#print $c->address . "\n";
#print $c->address->postcode . "\n" if $c->address;
#$c->address->update({ postcode => 'CODE'}) if $c->address;
#$c->address->delete if $c->address;
#$c->create({ address => { line_1 => 'line 1', town => 'town', postcode => 'postcode', country => 267}}) unless $c->address;
# print $c->address->postcode . "\n" if $c->address;
# 
# my $a = ULDE::Component::Address->new({id => 0, line_1 => 'line 1', town => 'town', postcode => 'code', country => 251});

#my $a = ULDE::Component::Address->new({id => 44});
#print $a->country->name . "\n";
#$a->retrieve(46);
#print $a->country->name . "\n";

#my $c = ULDE::Component::Customer->new({id => 3});
# print $address->country->name . "\n";
#$address->update({ postcode => 'SW7 6TR'});
# $address->delete;

#print $c->address->new . "\n";

#$address->update({postcode => 'SW7 1PR'});

#print $address->postcode . "\n";
# $address->retrieve(2);
# $country->search;
#print $address->country . "\n";
# print $address->country->name . "\n";
# $address->store;

#die;
#my $comp = ULDE::Component->new;
#my $rs = $comp->ulde_schema->resultset('Customer');
#print $rs->find(3)->get_column('first_name') . "\n";

# print Dumper($comp->ulde_config) . "\n";

#my $t = ULDE::Schema::ULDE->connect('dbi:Pg:dbname=ulde.db', 'ulde', '');
#my $acc = $t->resultset('CustomerAccount')->find(1);
#print $acc->get_column('created') . "\n";

# print Dumper($t->resultset('CustomerAccount')->find(1)) . "\n";


#die;
#my $t = ULDE::Web::Service::REST::ELE->new;

#my $assembler = ULDE::Interface::DocumentAssembler->new;

#$assembler->get_templates;
#print Dumper($assembler->result->ele_response);

#die;

my $con = ULDE::Web::Service::WebSite::ELE->new;
#$con->create_quick_account(['ragnar@bcs.org','bra4hund']);
#print $con->result->{ele_response}->{client_id} . "\n" if $con->result->{success};
#$con->update_account(29498,{first_name => 'Skuli',surname => '',biz_name => 'AbleWorks',email => 'ragnar@bcs.org',address => '41 Cavendish Road',postcode => '', phone => '',dob => '10/08/1973'});
#$con->get_account_details(29498);
#print Dumper($con->result->{ele_response}) . "\n";
#$con->get_account_password(29498);
#print Dumper($con->result->{ele_response}) . "\n";
#$con->create_document(29498,796);
#$con->get_session_cookie('ceci@signal.bz','bra4hund');
# $con->submit_document(47817);
#$con->delete_document(47816);
#$con->get_global_options();
#$con->get_option_description(2037);
#$con->get_product_info(1036);
# $con->get_templates;
$con->get_product_info(931);

print Dumper($con->result->ele_response);
# print scalar @{$con->result->{ele_response}->{result}->{templates}} . "\n";

#$con->update_account(['ceci@signal.bz','bra4hund'],{first_name => 'Ceci', surname => 'Castillo', email => 'ceci@signal.bz' ,address => "address\nhoho\nok good good",postcode => 'BH1 1QZ',phone => '07715083647',dob => '21/02/85'},{action => 'update', laction => 6});
#print join("\n", @{$con->result->{ele_response}->{error_descr}}) . "\n" unless $con->result->{success};

#$con->_customer_log_in(['ragnar@bcs.org.uk','bra4hund']);
#print Dumper($con->result->{ele_response}->{result}->{cookie_jar}) if $con->get_session_cookie(['ragnar@bcs.org.uk','bra4hund']);
#print Dumper($con->get_documents(['ragnar@bcs.org.uk','bra4hund'])) . "\n";
#print Dumper($con->result->{ele_response}) . "\n";

#print Dumper(url_params_mixed('r45/assembler.asp?action=m&firm=EAC0C656&amp;id=47795')) . "\n";

#$con->_get_random_password;
