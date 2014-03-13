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
    (div {class => 'container'},
      (ul
        map { li 'Number is ', $_ } 1 .. 5),
      (p "That's all folks!"))))
#=> '<html><head><title>This is an example</title></head></html><body><h1>Hello World!</h1></body><div class="container"><ul><li>Number is 1</li><li>Number is 2</li><li>Number is 3</li><li>Number is 4</li><li>Number is 5</li></ul><p>That's all folks!</p></div>'
```
