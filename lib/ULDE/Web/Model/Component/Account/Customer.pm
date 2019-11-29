package ULDE::Web::Model::Component::Account::Customer;
use strict;
use warnings;
use base 'Catalyst::Model::Factory';

__PACKAGE__->config( 
    class       => 'ULDE::Component::Account::Customer',
    constructor => 'new',
);

1;
