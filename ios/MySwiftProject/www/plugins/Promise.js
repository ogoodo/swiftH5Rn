
// 参考: http://stackoverflow.com/questions/29249132/wkwebview-complex-communication-between-javascript-native-code
// 使用promise调用native方法

window.msg = (function(){
    function msg() {}
    msg.callbackID = 1;
    msg.handlers = {};

    msg.callback = function (callbackID, error, data) {
        if (error){
            this.handlers[callbackID].resolve(data);
        }else{
            this.handlers[callbackID].reject(data);
        }
        delete this.handlers[callbackID];
    }

    msg.send = function (data) {
        return new Promise((resolve, reject) => {
            const callbackID = this.callbackID++;
            this.handlers[callbackID] = { resolve, reject};
            window.webkit.messageHandlers.myapi.postMessage({data: data, callbackID: callbackID});
        });
    }
    return msg
})()
