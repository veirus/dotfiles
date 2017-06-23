;= @echo off
;= rem Call DOSKEY and use this file as the macrofile
;= %SystemRoot%\system32\doskey /listsize=1000 /macrofile=%0%
;= rem In batch mode, jump to the end of the file
;= goto:eof
;= Add aliases below here

e.=explorer .
unalias=alias /d $1
history=cat %CMDER_ROOT%\config\.history
vi=vim $*
gvi=gvim $*
ls=ls --show-control-chars -F --color $*
ll=ls -la --color
clear=cls

..=cd ..
pwd=cd
cdd=cd /d $1
cdcmdr=cd /d "%CMDER_ROOT%"
cdproj=cd /d D:\projects
cdops=cd /d D:\OpenServer\domains
cddenw=cd /d D:\denwer
cdenv=cd /d D:\env

ga=git add $*
gau=git add -u $*
gp=git push
gundo=git reset HEAD~ && git clean -df
gundopush=push -f origin HEAD^:master
gl=git log --oneline --all --graph --decorate  $*
npmls=npm ls -g --depth=0
nvim=D:\Apps\Neovim\bin\nvim-qt.exe $*
gd=git diff $*  
gc=git commit $*  
gs=git status  