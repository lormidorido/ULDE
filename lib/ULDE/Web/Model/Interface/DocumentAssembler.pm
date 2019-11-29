package ULDE::Web::Model::Interface::DocumentAssembler;
use strict;
use warnings;
use base 'Catalyst::Model::Factory';

__PACKAGE__->config( 
    class       => 'ULDE::Interface::DocumentAssembler',
    constructor => 'new',
);

1;
