package ULDE::Web::Model::Component::Template::Instance;
use strict;
use warnings;
use base 'Catalyst::Model::Factory';

__PACKAGE__->config( 
    class       => 'ULDE::Component::Template::Instance',
    constructor => 'new',
);

1;
