window.mytest = {
    getName: function() {
        return "js函数mytest.getName输出>>>hi test"
    },

    jsCallNative: function (string) {
        window.webkit.messageHandlers.myapi.postMessage({className: 'Test', functionName: 'jsCallNative', data: string});
    },

    testPromiseCallbackSuccess: function(str) {
        return window.msg.send('Test', 'testPromiseCallbackSuccess', {data: str} )
        // window.webkit.messageHandlers.myapi.postMessage({className: 'Test', functionName: 'testPromiseCallback', data: str});
    },

    testPromiseCallbackFail: function(str) {
        return window.msg.send('Test', 'testPromiseCallbackFail', {data: str} )
    },

    pushH5: function(str) {
        return window.msg.send('H5Window', 'pushH5', {data: str} )
    },

    popH5: function(str) {
        return window.msg.send('H5Window', 'popH5', {data: str} )
    },

    popToRoot: function(str) {
        return window.msg.send('H5Window', 'popToRoot', {data: str} )
    }
}
