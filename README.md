# duplo

Duplo generates HTML.

## Examples

### Whirlwind
```perl
html(
  head(
    title('This is an example')),
  body(
    h1('Hello, World!'),
    div({class => 'container', style => 'border: 1px black solid;'},
      ul({style => 'list-style-type: circle;'},
        map { li 'Number is: ', $_ } 1 .. 5),
      p("That's all folks!"))));
```

### Templates
```perl
sub template {
  my $title = shift;
  html(
    head(
      title($title)),
    body(
      @_,
      div({class => 'footer'},
        p("That's all folks!"))))
}

template('Template example',
  h1('Hello, World!'),
  div(
    h2('Oh hai!')));
```
