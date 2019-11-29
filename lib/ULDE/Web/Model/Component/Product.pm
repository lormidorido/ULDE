package ULDE::Web::Model::Component::Product;
use strict;
use warnings;
use base 'Catalyst::Model::Factory';

__PACKAGE__->config( 
    class       => 'ULDE::Component::Product',
    constructor => 'new',
);

1;
