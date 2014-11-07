{urlToOpen} = JSON.parse(decodeURIComponent(location.search.substr(14)))

pathToOpen = null # TODO Figure this out from the urlToOpen

ipc = require 'ipc'
ipc.send('call-window-method', 'show')
ipc.send('call-window-method', 'focus')
window.focus()

ipc.send('call-window-method', 'openDevTools')

# TODO Once you have the path to open, uncomment this line
# ipc.send('open', {pathsToOpen: [pathToOpen]})

# TODO Once done, uncomment this to close the window
# require('remote').getCurrentWindow().close()
