# homebrew-sill

Homebrew tap for [aminehmida/sill](https://github.com/aminehmida/sill), a fork of
[Sill for Mac](https://github.com/Saffsanity/sill) that tells devices when the Mac's focus is in a
text field, so their keyboard comes up by itself
([Sill for Android](https://github.com/aminehmida/sill-android) 0.6.2 or later reads it).

```sh
brew install --cask aminehmida/sill/sill
```

Coming from the official cask: `brew uninstall --cask saffsanity/sill/sill` first (your settings and
paired devices stay).

The build is ad hoc signed and not notarized, so macOS asks again for Screen Recording and
Accessibility after each install or upgrade. For the official, notarized Sill use
`brew install --cask saffsanity/sill/sill`.
