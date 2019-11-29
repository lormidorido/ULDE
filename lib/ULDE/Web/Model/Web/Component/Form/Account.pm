package ULDE::Web::Model::Web::Component::Form::Account;
use strict;
use warnings;
use base 'Catalyst::Model::Adaptor';

__PACKAGE__->config( 
    class       => 'ULDE::Web::Component::Form::Account',
    constructor => 'new',
);

1;
