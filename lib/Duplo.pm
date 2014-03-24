package Duplo;
use strict;
use warnings;

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

do {    # Build subroutines.
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

  sub _builder {
    my ($sub_name, $type) = @_;
    qq(sub $sub_name { _with_name '$type', '$sub_name', \@_ });
  }

  eval _builder $_, q(:normal) for map { _ $_ } @HTML_TAGS;
  eval _builder $_, q(:single) for map { _ $_ } @HTML_TAGS_SINGLE;
};

1;
