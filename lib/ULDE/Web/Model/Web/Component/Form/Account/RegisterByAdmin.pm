package ULDE::Web::Model::Web::Component::Form::Account::RegisterByAdmin;
use strict;
use warnings;
use base 'Catalyst::Model::Adaptor';

__PACKAGE__->config( 
    class       => 'ULDE::Web::Component::Form::Account::RegisterByAdmin',
    constructor => 'new',
);

1;
