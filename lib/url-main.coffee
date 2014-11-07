{urlToOpen} = JSON.parse(decodeURIComponent(location.search.substr(14)))

ipc = require 'ipc'
ipc.send('call-window-method', 'show')
ipc.send('call-window-method', 'focus')
window.focus()

ipc.send('call-window-method', 'openDevTools')
