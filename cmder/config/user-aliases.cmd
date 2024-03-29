;= @echo off
;= rem Call DOSKEY and use this file as the macrofile
;= %SystemRoot%\system32\doskey /listsize=1000 /macrofile=%0%
;= rem In batch mode, jump to the end of the file
;= goto:eof
;= Add aliases below here

e.=explorer .
e=explorer $*
unalias=alias /d $1
history=cat %CMDER_ROOT%\config\.history
ls=ls --show-control-chars -F --color $*
ll=ls -la --color $*
clear=cls

..=cd ..
cd~=cd /d %USERPROFILE%
pwd=cd
cdd=cd /d $1
cdcmdr=cd /d "%CMDER_ROOT%"
cdproj=cd /d D:\projects
cdops=cd /d D:\OpenServer\domains
cddenw=cd /d D:\denwer
cdenv=cd /d D:\env
cddw=cd /d D:\downloads
cdvid=cd /d D:\downloads\Videos

ga=git add $*
gaa=git add .
gau=git add -u $*
gb=git branch $*
gc=git commit $*
gcm=git commit -m $*
gca=git commit -am $*
gd=git diff $*
gh=git hist
gl=git log --oneline --all --graph --decorate  $*
gs=git status
gp=git push
gundo=git reset HEAD~ && git clean -df
gundopush=push -f origin HEAD^:master

npmls=npm ls -g --depth=0
npmll=npm ls --depth=0
npmd=npm i -D $*
npmg=npm i -g $*

vi=vim $*
gvi=gvim $*
ytnc=youtube-dl.exe --no-check-certificate $*
gco=git checkout $*
new=touch $*
gf=git flow $*
