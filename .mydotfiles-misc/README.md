# ardeidae dotfiles

This repository hosts my dotfiles. This is a work in progress.

## git

This gitconfig file sets some colors, pretty format, command line and graphical
editors for diff and merge. It defines some properties to avoid some problems
on macOS and some safe options.

When you work in a team, there is a good chance your tree will become
disgusting because there is always someone who doesn't understand how git
works...

So, here are some options that can prevent 99% of merge problems.

* `merge.ff = false` because when you merge, you want to see the merge branch.
  In case it was a temporary branch, you can force a fast-forward using `--ff`
  option.
* `pull.ff = only` because when you pull, you don't want to merge to keep a
  clean and straight history.
* `pull.rebase = merges` because when you pull, if a fast-forward is not
  possible, you want to rebase to keep a clean and straight history, too.

### Your identity

Your name must be set in the `~/.gitconfig.local` file.
```
[user]
email = you@tld.com
```

The purpose of `user.useConfigOnly = true` is to force you to define
`user.name` and `user.email`. I only have one name, so I define it in the
`~/.gitconfig.local`. As I have personal and professional mails, I define
`user.email` for each project. So, with `user.useConfigOnly = true`, git tells
me to set an email for each project. The first thing to do when you initialize
your git repository is to set your email locally:

```bash
git config user.email "me@tld.com"
```

### aliases

* `a`: add;
* `aliases`: list aliases;
* `amend`: commit and amend in verbose mode;
* `ap`: add in patch mode;
* `bl`: blame;
* `br`: list branches in verbose mode;
* `ci`: commit in verbose mode;
* `co`: checkout;
* `contrib`: show contributors and their numbers of commits;
* `conflicts`: show files in conflict state;
* `cp`: cherry-pick and append a line that says "cherry picked from commit";
* `credit`: amend the last commit with "A Name" "an.email@tld.com";
* `d`: make a diff;
* `dc`: make a diff in cached mode;
* `dl`: make a diff of the last commit;
* `dt`: start difftool;
* `dtg`: start difftool in GUI mode;
* `ec`: edit your global gitconfig;
* `f`: fetch;
* `fc`: find commits by source code;
* `fm`: find commits by commit message;
* `g`: make a grep but does not search in binary files;
* `l`: show logs;
* `lg`: show logs in graph mode;
* `lga`: show all logs in graph mode;
* `ll`: show last logs;
* `lp`: show log in patch mode;
* `lrb`: list remotes branches;
* `m`: merge;
* `mt`: start mergetool;
* `mtg`: start mergetool in GUI mode;
* `nb`: switch to a branch or create it first;
* `pl`: pull;
* `ps`: push;
* `r`: rebase;
* `rc`: continue rebase;
* `rp`: reset in patch mode;
* `recentbr`: get list of branches ordered by most recent commit;
* `rlast`: rebase the given number of latests commits;
* `rlc`: remove the given number of last commits, the last by default;
* `rt`: list remotes in verbose mode;
* `s`: show short status;
* `sa`: apply a stash;
* `sd`: drop a stash;
* `sl`: list stashes;
* `sp`: pop a stash;
* `ss`: stash;
* `st`: show status;
* `ulc`: undo the given number of last commits, the last by default;
* `unstage`: unstage files;
* `wd`: make a word diff;
* `wdc`: make a word diff in cached mode.

### Other things

It treats spaces before tabs and all kinds of trailing whitespace as errors.
It define mnemonicPrefix, autoStash, autoSquash... There are many other things,
you can see the gitconfig content, it is well documented.

## vim

This is a work in progress.

