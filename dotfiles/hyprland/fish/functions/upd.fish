function upd --wraps='yay -Syyu --builddir=/tmp --cleanafter' --description 'alias upd=yay -Syyu --builddir=/tmp --cleanafter'
  yay -Syyu --builddir=/tmp --cleanafter $argv
        
end
