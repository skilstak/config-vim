# SkilStak Vim Setup and Configuration

*[This repo is mirrored from ![Fox](gitlab.png) GitLab (a far superior Git hosting platform).](https://gitlab.com/skilstak/config/vim)*

![Vim Logo](logo.png)

Our favorite stuff for our favorite editor Vim, the one-true editor (of course). Fork and maintaining your own is probably best.

* Solarized
* Pandoc 

***Don't forget to learn without arrow keys and `Ctrl-[` instead of `Esc` key.***

After cloning just run `./install`.

## FAQ

### *Why no NeoVim?*

[Because](https://skilstak.io) it is stupid and worthless if you use `tmux` (which you should) configured with Vim bindings. I mean, who *really* wants to write plugins in Lua? (Vim 7+ comes with Python support.)

*Let me try that again in my politically-correcter-er voice.*

The biggest claim to use NeoVim is also the biggest reason *not* to use it. It redoes the entire codebase of Vim forking the project and making a massive schism in the Vim development community, for what, async? Guess what. Vim 7+ has async. Lua? Guess what. Vim 7+ has Python. Smaller code base? Yeah, we don't care. Faster more current updates? Nope. Last two years have proven that Vim is actually faster at getting them out and much more stable.

Because it provides no additional benefit beyond that already provided by Vim -- especially when combined with a terminal multiplexer such as `screen` or `tmux`, which we believe all terminal masters should learn as a matter of course. Moreover, encourage further use of *vim script* promotes a non-divided ecosystem of plugins, which are at the core of Vim productivity and adaptability. To suggest another language is needed for such plugins only fractures the development effort unnecessarily.

### *How do I add a plugin?*

To add a plugin simply add it to the *Plug* section of your `vimrc` and run the following, which you can alias to `vimplugininstall` if you like:

```sh
vim +':PlugInstall' +':q!' +':q!''
```

### *Why Plug?*

Because is not as fat as all it's older cousins.

### *Why only these plugins?*

Modern `vim` does most of what want out of the box by default. (Not even `fatih/vim-go` (which is now unsupported) is worth getting.)

*Plug* is so good at managing and setting up any of the few plugins that you might actually want that it makes little sense to force personal preferences on you other than those that are considered standard by the industry for a particular usage.
