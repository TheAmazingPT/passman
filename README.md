# Passman
This is a simple dmenu frontend for [Pass: The Standard Unix Password Manager](https://www.passwordstore.org/)

# Usage
![Usage of Passman](./docs/usage.gif)

# Setup
Grab the executable [bash script](https://github.com/TheAmazingPT/passman/raw/master/dist/passman)
from the [dist](https://github.com/TheAmazingPT/passman/tree/master/dist) directory and put it somewhere in your `$PATH` on your computer.

I for example added `$HOME/bin` to my `$PATH` and copied the script into this directory.

Afterwards you want to invoke this script preferably via a keyboard shortcut.

I use `SHIFT`__+__`META`__+__`P` to invoke this script.
A dmenu should open with the passman context.

You can also simply call the script from your terminal.

# Dependencies for Usage
For using passman you need to have following tools installed and accessible in your environment:

- [Pass](https://www.passwordstore.org/) (obviously)
- xclip
- notify-send

Passman was developed and tested on [Debian 9 (Stretch)](https://www.debian.org/).

# Development Setup
If you want to work on this tool, you need a few more dependencies ready:

- [Node](https://nodejs.org/en/)
- [shellchecker](https://github.com/koalaman/shellcheck)
- make


I included a [Makefile](https://github.com/TheAmazingPT/passman/blob/master/Makefile) with a build task. Once you added your changes you can run
```sh
make build
```
and a distributable gets compiled into the [dist/](https://github.com/TheAmazingPT/passman/tree/master/dist) directory.

# LICENSE
MIT License

Copyright (c) 2018 by Philipp Trunczik

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
