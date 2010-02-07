
#create the basics
catalyst.pl OAD

cd OAD

echo create the database scheme, user is $1 pass is $2
script/oad_create.pl model CatalystModelName DBIC::Schema OAD::SchemaClass create=static dbi:mysql:OAD $1 $2

script/oad_create.pl view TT TT
