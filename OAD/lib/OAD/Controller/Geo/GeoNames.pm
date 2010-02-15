package OAD::Controller::Geo::GeoNames;
use Moose;
use namespace::autoclean;
use Data::Dumper;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

OAD::Controller::Geo::GeoNames - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched OAD::Controller::Geo::GeoNames in Geo::GeoNames.');
}

sub  search  : Local :Args(1) 
{
    my ( $self, $c ,$name ) = @_;
    my $result = $c->model('Geo::GeoNames')->search(q => $name, maxRows => 1);

    $c->stash->{openlayers}{center}{lat} = $result->[0]->{"lat"};
    $c->stash->{openlayers}{center}{lon} = $result->[0]->{"lng"};

    $c->stash->{template} = 'openlayers/basic.tt2';

}

=head1 AUTHOR

James Michael DuPont,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

