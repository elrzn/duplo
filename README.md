duplo
=====

Duplo is a library for generating HTML code.

Example
-------

```perl
(html
  (head
    (title 'This is an example')),
  (body
    (h1 'Hello World!'),
    (div {class => 'container',
          style => 'border:1px black solid;'},
      (ul
        map { li 'Number is ', $_ } 1 .. 5),
      (p "That's all folks!"))))
```

Or, using templates:

```perl
sub template {
 (html
   (head
     (title 'This is an example')),
   (body
     @_,
     (p "That's all folks!")))
}

(template
  (h1 'Hello World!'))
```
