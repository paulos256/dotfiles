set UP_PAUL=C:\Users\Paul
set DOT_FILES_DIR=%UP_PAUL%\dotfiles
set APP_DATA=%UP_PAUL%\AppData

mklink /D "%APP_DATA%\Local\nvim" "%DOT_FILES_DIR%\.config\nvim"
mklink "%UP_PAUL%\.vimrc" "%DOT_FILES_DIR%\.vimrc"
mklink /D "%APP_DATA%\Roaming\Vifm" "%DOT_FILES_DIR%\.config\vifm"
mklink "%APP_DATA%\Roaming\bug.n\Config.ini" "%DOT_FILES_DIR%\bug.n\Config.ini"
mklink "%UP_PAUL%\.gitconfig" "%DOT_FILES_DIR%\.gitconfig"

pause
