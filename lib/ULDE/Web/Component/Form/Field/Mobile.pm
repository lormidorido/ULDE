package ULDE::Web::Component::Form::Field::Mobile;

use utf8;
use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Field::Text';

apply(
			[
				{
					check 		=> sub { return 1 },
					message		=> 'Not a valid UK Mobile Number'
				}
			]
		);

no HTML::FormHandler::Moose;
__PACKAGE__->meta->make_immutable;
1;
