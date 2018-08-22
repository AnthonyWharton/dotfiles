# Anthony's Dotfiles

This repository contains all of my dotfiles. They're not guarenteed to be perfect, nor are they guarenteed to work on your machine (heck they often break on mine), but they do the job for me! Feel free to poke around.

## Notes:
At the time of updating this file (2018-08-09) I am running an Arch Linux (well 
[Antergos](https://antergos.com/), as I'm a bit lazy) system, with 
[i3 gaps](https://aur.archlinux.org/packages/i3-gaps/) as the window manager.
This delightful concoction is running on an XPS 13 9370 (FHD).

Various other program configurations are also included in this repository and
are all names somewhat sensibly.  It's an ever evolving project.  A dependencies 
list is in progress (check below), but there's no guarentee when that will be 
done!

## Usage:
All files are restored using GNU Stow with the install script, used as follows:
```
./install.sh
```
_(It's pretty simple isn't it?)_

### License:
> See the `LICENSE` file.  This applies to any scripts that have been written in
  this repository, as I don't think I can really lay any claims on config files. 

> Also note that submodules within this repository have their own licenses which
  should be referred to when within the domain of that submodule.

#### Work in progress dependencies list:
In general I should be using the package names as in the Arch repositories,
unless the package is from the AUR in which case it is labelled as such.

 - stow
 - bash
 - zsh
 - oh-my-zsh
 - oh-my-zsh-powerline-theme-git (AUR)
 - powerline
 - i3-gaps (AUR)
 - i3lock-next-get (AUR)
 - feh
 - light (AUR)
 - compton
 - dunst
 - ssh
 - polybar
 - vim
 - vim-plug (AUR)
 - rofi
 - nerd-fonts-complete (AUR)
 - maim
 - xclip
 - redshift
 - nm-applet
 - playerctl
 - jq

_And more.. I still have plenty to add I am sure._
