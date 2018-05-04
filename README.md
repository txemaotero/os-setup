[![Built with Spacemacs](https://cdn.rawgit.com/syl20bnr/spacemacs/442d025779da2f62fc86c2082703697714db6514/assets/spacemacs-badge.svg)](http://spacemacs.org)
# Ubuntu Setup

This repo contains a guide with the steps to follow for the installation of a
battery of features, concretely in Ubuntu 18.04 LTS. Moreover, some of the
employed configuration files for some programs are also included.

## General Packages

Here I list some useful packages that I usually use. If no more information is
supplied, the packages can be simply installed with: `sudo apt update`.

- [git](https://git-scm.com/ "git"): Version control.
- [inkscape](https://inkscape.org): Edit vectorial images.
- [gimp](https://gimp.org): Edit images.
- [Google-Chrome](https://www.google.com.mx/chrome/): Web browser. This should
  downloaded from the official page. Take a look to the vimium extension.
- [firefox](https://www.mozilla.org/es-ES/firefox/): Web browser.
- curl: Transfer data from or to a server.
- gem, ruby-dev: To install ruby packages.
- gcc: Compiler.
- make
- htop: Monitoring system from terminal.
- aspell-es: Spanish dictionary.
- [gromacs](http://www.gromacs.org/): Molecular dynamics simulation.
- [vmd](http://www.ks.uiuc.edu/Development/Download/download.cgi?PackageName=VMD):
Visual molecular dynamics. Download the last version, uncompress, run
`./configure` change to src dir and run `sudo make install`.
- [Avogadro](https://avogadro.cc/): Molecular editor.
- [vlc](https://www.videolan.org/vlc/index.es.html): Media player.
- [texmaker](http://www.xm1math.net/texmaker/): Latex IDE.
- texlive*: Latex packages
- [ffmpeg](https://www.ffmpeg.org/): media editor.
- [okular](https://okular.kde.org/): pdf reader.
- [Insync](https://www.insynchq.com/): Syncronizer manager for google drive.
  Download from the official page and install.
- [nmp](https://www.npmjs.com/): Package manager for js.

## Zsh

Give some live to your shell. Install zsh and the [oh-my-zsh](http://ohmyz.sh/)
layout.

``` bash
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

To check the configuration see the [zshrc](.zshrc) file. I like to have some
colors in the environment so y use the zsh-syntax-highlighting and the
[colorls](https://github.com/athityakumar/colorls) packages.

``` bash
sudo apt install zsh-syntax-highlighting
sudo gem install colorls
```

To use colorls and to guarantee the functionality of the zsh theme I recommend
the installation of [nerd-font](http://nerdfonts.com/). Clone the repository and
run `./install.sh` script.

## Python

Ensure you have pip installed in both python versions.

``` bash
sudo apt install python-pip python3-pip python3-matplotlib python-matplotlib python3-pyqt5
```

Install useful packages.

``` bash
sudo pip3 install numpy scipy matplotlib MDAnalysis bs4 jupyter sqlalchemy cython IPython django powerline-status pylint
```

## Text Editors

I really love to edit in [vim](https://vim.org) but I also like the
extensibility that [emacs](https://www.gnu.org/software/emacs/) offers. So, in
these lines, I usually use [spacemacs](http://spacemacs.org/). I have to mention
that for fast editing in the shell I use vim without any doubt so I maintain a
light weight vim configuration and a full one for spacemacs.

### Vim

Make sure that you have the last version vim and also the gtk packages for
allowing the copy paste from clipboard register.

``` bash
sudo apt install vim vim-gtk
```

The configuration can be found in the [vimrc](.vimrc) file. The pluggins are
installed using [pathogen](https://github.com/tpope/vim-pathogen). The list of
used packages:

- [Color Solarized](https://github.com/altercation/vim-colors-solarized).

### Emacs

Make sure you have the last version of emacs.

``` bash
sudo apt install emacs
```

Clone the [spacemacs](http://spacemacs.org) layout and configure the
[.spacemacs](.spacemacs) file. Install tern to correctly load spacemacs.

``` bash
sudo npm install -g tern
```

## i3

Give a try to the [i3](https://i3wm.org/) window manager, visualize the system
information with [i3blocks](https://github.com/vivien/i3blocks), give some
transparency with [compton](https://github.com/chjj/compton), set the wallpapers
with `feh` and set up the rofi
app launcher.

``` bash
sudo apt install i3 i3blocks rofi compton feh
```

Add some spaces between windows with
[i3-gaps](https://github.com/Airblader/i3/wiki/Compiling-&-Installing). For the
installation see the
[wiki](https://github.com/Airblader/i3/wiki/Compiling-&-Installing) page. The
configuration for i3 is in the [.i3](.i3) directory, the i3blocks one is in
[.i3blocks](.i3blocks.conf) and the compton in [.compton](.compton.conf)
