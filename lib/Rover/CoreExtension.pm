package Rover::CoreExtension;
use strict; 
use warnings;
use Exporter;
use Rover;
use Rover::Core;
use Rover;

our @ISA = qw( Exporter );
our @EXPORT = qw( put_file_from_home );


sub put_file_from_home {
# Put a local file onto the remote server
#
  my ($self, $host, $args) = @_;
  my ($local_file,$remote_file) = split(",",$args.",");
  my $home = $ENV{HOME} . '/';
  my $old=$local_file;
#  warn "Local was \"$local_file\" and home was $home";
  my $x= $local_file =~ s!\${HOME}\/!$home!i;
#  warn "Local now \"$local_file\" for $x";

  $x=$local_file =~ s!~/!$home!i;
  warn "Local now \"$local_file\" and was ${old}";
  warn "going to send " . join ("|", $host,"$local_file\,$remote_file");
  my $result = Rover::Core::put_file($self,$host,"$local_file\,$remote_file"); # send to original 
  warn "result was ${result}";
  return($result);
}
