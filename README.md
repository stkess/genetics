# genetics - A Genetic Algorithm library in Haskell

# REQUIREMENTS

 - [Haskell](http://www.haskell.org/)
 - [random-fu](http://hackage.haskell.org/package/random-fu)

# DEVELOPMENT

# Linting

Keep the code tidy with HLint:

    $ cabal install hlint
    $ make lint

# EXAMPLE

    $ cabal update
    $ cabal install random-fu
    $ make
    ./hellogenetics +RTS -N
    Hello World!

To perform profiling, run `make profile`.

To perform coverage, run `make coverage`.
