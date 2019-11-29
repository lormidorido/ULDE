package ULDE::Web::Model::Web::Component::Form::Product::MainCategory;
use strict;
use warnings;
use base 'Catalyst::Model::Adaptor';

__PACKAGE__->config( 
    class       => 'ULDE::Web::Component::Form::Product::MainCategory',
    constructor => 'new',
);

1;
