
// 参考: http://stackoverflow.com/questions/29249132/wkwebview-complex-communication-between-javascript-native-code
// 使用promise调用native方法

window.msg = (function(){
    function msg() {}
    msg.callbackID = 1;
    msg.handlers = {};

    /**
     * @param {number} callbackID
     * @param {number} error 0:成功, >0部分表示失败原因
     * @param {object} data native传递给js的参数
     */
    msg.callback = function (callbackID, error, data) {
        console.log('msg.callback:', callbackID, error, data)
        if (error){
            this.handlers[callbackID].reject(data);
        }else{
            this.handlers[callbackID].resolve(data);
        }
        delete this.handlers[callbackID];
    }

    msg.send = function (className, functionName, data) {
        return new Promise((resolve, reject) => {
            const callbackID = this.callbackID++;
            this.handlers[callbackID] = { resolve, reject};
            var param = {
                className: className,
                functionName: functionName,
                callbackID: callbackID,
                param: data
            }
            window.webkit.messageHandlers.myapi.postMessage(param);
        });
    }
    return msg
})()
