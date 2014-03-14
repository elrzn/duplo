package Duplo;
use strict;
use warnings;

my @HTML_TAGS;
my @HTML_TAGS_SINGLE;

BEGIN {
  @HTML_TAGS = qw(
    body
    div
    h1 h2 h3 h4 h5 h6
    head
    html
    p
    title
    ul li
  );
  @HTML_TAGS_SINGLE = qw(
    area
    base
    br
    col
    command
    embed
    hr
    img
    input
    keygen
    link
    meta
    param
    source
    track
    wbr
  );
}

use Exporter::Tidy default => [@HTML_TAGS,
                               @HTML_TAGS_SINGLE];

sub _with_name {
  my $treatment = shift;
  my $name = shift;
  my @p;
  if (@_ && ref $_[0] eq 'HASH') {
    my $h = shift;
    @p = map { sprintf " %s=\"%s\"", $_, $h->{$_} } keys %$h;
  }
  "<$name@p>" . join('', @_) . ($treatment eq ':normal' ? "</$name>" : q{});
}

eval "sub $_ { _with_name ':normal', '$_', \@_ }" for @HTML_TAGS;
eval "sub $_ { _with_name ':single', '$_', \@_ }" for @HTML_TAGS_SINGLE;

1;
