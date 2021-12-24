andrew-canaday/tap
==================

<div align="center">

[![We frown on authors submitting their own work unless it is very popular](./.img/frown-upon.png)](https://docs.brew.sh/Acceptable-Formulae#niche-or-self-submitted-stuff)

</div>

To keep homebrew reliably usable and ensure stable packages, there are some
(reasonable!) [criteria a formula must meet to be included in homebrew core](https://docs.brew.sh/Acceptable-Formulae).

> 😬 <( Most of these projects fail one or both of the "be known" / "be used" tests. )

Projects which don't have broad enough usage to warrant inclusion in
homebrew-core are encouraged to maintain their own taps.

> :wave: This is the tap I maintain for my personal projects.

## Usage

```bash
brew tap andrew-canaday/tap
```

> :information_source: **NOTE**: _Re Bottles_:
>
> Formulas without a bottle must be installed from source, e.g.:
>
> ```bash
> brew install --build-from-source libbsat
> ```

## Formulas

| Name     | Description                                   | Bottled | Formula                    | Repo                                                                 |
| ----     | -----------                                   | ------- | -------                    | ----                                                                 |
| libbsat  | Timeout management utility library for libev. |   no    | [libbsat.rb](./libbsat.rb) | [andrew-canaday/libbsat](https://github.com/andrew-canadaylibbsat)   |
| pomd4c   | *Trivial* C comment → MD utility              |   no    | TODO                       | [andrew-canaday/pomd4c](https://github.com/andrew-canaday/pomd4c)    |
| libyimmo | C Socket Framework (HTTP, WS) and WSGI Server |   no    | TODO                       | [andrew-canaday/libyimmo](https://github.com/andrew-canadaylibyimmo) |


## Wanna make your own?

> :information_source: _It's really easy to make your own homebrew
> formulas and taps. **Bonus**: the documentation is a joy!_
>
> **Resources**:
>
>  - [Adding Software to Homebrew](https://docs.brew.sh/Adding-Software-to-Homebrew)
