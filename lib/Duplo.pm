package Duplo;
use strict;
use warnings;
use subs 'link';

my @HTML_TAGS;
my @HTML_TAGS_SINGLE;

BEGIN {
  @HTML_TAGS = qw(
    body
    div
    h1 h2 h3 h4 h5 h6 head html
    li
    p
    title
    ul
  );
  @HTML_TAGS_SINGLE = qw(
    area
    base br
    col command
    embed
    hr
    img input
    keygen
    link
    meta
    param
    source
    track
    wbr
  );

  sub _ { $_[0] . '_' }
}

use Exporter::Tidy default => [map { _ $_ } @HTML_TAGS, @HTML_TAGS_SINGLE];

sub _with_name {
  my $treatment = shift;
  my $name = substr shift, 0, -1;
  my @p;
  if (@_ && ref $_[0] eq 'HASH') {
    my $h = shift;
    @p = map { sprintf " %s=\"%s\"", $_, $h->{$_} } keys %$h;
  }
  "<$name@p>" . join('', @_) . ($treatment eq ':normal' ? "</$name>" : q{});
}

eval "sub $_ { _with_name ':normal', '$_', \@_ }" for map { _ $_ } @HTML_TAGS;
eval "sub $_ { _with_name ':single', '$_', \@_ }" for map { _ $_ } @HTML_TAGS_SINGLE;

1;
