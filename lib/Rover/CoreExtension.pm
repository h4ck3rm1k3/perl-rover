package Rover::CoreExtension;
use Exporter;
use Rover;
use Rover::Core;

@Pager::ISA = qw( Exporter );
@Pager::EXPORT = qw( put_file_from_home );

BEGIN {
  Rover::register_module("Rover::CoreExtension");
}

sub put_file_from_home {
# Put a local file onto the remote server
#
  my ($self, $host, $args) = @_;
  my ($local_file,$remote_file) = split(",",$args.",");
  my $home = $ENV{HOME};
  warn "Local was $local_file and home was $home";
  $local_file =~ s/^\$\{HOME\}/${home}/ ;
  $local_file =~ s/^~\//${home}\// ;
  warn "Local now $local_file";
  Rover::Core::put_file($self,$host,join(",",$local_file,$remote_file)); # send to original 
  
  return($result);
}
