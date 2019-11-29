package ULDE::Web::Model::Component::ServiceDefinition;
use strict;
use warnings;
use base 'Catalyst::Model::Factory';

__PACKAGE__->config( 
    class       => 'ULDE::Component::ServiceDefinition',
    constructor => 'new',
);

1;
