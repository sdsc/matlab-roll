#!/usr/bin/perl -w
# matlab roll installation test.  Usage:
# matlab.t [nodetype]
#   where nodetype is one of "Compute", "Dbnode", "Frontend" or "Login"
#   if not specified, the test assumes either Compute or Frontend

use Test::More qw(no_plan);

my $appliance = $#ARGV >= 0 ? $ARGV[0] :
                -d '/export/rocks/install' ? 'Frontend' : 'Compute';
my $installedOnAppliancesPattern = '.';
my $isInstalled = -d '/opt/matlab/2014a';
my $output;

# matlab-common.xml
if($appliance =~ /$installedOnAppliancesPattern/) {
  ok($isInstalled, 'matlab installed');
} else {
  ok(! $isInstalled, 'matlab not installed');
}

SKIP: {

  skip 'matlab not installed', 4 if ! $isInstalled;
  $output = `/opt/matlab/2014a/bin/matlab -nodisplay -r ver,exit 2>&1`;
  like($output, qr/[Vv]ersion:\s*\d+\.\d+/, 'matlab exec works');

  skip 'modules not installed', 3 if ! -f '/etc/profile.d/modules.sh';
  `/bin/ls /opt/modulefiles/applications/matlab/[0-9]* 2>&1`;
  ok($? == 0, 'matlab module installed');
  `/bin/ls /opt/modulefiles/applications/matlab/.version.[0-9]* 2>&1`;
  ok($? == 0, 'matlab version module installed');
  ok(-l '/opt/modulefiles/applications/matlab/.version',
     'matlab version module link created');

}
