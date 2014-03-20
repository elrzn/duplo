# duplo

Duplo generates html.

## Examples

### Whirlwind
```perl
html_(
  head_(
    title_('This is an example')),
  body_(
    h1_('Hello, World!'),
    div_({class => 'container', style => 'border: 1px black solid;'},
      ul_({style => 'list-style-type: circle;'},
        map { li_ 'Number is: ', $_ } 1 .. 5),
      img_({src => 'image.jpg', alt => 'An image'}),
      p_("That's all folks!"))));
```

### Templates
```perl
sub template {
  my $title = shift;
  html_(
    head_(
      title_($title_)),
    body_(
      @_,
      div_({class => 'footer'},
        p_("That's all folks!"))))
}

template('Template example',
  h1_('Hello, World!'),
  div_(
    h2_('Oh hai!')));
```
