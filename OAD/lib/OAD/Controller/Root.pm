package OAD::Controller::Root;

use strict;
use warnings;
use parent 'Catalyst::Controller';

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config->{namespace} = '';

=head1 NAME

OAD::Controller::Root - Root Controller for OAD

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=cut

=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    # Hello World
    $c->response->body( $c->welcome_message );
}

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

sub upload : Global {
    my ($self, $c) = @_;
    
    if ( $c->request->parameters->{form_submit} eq 'yes' ) {
	
	if ( my $upload = $c->request->upload('my_file') ) {
	    
	    my $filename = $upload->filename;
	    my $target   = "/tmp/upload/$filename";
	    
	    unless ( $upload->link_to($target) || $upload->copy_to($target) ) {
		die( "Failed to copy '$filename' to '$target': $!" );
	    }
	}
    }
    
    $c->stash->{template} = 'geonames/upload.tt2';
}

sub view :Local :Args(1)
{
    my ( $self, $c, $file ) = @_;
    $c->stash->{filename} = $file;

    $c->stash->{results} =  $c->model("DBI::CSV")->file($file);
    
    $c->stash->{template} = 'geonames/view.tt2';


}
=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

James Michael DuPont,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
