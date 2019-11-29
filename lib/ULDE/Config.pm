package ULDE::Config;

use Moose;
use namespace::autoclean;
use Config::ZOMG;

has config => (
    is   => 'ro',
    isa  => 'Config::ZOMG',
    lazy => 1,
    default => sub {
        my $self = shift;
        my $config = Config::ZOMG->new(
            name => 'ulde_web',
            path => '/var/www/html/uklo/ulde',
        );
        $config->load; # for ->found to work
        return $config;
    },
);

sub as_hash {
    my ($self) = @_;
    return $self->config->load;
}

__PACKAGE__->meta->make_immutable;

1;
