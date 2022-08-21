# Gopass cheat sheet

> Quickly understand how to use gopass

## Requirements

- [pandoc](https://pandoc.org/installing.html)
- linux: `xelatex`
```sh
sudo apt-get install texlive-xetex
```

- mac: `mactex`
```sh
brew install --cask mactex
```

## Usage

Generate html, pdf, etc.

`make all`

Create index.html only

`make build-index`

## Commands

Remove created objects, this is useful to recrate the files if the markdown is edited.

```sh
make clean
```

## Spread the knowledage

[presentation][presentation]

[presentation]: https://woile.github.io/gopass-presentation/
