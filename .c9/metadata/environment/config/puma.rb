{"filter":false,"title":"puma.rb","tooltip":"/config/puma.rb","undoManager":{"mark":1,"position":1,"stack":[[{"start":{"row":37,"column":0},"end":{"row":38,"column":0},"action":"insert","lines":["",""],"id":2}],[{"start":{"row":38,"column":0},"end":{"row":51,"column":3},"action":"insert","lines":["bind \"unix://#{Rails.root}/tmp/sockets/puma.sock\"","rails_root = Dir.pwd","# 本番環境のみデーモン起動","if Rails.env.production?","  pidfile File.join(rails_root, 'tmp', 'pids', 'puma.pid')","  state_path File.join(rails_root, 'tmp', 'pids', 'puma.state')","  stdout_redirect(","    File.join(rails_root, 'log', 'puma.log'),","    File.join(rails_root, 'log', 'puma-error.log'),","    true","  )","  # デーモン","  daemonize","end"],"id":3}]]},"ace":{"folds":[],"scrolltop":456,"scrollleft":0,"selection":{"start":{"row":51,"column":3},"end":{"row":51,"column":3},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":{"row":41,"state":"start","mode":"ace/mode/ruby"}},"hash":"215b5446562d3cb0ba838514202cd1b20dfe972b","mime":"text/x-script.ruby","timestamp":1654339338877}