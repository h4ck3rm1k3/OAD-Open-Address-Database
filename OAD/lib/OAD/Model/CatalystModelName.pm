package OAD::Model::CatalystModelName;

use strict;
use base 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'OAD::SchemaClass',
    connect_info => [
        'dbi:mysql:OAD',
        'root',
        'yavVugIxJon0',
        
    ],
);

=head1 NAME

OAD::Model::CatalystModelName - Catalyst DBIC Schema Model
=head1 SYNOPSIS

See L<OAD>

=head1 DESCRIPTION

L<Catalyst::Model::DBIC::Schema> Model using schema L<OAD::SchemaClass>

=head1 AUTHOR

James Michael DuPont,,,

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
