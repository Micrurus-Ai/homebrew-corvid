# homebrew-corvid

Homebrew tap for the [Corvid](https://github.com/Micrurus-Ai/Corvid-lang) programming language.

## Install

```sh
brew install Micrurus-Ai/corvid/corvid
```

The first dot-form is the canonical Homebrew tap shorthand: it expands to `brew tap Micrurus-Ai/corvid && brew install corvid` automatically.

## What you get

- `corvid` on your `PATH` (the CLI binary).
- The Corvid stdlib at `$(brew --prefix corvid)/std`. `corvid new myproj` finds it automatically and vendors a copy into the new project so `import "./std/foo"` works without further setup.

## Updating the formula

Don't edit `Formula/corvid.rb` by hand. The `publish-managers.yml` workflow in [Micrurus-Ai/Corvid-lang](https://github.com/Micrurus-Ai/Corvid-lang) bumps the version and SHA-256 fields automatically on every release.

If you ever need to bump it manually:

```sh
git clone https://github.com/Micrurus-Ai/homebrew-corvid && cd homebrew-corvid
brew bump-formula-pr Formula/corvid.rb \
    --version 0.1.0 \
    --url https://github.com/Micrurus-Ai/Corvid-lang/releases/download/v0.1.0/corvid-x86_64-apple-darwin.tar.gz
```

## License

The tap itself is MIT/Apache-2.0, matching upstream Corvid-lang.
