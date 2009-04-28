use inc::Module::Install;

# Define metadata
name           'Most-Util';
all_from       'lib/Most/Util.pm';

requires       'Scalar::Util'  => '0';
requires       'List::Util'  => '0';
requires       'List::MoreUtils'  => '0';
requires       'Hash::Util'  => '0';
requires       'Data::Structure::Util'  => '0';

test_requires  'Test::More'  => '0';

license 'perl';

WriteAll;
