#!/usr/bin/env perl
#derived from /usr/local/bin/mojomojo_spawn_db.pl
# Copyright (c) 2007 Jonathan Rockway <jrockway@cpan.org>

BEGIN { $ENV{CATALYST_DEBUG} = 0 }
use strict;
use warnings;
use FindBin '$Bin';
use lib "$Bin/../lib";
use OAD::SchemaClass;
use Config::JFDI;
use Getopt::Long;
use Data::Dumper;
my $modelkey = 'Model::AutoCRUD::DBIC';
my ( $dsn, $user, $pass );

my $help;
GetOptions(
    'help'             => \$help,
    'dsn:s'            => \$dsn,
    'db-user:s'        => \$user,
    'db-password:s'    => \$pass,
);

if ($help) {
    print <<"EOF";

oad_deploy.pl ...

This script looks in the oad.conf file for database connection
info if none is passed on the command line. Set the OAD_CONFIG
environment variable to tell it where the file is.

Accepts the following options:
  --dsn              Default taken from mojomojo.conf
  --db-user          Default taken from mojomojo.conf
  --db-password      Default taken from mojomojo.conf

EOF

    exit;
}

my $jfdi = Config::JFDI->new(name => "oad");
my $config = $jfdi->get;
warn Dumper($config);
eval {
    if (!$dsn) {
        if (ref $config->{$modelkey}->{'connect_info'}) {
            ($dsn, $user, $pass) =
                @{ $config->{$modelkey}->{'connect_info'} };
        } else {
            $dsn = $config->{$modelkey}->{'connect_info'};
        }
    };
};
if($@){
    die "Your DSN line in oad.conf doesn't look like a valid DSN.".
      "  Add one, or pass it on the command line.";
}
die "No valid Data Source Name (DSN).\n" if !$dsn;
$dsn =~ s/__HOME__/$FindBin::Bin\/\.\./g;

my $schema = OAD::SchemaClass->connect($dsn, $user, $pass) or 
  die "Failed to connect to database";
  
# Check if database is already deployed by  
# examining if the table Person exists and has a record.
eval {  $schema->resultset('OAD::SchemaClass::Result::Addressses')->count };
if (!$@ ) {
    die "You have already deployed your database\n";
}

print <<"EOF";

Creating a new database ...

  dsn:            $dsn
  user:           $user

EOF

print "Deploying schema to $dsn\n";
#$schema->deploy;

# deploy the database    
    $schema->deploy(
	{
	    producer_args => {
		mysql_version => '5.0.50',
	    },	    
	    add_drop_table => 1 
	}
	);
mkdir "sql" unless  -d "sql";
# create a snapshot directory
    $schema->create_ddl_dir(
	['MySQL',"PostgreSQL"], '1.1', './sql', 0, 
	{producer_args
	     => {mysql_table_type => 'MyISAM'
	 }
	});

#$schema->create_initial_data($config, \%opts);
