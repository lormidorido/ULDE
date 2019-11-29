package ULDE::Web::Model::Web::Component::Form::Account::Update;
use strict;
use warnings;
use base 'Catalyst::Model::Adaptor';

__PACKAGE__->config( 
    class       => 'ULDE::Web::Component::Form::Account::Update',
    constructor => 'new',
);

1;
