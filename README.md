duplo
=====

Duplo is a library for generating HTML code.

Example
-------

The following perl code

```perl
html(
  head(
    title('This is an example')),
  body(
    h1('Hello, World!'),
    div({class => 'container', style => 'border:1px black solid;'},
      ul(
        map { li 'Number is: ', $_ } 1 .. 5),
      p("That's all folks!"))))
```

yields (with formatted output)

```html
<html>
  <head>
    <title>This is an example</title>
  </head>
  <body>
    <h1>Hello, World!</h1>
    <div style="border:1px black solid;"  class="container">
      <ul>
        <li>Number is: 1</li>
        <li>Number is: 2</li>
        <li>Number is: 3</li>
        <li>Number is: 4</li>
        <li>Number is: 5</li>
      </ul>
      <p>That's all folks!</p>
    </div>
  </body>
</html>
```

Another example, using templates:

```perl
sub template {
  html(
    head(
      title('Example using template')),
    body(
      @_,
      p("That's all folks!")))
}

template(
  h1('Hello, World!'),
  div(
    h2('Oh hai!')))
```

which returns

```html
<html>
  <head>
    <title>Example using template</title>
  </head>
  <body>
    <h1>Hello, World!</h1>
    <div>
      <h2>Oh hai!</h2>
    </div>
    <p>That's all folks!</p>
  </body>
</html>
```
