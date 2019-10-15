# ardeidae dotfiles

This repository hosts my dotfiles. This is a work in progress.

## git

This gitconfig file sets some colors, pretty format, command line and graphical
editors for diff and merge. It defines somes properties to avoid some problems on
macOS and some safe options.

When you work in a team, there is a good chance your tree will become
disgusting because there is always someone who doesn't understand how git
works...

So, here are some options that can prevent 99% of merge problems.

* `merge.ff = false` because when you merge, you want to see the merge branche. In case it was a temporary branch, you can force a fast-forward using `--ff` option.
* `pull.ff = only` because when you pull, you don't want to merge to keep a clean and straight history.
* `pull.rebase = merges` because when you pull, if a fast-forward is not possible, you want to rebase to keep a clean and straight history, too.

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
me to set an email for each project. The first thing to do when you init your
git repository is to set your email locally :

```bash
git config user.email "me@tld.com"
```

### aliases

* `a`: add ;
* `aliases`: list aliases ;
* `am`: commit and amend in verbose mode ;
* `ap`: add in patch mode ;
* `bl`: blame ;
* `br`: list branches in verbose mode ;
* `ci`: commit in verbose mode ;
* `co`: checkout ;
* `contrib`: show contributors and their numbers of commits ;
* `cp`: cherry-pick and append a line that says "cherry picked from commit" ;
* `credit`: amend the last commit with "A Name" "an.email@tld.com" ;
* `d`: make a diff ;
* `dc`: make a diff in cached mode ;
* `dl`: make a diff of the last commit ;
* `dt`: start difftool ;
* `dtg`: start difftool in gui mode ;
* `ec`: edit your global gitconfig ;
* `f`: fetch ;
* `fc`: find commits by source code ;
* `fm`: find commits by commit message ;
* `g`: make a grep but does not search in binary files ;
* `l`: show logs ;
* `lg`: show logs in graph mode ;
* `lga`: show all logs in graph mode ;
* `ll`: show last logs ;
* `lp`: show log in patch mode ;
* `lrb`: list remotes branches ;
* `m`: merge ;
* `mt`: start mergetool ;
* `mtg`: start mergetool in gui mode ;
* `nb`: switch to a branch or create it first ;
* `pl`: pull ;
* `ps`: push ;
* `r`: rebase ;
* `rc`: continue rebase ;
* `recentbr`: get list of branches ordered by most recent commit ;
* `rlast`: rebase the given number of latests commits ;
* `rlc`: remove the given number of last commits, the last by default ;
* `rt`: list remotes in verbose mode ;
* `s`: show short status ;
* `sa`: apply a stash ;
* `sd`: drop a stash ;
* `sl`: list stashes ;
* `ss`: stash ;
* `st`: show status ;
* `ulc`: undo the given number of last commits, the last by default ;
* `unstage`: unstage files ;
* `wd`: make a word diff ;
* `wdc`: make a word diff in cached mode.

### Other things

It treats spaces before tabs and all kinds of trailing whitespace as errors.
It define mnemonicPrefix, autoStash, autoSquash... There are many other things,
you can see the gitconfig content, it is well documented.
