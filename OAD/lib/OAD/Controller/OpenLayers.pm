package OAD::Controller::OpenLayers;

use strict;
use warnings;
use parent 'Catalyst::Controller';

=head1 NAME

OAD::Controller::OpenLayers - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched OAD::Controller::OpenLayers in OpenLayers.');
}
sub basic : Local :Args(2){
        my ($self, $c, $lat, $lon) = @_;

        $c->stash->{openlayers}{center}{lat} = $lat;
        $c->stash->{openlayers}{center}{lon} = $lon;
#	$c->stash(current_view => "TT");
        # Set the TT template to use.  You will almost always want to do this
        # in your action methods (action methods respond to user input in
        # your controllers).
        $c->stash->{template} = 'openlayers/basic.tt2';
    }




=head1 AUTHOR

James Michael DuPont,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
