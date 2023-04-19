# BashIDE

Suite of commands to setup terminal to act as IDE.
I recomend creating alias:
`alias op='lscd.sh ~/Documents/Cpp/'`

`lscd.sh` lists content of your projects directory in this case `~/Documents/Cpp/'`. Than it asks user for input. User either chooses a number after which `bashIDE.sh` is used in corresponfing folder. Or user can type new wchich will create new project and than run `bashIDE.sh`.

`bashIDE.sh` uses tmux to setup terminal for programming. It creates main window called `Editor` in split horizontaly. It is set up to run both nvim and cd into build folder. It also creates git window which runs git status. 

`addNewHpp.sh` creates new hpp in src folder and a test suite in test folder.
