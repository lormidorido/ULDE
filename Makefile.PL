#!/usr/bin/env perl
# IMPORTANT: if you delete this file your app will not work as
# expected.  You have been warned.
use inc::Module::Install 1.02;
use Module::Install::Catalyst; # Complain loudly if you don't have
                               # Catalyst::Devel installed or haven't said
                               # 'make dist' to create a standalone tarball.

name 'ULDE';
all_from 'lib/ULDE/Web.pm';

requires 'Catalyst::Runtime' => '5.90015';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::Plugin::Cache' => '0.12';
requires 'Catalyst::Action::RenderView';
requires 'Moose' => '2.1402';
requires 'MooseX::ClassAttribute' => '0.27';
# requires 'MooseX::Aliases' => '0.11';
requires 'namespace::autoclean';
requires 'Config::General'; # This should reflect the config file format you've chosen
                 # See Catalyst::Plugin::ConfigLoader for supported formats
test_requires 'Test::More' => '0.88';
# requires 'Catalyst::View::Mason' => '0.18';
requires 'Catalyst::View::Mason2' => '0.03';
requires 'Catalyst::View::JSON' => '0.33';
requires 'Catalyst::View::HTML::Mason' => '0.19';
requires 'Catalyst::Model::Adaptor' => '0.10';
requires 'Catalyst::Model::Factory' => '0.10';
#requires 'IO::Socket::SSL' => '1.76';
requires 'Digest::HMAC_SHA1' => '1.03';
requires 'HTTP::Date' => '6.02';
requires 'HTTP::Response' => '6.04';
requires 'LWP::UserAgent' => '6.06';
requires 'HTML::TokeParser' => '3.69'; # Will be removed when substituted with HTML::Tree
requires 'HTML::Summary' => '0.019';
requires 'HTML::Tree' => '5.03';
requires 'LWP::Protocol::https' => '6.06';
requires 'HTTP::Cookies' => '6.01';
# requires 'Cookie::Baker' => '0.05';
# requires 'CGI::Simple::Cookie' => '1.114';
requires 'URL::Encode' => '0.03';
requires 'URI::Escape' => '3.31';
requires 'URI' => '1.67';
requires 'DBD::Pg' => '2.19.2';
requires 'Class::DBI' => '3.0.17';
requires 'Data::Serializer::Raw' => '0.02';
requires 'MooseX::Traits' => '0.12';
# requires 'SQL::Translator' => '0.11012';
requires 'Catalyst::Helper::Model::DBIC::Schema' => '0.60';
requires 'DBIx::Class::Schema::Loader' => '0.07025';
requires 'Catalyst::Model::DBIC::Schema' => '0.65';
requires 'MooseX::MarkAsMethods' => '0.15';
requires 'MooseX::NonMoose' => '0.22';
requires 'MooseX::UndefTolerant';
requires 'Catalyst::Plugin::Authentication' => '0.10021';
requires 'Catalyst::Authentication::Store::DBIx::Class' => '0.1503';
requires 'Catalyst::Plugin::Authorization::Roles' => '0.09';
requires 'Catalyst::Plugin::Session' => '0.35';
requires 'Catalyst::Plugin::Session::State::Cookie' => '0.17';
requires 'Catalyst::Plugin::Session::Store::DBIC' => '0.12';
requires 'Catalyst::Plugin::DateTime' => '0.03';
requires 'Catalyst::Action::REST' => '1.17';
requires 'Excel::Writer::XLSX' => '0.49';
requires 'Facebook' => '0.102';
#requires 'WWW::Facebook::API' => '0.4.18';
#requires 'Facebook::Graph' => '1.0401';
requires 'Catalyst::Model::Facebook' => '0.101';
requires 'Catalyst::Plugin::Session::Store::FastMmap' => '0.16';
requires 'HTML::FormHandler' => '0.40022';
requires 'HTML::FormHandler::Model::DBIC' => '0.21';
requires 'Data::Dumper';
requires 'Config::ZOMG' => '1.0';
requires 'DateTime::Format::Pg' => '0.16010';
requires 'Text::Stripper' => '1.16';
requires 'List::Util' => '1.41';
requires 'JSON' => '2.90';
requires 'JSON::XS' => '3.01';
requires 'String::MkPasswd' => '0.05';
# requires 'List::MoreUtils' => '0.408';
requires 'Catalyst::TraitFor::Request::BrowserDetect' => '0.02';
catalyst;

install_script glob('script/*.pl');
auto_install;
WriteAll;
