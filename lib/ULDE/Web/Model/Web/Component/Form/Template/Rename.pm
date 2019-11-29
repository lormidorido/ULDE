package ULDE::Web::Model::Web::Component::Form::Template::Rename;
use strict;
use warnings;
use base 'Catalyst::Model::Adaptor';

__PACKAGE__->config( 
    class       => 'ULDE::Web::Component::Form::Template::Rename',
    constructor => 'new',
);

1;
