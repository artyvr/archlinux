function cln --wraps='sudo yay -Scc && sudo pacman -Rns $(sudo pacman -Qtdq)' --description 'alias cln=sudo yay -Scc && sudo pacman -Rns $(sudo pacman -Qtdq)'
  sudo yay -Scc && sudo pacman -Rns $(sudo pacman -Qtdq) $argv
        
end
