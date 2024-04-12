@set UP_PAUL=C:\Users\Paul
@set DOT_FILES_DIR=%UP_PAUL%\dotfiles
@set APP_DATA=%UP_PAUL%\AppData
@set NVIM_DIR=%DOT_FILES_DIR%\.config\nvim

mklink /D "%APP_DATA%\Local\nvim" NVIM_DIR
mklink "%UP_PAUL%\.vimrc" "%NVIM_DIR%\vimrc.vim"
mklink /D "%APP_DATA%\Roaming\Vifm" "%DOT_FILES_DIR%\.config\vifm"
mklink /D %APP_DATA%\Roaming\bug.n %DOT_FILES_DIR%\bug.n
mklink "%UP_PAUL%\.gitconfig" "%DOT_FILES_DIR%\.gitconfig"

pause
