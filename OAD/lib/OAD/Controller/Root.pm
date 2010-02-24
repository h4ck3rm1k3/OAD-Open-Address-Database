package OAD::Controller::Root;

use strict;
use warnings;
use parent 'Catalyst::Controller';
use Data::Dumper;
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


sub DoImport
{
    my ( $self, $c, $source_name, $results ) = @_;
#    $c->model('FilmDB')->schema; 
    warn "source $source_name";
#    warn "results " . Dumper($results);
    my $rs = $c->model($source_name);
    my $schema = $rs->result_class();

    foreach my $row (@{$results}) # array of hashes
    {


	my $obj = {}; #= 

	foreach my $k (keys %{$row})
	{	    
#	    $rs
	    my $val=$row->{$k};
	    if ($rs->result_source()->has_column(lc($k)))
	    {
		warn "adding $k and $val";
		$obj->{lc($k)}=$val;
	    }
	    else
	    {
		warn "Skipping not in model $k and $val";
	    }
	}

	if ($obj->{street} )
	{
#	    $obj->{addedby} = 1;
	    $obj->{suburb}   = $obj->{suburb}   || "NULl";
#	    $obj->{street}   = $obj->{street}   || "NULl";
	    $obj->{state}   = $obj->{state}   || "NULl";
	    $obj->{country}= $obj->{country} || "NULl";
	    $rs->create($obj);
	}
	else
	{
	    warn "skipping results " . Dumper($row);	    
	    warn "skipping object " . Dumper($obj);	    
	}
    }
    return $results;
}

sub Import :Local :Args(2)
{
    my ( $self, $c, $source, $file ) = @_;
    $c->stash->{filename} = $file;
    $c->stash->{source} = $source;
    
    $c->stash->{results} =  DoImport($self,$c, $source, $c->model("DBI::CSV")->file($file));
    
    $c->stash->{template} = 'geonames/import.tt2';


}


sub Controller :Local 
{
    my ( $self, $c, ) = @_;
   
   
    $c->stash->{template} = 'openlayers/controller.tt2';


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
