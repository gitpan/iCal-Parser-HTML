use Module::Build 0.26;
# $Id: Build.PL,v 1.5 2005/01/04 21:38:25 rick Exp $
# See perldoc Module::Build for details of how this works
my $build=
Module::Build->new
    ( module_name     => 'iCal::Parser::HTML',
      version_from    => 'iCal::Parser::HTML',
      requires => {
		   iCal::Parser::SAX => 1.03,
		   XML::LibXML => 1.58,
		   XML::LibXSLT => 1.57,

		   Test::More => 0.47,
		  },
      license         => 'perl',
      create_readme => 1,
      create_makefile_pl => 'passthrough',
    );
$build->add_build_element('xsl');
if($build->y_n
   ('Would you like to install ical2html, a command line frontend?')) {
    $build->{properties}->{script_files}=['scripts/ical2html'];
}
$build->create_build_script;

