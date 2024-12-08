function ls --wraps='eza --tree --level=1 --icons=always --no-time --no-user --no-permissions' --description 'alias ls=eza --tree --level=1 --icons=always --no-time --no-user --no-permissions'
  eza --tree --level=1 --icons=always --no-time --no-user --no-permissions $argv
        
end
