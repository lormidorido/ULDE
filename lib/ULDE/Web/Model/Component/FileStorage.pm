package ULDE::Web::Model::Component::FileStorage;
use strict;
use warnings;
use base 'Catalyst::Model::Factory';

__PACKAGE__->config( 
    class       => 'ULDE::Component::FileStorage',
    constructor => 'new',
);

1;
