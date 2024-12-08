function artnas --wraps='ssh art@192.168.1.20' --description 'alias artnas=ssh art@192.168.1.20'
  ssh art@192.168.0.20 $argv
        
end
