fx_version 'bodacious'

game 'gta5'

files {
  'html/vhs.ttf',
  'html/main.js',
  'html/index.html',
}
   
ui_page 'html/index.html'

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  'server/*.lua'
}
   
client_scripts {
  'config.lua',
  'client/*.lua'
}
   
