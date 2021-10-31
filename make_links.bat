set UP_PAUL=C:\Users\Paul
set DOT_FILES_DIR=%UP_PAUL%\dotfiles
set APP_DATA=%UP_PAUL%\AppData

mklink /D "%APP_DATA%\Local\nvim" "%DOT_FILES_DIR%\.config\nvim"
mklink "%UP_PAUL%\.vimrc" "%DOT_FILES_DIR%\.vimrc"

mklink /D "%APP_DATA%\Vifm" "%DOT_FILES_DIR%\.config\vifm"

mklink "%UP_PAUL%\.gitconfig" "%DOT_FILES_DIR%\.gitconfig"
mklink "%UP_PAUL%\.kdiff3rc" "%DOT_FILES_DIR%\.kdiff3rc"

pause
