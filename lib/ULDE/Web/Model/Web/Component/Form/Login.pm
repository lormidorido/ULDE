package ULDE::Web::Model::Web::Component::Form::Login;
use strict;
use warnings;
use base 'Catalyst::Model::Adaptor';

__PACKAGE__->config( 
    class       => 'ULDE::Web::Component::Form::Login',
    constructor => 'new',
);

1;
