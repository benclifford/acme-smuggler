ACME Smuggler
=============

The `()` type has only one value, also called `()` with no
internal structure.

Nevertheless, acme-smuggler allows you to smuggle
arbitrary values into `()` and discover them later.


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

And! `Void` has no values at all, but acme-smuggler even lets you
smuggle values into `Void`. Or into any other Haskell type.

Here are slides for a short talk that I gave at the London Haskell User Group:
http://www.hawaga.org.uk/ben/tech/london-hug-acme-smuggler/presentation.html
and my original blog post:
http://benctechnicalblog.blogspot.com/2016/11/smuggling-things-in-dirty-bottom.html

## History

acme-smuggler originated in a workaround for an issue @tdietert and I had
with the JuicyPixels library, https://github.com/Twinside/Juicy.Pixels/issues/128
