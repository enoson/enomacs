# enomacs
There're already a lot of .emacs.d out there that are "powerful", which confirms "Emacs is a great OS lacking only a decent editor". This .emacs.d, on the other hand, provides a lean config that's relevant only to text editing.

It's suitable for Mac users who think faster than type, if you type faster than think, use Vim or Spacemacs instead, if you want to appear type very fast, follow this [guide](https://github.com/redguardtoo/mastering-emacs-in-one-year-guide) instead.

# requirements
- [emacs-mac-port](https://github.com/railwaycat/homebrew-emacsmacport/releases) (by far the best Emacs app)
- [aspell](http://aspell.net/) `brew install aspell --with-lang-en` (if you use org-mode)
- [tern](https://github.com/marijnh/tern) `npm install tern -g` (if you write JavaScript)
- [Cask](http://cask.readthedocs.org/en/latest/guide/installation.html) `brew install cask` (package management)
- add `export EMACS="/Applications/Emacs.app/Contents/MacOS/Emacs"` to your `.bashrc` to let Cask know Emacs's version
- run `mv ~/.emacs.d ~/.emacs.d-old` if you already have a `~/.emacs.d`
- run `mkdir ~/.emacs.d&&cd ~/.emacs.d&&git clone https://github.com/enoson/enomacs.git .&&cask install= in terminal to clone the repo and install the packages.
