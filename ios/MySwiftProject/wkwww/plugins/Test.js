window.mytest = {
    getName: function() {
        return "js函数mytest.getName输出>>>hi test"
    },
    jsCallNative: function (string) {
        window.webkit.messageHandlers.myapi.postMessage({className: 'Test', functionName: 'jsCallNative', data: string});
    },
    testPromiseCallback: function(str) {
        window.msg.send('Test', 'testPromiseCallback', {data: str} );
        // window.webkit.messageHandlers.myapi.postMessage({className: 'Test', functionName: 'testPromiseCallback', data: str});
    }
}
