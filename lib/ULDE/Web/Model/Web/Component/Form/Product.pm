package ULDE::Web::Model::Web::Component::Form::Product;
use strict;
use warnings;
use base 'Catalyst::Model::Adaptor';

__PACKAGE__->config( 
    class       => 'ULDE::Web::Component::Form::Product',
    constructor => 'new',
);

1;
