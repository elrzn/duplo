package Duplo;
use strict;
use warnings;

my @HTML_KEYWORDS;

BEGIN {
  @HTML_KEYWORDS = qw(
    body
    div
    h1 h2 h3 h4 h5 h6
    head
    html
    p
    title
    ul li
  );
}

use Exporter::Tidy default => [@HTML_KEYWORDS];

sub _with_name {
  my $name = shift;
  my @p;
  if (@_ && ref $_[0] eq 'HASH') {
    my $h = shift;
    @p = map { sprintf " %s=\"%s\"", $_, $h->{$_} } keys %$h;
  }
  "<$name@p>" . join('', @_) . "</$name>";
}

eval "sub $_ { _with_name '$_', \@_ }" for @HTML_KEYWORDS;

1;
