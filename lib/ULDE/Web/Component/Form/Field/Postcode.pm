package ULDE::Web::Component::Form::Field::Postcode;

use utf8;
use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Field::Text';

apply(
	[
		{
			transform => sub { uc( $_[0] ) }
		},
		{
			check 		=> sub { return 1 },
			message		=> 'Not a valid UK Postcode'
		}
	]
);

no HTML::FormHandler::Moose;
__PACKAGE__->meta->make_immutable;
1;