Plugins are managed by [junegunn/vim-plug](https://github.com/junegunn/vim-plug).
This plugin is downloaded at first launch, `curl` command is required.

Some directories are created on first launch with permissions set to 700.

* `~/.vim/plugged` to store plugins;
* `~/.vim/tmp/backup` to store backup files;
* `~/.vim/tmp/undo` to store undo files;
* `~/.vim/tmp/swap` to store  swap files.

The mapleader key is set to the spacebar.

### Themes

* [ayu-theme/ayu-vim](https://github.com/ayu-theme/ayu-vim);
* [cormacrelf/vim-colors-github](https://github.com/cormacrelf/vim-colors-github);
* [morhetz/gruvbox](https://github.com/morhetz/gruvbox);
* [tomasr/molokai](https://github.com/tomasr/molokai);

### Plugins

* [ctrlpvim/ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim);
* [editorconfig/editorconfig-vim](https://github.com/editorconfig/editorconfig-vim);
* [honza/vim-snippets](https://github.com/honza/vim-snippets);
* [jmcantrell/vim-virtualenv](https://github.com/jmcantrell/vim-virtualenv);
* [junegunn/vim-easy-align](https://github.com/junegunn/vim-easy-align);
* [mbbill/undotree](https://github.com/mbbill/undotree);
* [mhinz/vim-startify](https://github.com/mhinz/vim-startify);
* [nathanaelkane/vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides);
* [scrooloose/nerdcommenter](https://github.com/scrooloose/nerdcommenter);
* [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree);
* [SirVer/ultisnips](https://github.com/SirVer/ultisnips);
* [tpope/vim-eunuch](https://github.com/tpope/vim-eunuch);
* [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive);
* [tpope/vim-surround](https://github.com/tpope/vim-surround);
* [tpope/vim-unimpaired](https://github.com/tpope/vim-unimpaired);
* [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline);
* [vim-syntastic/syntastic](https://github.com/vim-syntastic/syntastic);

### Mapping

* `<space>bi`: install plugins;
* `<space>bu`: update plugins;
* `<space>bc`: clean unused plugins.

Because `[` and `]` are hard to type on french keyboard, especially on Apple
keyboard, I added mappings `<F1>` and `<F2>` to `[` and `]`.

So, you can use these mappings.

* `n<F1>s`: get on the nth previous misspelled word;
* `n<F2>s`: get on the nth next misspelled word;
* `n<F1>c`: get on the nth previous start of diff change;
* `n<F2>c`: get on the nth next start of diff change;
* `<F1>z`: move to start of open fold;
* `<F2>z`: move to end of open fold;
* `n<F1>a`: edit the nth previous file in argument list (:previous);
* `n<F2>a`: edit the nth next file in argument list (:next);
* `<F1>A`: edit the first file in the argument list (:first);
* `<F2>A`: edit the last file in the argument list (:last);
* `n<F1>b`: go to the nth previous buffer in the buffer list (:bprevious);
* `n<F2>b`: go to the nth next buffer in the buffer list (:bnext);
* `<F1>B`: go to the first buffer in the buffer list (:bfirst);
* `<F2>B`: go to the last buffer in the buffer list (:blast);
* `n<F1>l`: go to the nth previous location (:lprevious);
* `n<F2>l`: go to the nth next location (:lnext);
* `<F1>L`: go to the fist location (:lfirst);
* `<F2>L`: go to the last location (:llast);
* `n<F1>q`: go to the nth previous quickfix (:cprevious);
* `n<F2>q`: go to the ntn next quickfix (:cnext);
* `<F1>Q`: go to the first quickfix (:cfirst);
* `<F2>Q`: go to the last quickfix (:clast);
* `n<F1>f`: go to the nth file preceding the current one alphabetically in the
  current file's directory;
* `n<F2>f`: go to the nth file succeeding the current one alphabetically in the
  current file's directory;
* `n<F1>n`: go to the nth previous SCM conflict marker or diff/patch hunk;
* `n<F2>n`: go to the nth next SCM conflict marker or diff/patch hunk.

### Options On / Off /Toggle

* `<F1>`: on;
* `<F2>`: off;
* `y`: switch.

Option names:
* `ob`: 'background' (dark is off, light is on)
* `oc`: 'cursorline'
* `od`: 'diff' (actually |:diffthis| / |:diffoff|)
* `oh`: 'hlsearch'
* `oi`: 'ignorecase'
* `ol`: 'list'
* `on`: 'number'
* `or`: 'relativenumber'
* `os`: 'spell'
* `ou`: 'cursorcolumn'
* `ov`: 'virtualedit'
* `ow`: 'wrap'
* `ox`: 'cursorline' 'cursorcolumn' (x as in crosshairs)

So, to enable hlsearch, you have to type `<F1>oh`.
To disable it, you have to type `<F2>oh`.
To switch it, you have to type `yoh`.

### Pasting

* `>p`: paste after linewise, increasing indent;
* `>P`: paste before linewise, increasing indent;
* `<p`: paste after linewise, decreasing indent;
* `<P`: paste before linewise, decreasing indent;
* `=p`: paste after linewise, reindenting;
* `=P`: paste before linewise, reindenting;
* `<F1>p`: paste before linewise, using target indent;
* `<F2>p`: paste after linewise, using target indent.

### Toggle paste mode

A toggle has not been provided for paste because the typical use case of
wrapping of a solitary insertion is inefficient: You toggle twice, but you only
paste once.

To go in insert mode with paste set, press:

* `<F1>`op to invoke `O`;
* `<F2>`op to invoke `o`;
* `yop` to invoke `0C`.

Leaving insert mode sets nopaste automatically.

### Functions

#### VirtualEnv

Activate a python virtualenv within Vim.

* `:VirtualEnvList`: List all available virtualenvs;
* `:VirtualEnvDeactivate`: Deactivate the current virtualenv;
* `:VirtualEnvActivate [name]`: Activate a virtualenv.

#### Custom

* `:FormatJSON`: format a JSON file;
* `:FormatXML`: format an XML file.
