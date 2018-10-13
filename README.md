# Passman
This is a simple dmenu frontend for [Pass: The Standard Unix Password Manager](https://www.passwordstore.org/)

# Usage
TBD

# Setup
Grab the executable [bash script](https://github.com/TheAmazingPT/passman/blob/master/dist/passman)
from the dist directory and put it somewhere in your $PATH.
I for example added `$HOME/bin` to my $PATH and copied the script into this directory.

Afterwards you want to invoke this script preferably via a keyboard shortcut.
I use `SHIFT + META + P` to invoke this script. A dmenu should open with the passman context.

You can also simply call the script from your terminal.

# Dependencies for Usage
For using passman you need to have following tools installed and accessible in your environment:

- Pass (obviously)
- xclip
- notify-send

Passman was developed and tested on Debian 9 (Stretch).

# Development Setup
If you want to work on this tool, you need a few more dependencies ready:

- Node
- make
- shellchecker

I included a `Makefile` with a build task. Once you added your changes you can run
```
make build
```
and a distributable gets compiled into the `./dist` directory.

# LICENSE
MIT
