
use Rover::CoreExtension;
use Rover::Core;
use Rover::Host;
my $host = new Rover::Host("localhost", "Linux", "mdupont","test");
my $r = new Rover;
Rover::CoreExtension::put_file_from_home ( $r, $host, "~/find2.sh", "/tmp/");
Rover::CoreExtension::put_file_from_home ( $r, $host, "\$\{HOME\}/find3.sh", "/tmp/");