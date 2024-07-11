#! /bin/zsh

# Collector for zsh configuration
#
# From ~/, gathers
#     .zprofile
#     .zshrc
#
# Does NOT collect ~/.oh-my-zsh, which supports ZSH but I don't think
# should be gathered because it is a git repo cloned from a zsh source.
# It should not have local configuration information in it.

cp ~/.zprofile .
cp ~/.zshrc .

