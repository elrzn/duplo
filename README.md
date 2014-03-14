duplo
=====

Duplo generates HTML.

Examples
--------

```perl
html(
  head(
    title('This is an example')),
  body(
    h1('Hello, World!'),
    div({class => 'container', style => 'border: 1px black solid;'},
      ul({style => 'list-style-type: circle;'},
        map { li 'Number is: ', $_ } 1 .. 5),
      p("That's all folks!"))))
```

Using templates:

```perl
sub template {
  html(
    head(
      title('Example using template')),
    body(
      @_,
      div({class => 'footer'},
        p("That's all folks!"))))
      }
}

template(
  h1('Hello, World!'),
  div(
    h2('Oh hai!')))
```
