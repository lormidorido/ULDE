package ULDE::Web::Model::Web::Component::Form::Reviewer;
use strict;
use warnings;
use base 'Catalyst::Model::Adaptor';

__PACKAGE__->config( 
    class       => 'ULDE::Web::Component::Form::Reviewer',
    constructor => 'new',
);

1;
