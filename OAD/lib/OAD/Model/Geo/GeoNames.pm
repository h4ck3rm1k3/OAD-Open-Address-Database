package OAD::Model::Geo::GeoNames;
use Moose;
use namespace::autoclean;
use Geo::GeoNames;

extends 'Catalyst::Model';

=head1 NAME

OAD::Model::Geo::GeoNames - Catalyst Model

=head1 DESCRIPTION

Catalyst Model.

=head1 AUTHOR

James Michael DuPont,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

sub new {
        my $class = shift;
        my $self = {};
        $self->{geo} = new Geo::GeoNames();
        bless $self, $class;
        return $self;
    }

sub search
{
    my $self=shift;
    return $self->{geo}->search(@_);
}

__PACKAGE__->meta->make_immutable;

