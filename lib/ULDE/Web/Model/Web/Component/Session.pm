package ULDE::Web::Model::Web::Component::Session;
use strict;
use warnings;
use base 'Catalyst::Model::Factory';

__PACKAGE__->config( 
    class       => 'ULDE::Web::Component::Session',
    constructor => 'new',
);

1;
