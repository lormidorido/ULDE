package ULDE::Web::Model::Web::Component::Form::Template;
use strict;
use warnings;
use base 'Catalyst::Model::Adaptor';

__PACKAGE__->config( 
    class       => 'ULDE::Web::Component::Form::Template',
    constructor => 'new',
);

1;
