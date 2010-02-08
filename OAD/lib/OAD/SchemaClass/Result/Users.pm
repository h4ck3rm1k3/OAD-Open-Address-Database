package OAD::SchemaClass::Result::Users;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
__PACKAGE__->table("users");
__PACKAGE__->add_columns(
  "id",
  { data_type => "BIGINT", default_value => undef, is_nullable => 0, size => 20 },
  "username",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "password",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "added",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 0,
    size => 19,
  },
);
__PACKAGE__->set_primary_key("id");
# __PACKAGE__->has_many(
#   "addresses_locatedbies",
#   "OAD::SchemaClass::Result::Addresses",
#   { "foreign.locatedby" => "self.id" },
# );
# __PACKAGE__->has_many(
#   "addresses_addedbies",
#   "OAD::SchemaClass::Result::Addresses",
#   { "foreign.addedby" => "self.id" },
# );


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2010-02-07 09:41:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ujLrokDhrmhHgvbIpz+S/g


# You can replace this text with custom content, and it will be preserved on regeneration
1;
