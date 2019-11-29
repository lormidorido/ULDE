package ULDE::Web::Model::Component::Code;
use strict;
use warnings;
use base 'Catalyst::Model::Factory';

__PACKAGE__->config( 
    class       => 'ULDE::Component::Code',
    constructor => 'new',
);

1;
