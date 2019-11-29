package ULDE::Web::Model::Component::DiscountVoucher;
use strict;
use warnings;
use base 'Catalyst::Model::Factory';

__PACKAGE__->config( 
    class       => 'ULDE::Component::DiscountVoucher',
    constructor => 'new',
);

1;
