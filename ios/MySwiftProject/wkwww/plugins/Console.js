consoleex = {
log: function (string) {
    window.webkit.messageHandlers.myapi.postMessage({className: 'Console', functionName: 'log', data: string});
}
}
