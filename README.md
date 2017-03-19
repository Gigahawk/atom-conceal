**This is my attempt at bringing tfausak's atom-conceal plugin to a usable state.**

Current improvements:
- Words are now individually parsed instead of the entire line.
  - This only sort of works at the moment, I have next to no experience with Java/CoffeeScript so code may be incredibly unoptimized and/or buggy
  - Only words using alphanums and underscore are counted (uses a regex \W)
    - This means that things like ">="→"≥" will not work

# Conceal

Conceal is an [Atom][] package that conceals text and replaces it with prettier
alternatives.

![Screenshot][]

To configure Conceal, set the `replacements` option in your config.

``` cson
# config.cson
"*":
  conceal:
    replacements:
      ".": "∘"
```

[atom]: https://atom.io
[screenshot]: https://i.imgur.com/MxEX9hN.png
