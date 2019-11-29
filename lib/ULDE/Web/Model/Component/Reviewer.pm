package ULDE::Web::Model::Component::Reviewer;
use strict;
use warnings;
use base 'Catalyst::Model::Factory';

__PACKAGE__->config( 
    class       => 'ULDE::Component::Reviewer',
    constructor => 'new',
);

1;
