{urlToOpen} = JSON.parse(decodeURIComponent(location.search.substr(14)))

console.log urlToOpen

ipc = require 'ipc'
ipc.send('call-window-method', 'show')
ipc.send('call-window-method', 'focus')
window.focus()

ipc.send('call-window-method', 'openDevTools')
