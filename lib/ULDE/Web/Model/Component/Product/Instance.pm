package ULDE::Web::Model::Component::Product::Instance;
use strict;
use warnings;
use base 'Catalyst::Model::Factory';

__PACKAGE__->config( 
    class       => 'ULDE::Component::Product::Instance',
    constructor => 'new',
);

1;
