# IMPORTANT: if you delete this file your app will not work as
# expected.  you have been warned
use inc::Module::Install;

name 'OAD';
all_from 'lib/OAD.pm';

requires 'Catalyst::Runtime' => '5.80013';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::Action::RenderView';
requires 'Catalyst::Plugin::AutoCRUD';
requires 'Config::JFDI';
requires 'Geo::GeoNames';
requires 'Catalyst::View::TT';
requires 'DBIx::SQLEngine';
requires 'DBD::CSV';

requires 'parent';
requires 'SQL::Translator'
requires 'Config::General'; # This should reflect the config file format you've chosen
                 # See Catalyst::Plugin::ConfigLoader for supported formats
catalyst;

install_script glob('script/*.pl');
auto_install;
WriteAll;
