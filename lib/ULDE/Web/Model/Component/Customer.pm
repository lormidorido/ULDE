package ULDE::Web::Model::Component::Customer;
use strict;
use warnings;
use base 'Catalyst::Model::Factory';

__PACKAGE__->config( 
    class       => 'ULDE::Component::Customer',
    constructor => 'new',
);

1;
