ACME Smuggler
=============

The () type has only one value, also called () with no
internal structure.

Nevertheless, acme-smuggler allows you to smuggle
arbitrary values into () and discover them later:

```haskell
> x = smuggle "hello"
> :t x
x :: ()

> y = smuggle (7 :: Integer)
> :t y
y :: ()

> discover x :: Maybe String
Just "hello"
> discover y :: Maybe Integer
Just 7
> discover x :: Maybe Integer
Nothing
```

