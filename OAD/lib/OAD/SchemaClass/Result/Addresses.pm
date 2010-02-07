package OAD::SchemaClass::Result::Addresses;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
__PACKAGE__->table("addresses");
__PACKAGE__->add_columns(
  "id",
  { data_type => "BIGINT", default_value => undef, is_nullable => 0, size => 20 },
  "street",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "suburb",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "state",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "country",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "lat",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "lon",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "addedby",
  { data_type => "BIGINT", default_value => undef, is_nullable => 0, size => 20 },
  "locatedby",
  { data_type => "BIGINT", default_value => undef, is_nullable => 0, size => 20 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->belongs_to(
  "locatedby",
  "OAD::SchemaClass::Result::Users",
  { id => "locatedby" },
);
__PACKAGE__->belongs_to(
  "addedby",
  "OAD::SchemaClass::Result::Users",
  { id => "addedby" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2010-02-07 09:41:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:5v8UXyjpDZmFbnSJlTkRTg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
