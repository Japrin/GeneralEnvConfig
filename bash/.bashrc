# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

. /path/to/01.bin/modules/modules-5.5.0/mybuild/init/profile.sh
export MODULEPATH="/path/to/05.setting/modulefiles":$MODULEPATH
module purge
module load tmux/3.5a
module load X11/unknown
module load tools/unknown
module load misc/unknown
module load git/unknown
module load gcc/10.1.0
module load tcltk/8.6.16
module load java/23.0.1
module load python/3.8.13
module load python/2.7.18
module load R/4.4.2
module load perl/5.40.0
module load ruby/3.4.1

MY=/path/to/my/workspace/directory
cd $MY

### require the python package csvkit installed
function tablook
{
    local ifile=$1
    cat $ifile | PYTHONIOENCODING=utf8 csvlook -d$'\t'
    ##cat $ifile | PYTHONIOENCODING=utf8 csvlook --snifflimit 10240 -d$'\t'
    ##cat $ifile | PYTHONIOENCODING=utf8 csvlook --no-inference -d$'\t'
}
alias tabgrep="csvgrep --tabs"
alias tabcut="csvcut --tabs"
alias tabjoin="csvjoin --tabs"
alias tabsort="csvsort --tabs"
alias tabstack="csvstack --tabs"
alias tabstat="csvstat --tabs"

alias l='ls -lhtr'
alias ll='ls -tr'
alias le='less -NS'

alias sjob='scontrol show jobs'
alias vim="vim --servername VIM"
alias vi="vim"

###export HDF5_USE_FILE_LOCKING='FALSE'
export PAGER=less

export PS1='\[\e[33;1m\]\[\e[0m\]\[\e[32;1m\]\[\e[0m\]\[\e[36;1m\]\h: \[\e[0m\]\[\e[1;93m\]'"\$PWD"'\n$\[\e[0m\]'
#export PS1="\[\e[32m\][\[\e[m\]\[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]:\[\e[36m\]\w\[\e[m\]\[\e[32m\]]\[\e[m\]\[\e[32;47m\]\\$\[\e[m\] \n"
export TERM=xterm-256color
export LANG=en_US.UTF-8
#export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export TMPDIR="/path/to/my/workspace/directory/tmp"
export PKG_CONFIG_PATH="/path/to/05.setting/PKGCONFIG"
export DISPLAY=:0.0

