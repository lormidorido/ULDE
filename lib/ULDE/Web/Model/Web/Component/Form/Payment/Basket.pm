package ULDE::Web::Model::Web::Component::Form::Payment::Basket;
use strict;
use warnings;
use base 'Catalyst::Model::Factory';

__PACKAGE__->config( 
    class       => 'ULDE::Web::Component::Form::Payment::Basket',
    constructor => 'new',
);

1;
