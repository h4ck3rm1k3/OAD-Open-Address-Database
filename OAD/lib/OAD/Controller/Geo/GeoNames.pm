package OAD::Controller::Geo::GeoNames;
use Moose;
use namespace::autoclean;

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
    my $result = $c->model('Geo::GeoNames')->search(q => $name, maxRows => 2);
    $c->stash->{template} = 'geonames/search.tt2';
    $c->stash->{geonames} = $result;

#    print " Name: " . $result->[0]->{name};
#    print " Longitude: " . $result->[0]->{lng};
#    print " Lattitude: " . $result->[0]->{lat};

}

=head1 AUTHOR

James Michael DuPont,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

