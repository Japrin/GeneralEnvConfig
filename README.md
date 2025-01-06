# GeneralEnvConfig
my configure files, such as ~/.bashrc, ~/.vimrc etc.

1. **bash**
   
   modify bash/.bashrc, then rsync to ~/.
   ```
   rsync -avzP bash/.bashrc ~/
   ```
2. **R**
 
   modify R/.Renviron and R/.Rprofile, then rsync to ~/.
   ```
   rsync -avzP R/.Renviron R/.Rprofile ~/
   ```
   modify R/Makevars, then rsync to  ~/.R/.
   ```
   rsync -avzP R/Makevars ~/.R/
   ```
5. **vim**

   First, rsync the files to corresponding directories. Maybe certain directories should be created first, if no exist.
   ```
   rsync -avzP vim/default_my.vim ~/.vim/colors/
   rsync -avzP vim/tmux_split.vim ~/.vim/plugin/
   rsync -avzP vim/.vimrc ~/
   ```
   Then open ~/.vimrc with vim. In vim, install the plugins by the `PluginInstall` command in the command mode. Note, some packages are required. Please read the ~/.vimrc carefully.  
