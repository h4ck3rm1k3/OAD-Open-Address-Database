package OAD::Model::DBI::CSV;
use Moose;
use namespace::autoclean;
use DBIx::SQLEngine;
use DBD::CSV;
extends 'Catalyst::Model';

=head1 NAME

OAD::Model::DBI::CSV - Catalyst Model

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
        $self->{db} =  DBIx::SQLEngine->new( 'dbi:CSV:f_dir=/tmp/upload/' );
        bless $self, $class;
        return $self;
    }

sub file
{
    my $self=shift;
    my $table=shift;

    $self->{db}->fetch_select( 
	table => $table
	);
}

__PACKAGE__->meta->make_immutable;

