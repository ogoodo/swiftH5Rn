$(function(){
	showInfo("开始渲染btns")
	btnsInit()

	//显示屏幕宽高
	$(".screnn").html("宽："+document.body.clientWidth+" 高："+document.body.clientHeight )

})


var showInfo = function(msg){
	$(".info").html(msg);
}

var hi = function(){
	alert("hi")

	$(".info").html("hi2");
}

var hello = function(msg){
	alert("hello " + msg)
	if(msg.obj != undefined)
		alert(msg.obj)
}

var getName = function(){
	return "liuyanwei"
}


var btnsInit = function(){
	var btns = [
		"js-btn:调用自身js的hi方法",
		"js-btn:调用ios的hello方法",
		"打开一个窗口",
		"返回一个窗口",
		"返回根窗口",
	]
	$.each(btns,function(i,item){
		var btnHtml = "<a>" + item+"</a>"
		$(".btns").append(btnHtml)
	})
	$(".btns a").click(function(){
		var btnText = $(this).html()
		showInfo("你点击了："+btnText)
		if (btnText ==btns[0]) {
			hi()
		}
        if (btnText ==btns[1]) {
            // consoleex.log('nihao')
            window.mytest.testPromiseCallbackSuccess('testPromiseCallbackSuccess..')
			.then(function() {
				console.log('调用native后promise返回成功')
			}).catch(function() {
				console.log('调用native后promise返回失败')
			});
            window.mytest.testPromiseCallbackFail('testPromiseCallbackFail..')
			.then(function() {
				console.log('调用native后promise返回成功')
			}).catch(function() {
				console.log('调用native后promise返回失败')
			});
            // window.mytest.jsCallNative('hi')
			var message = {
                            'className': 'Callme',
                            'functionName': 'testfunc',
							'method' : 'hello',
							'param1' : 'liuyanwei',
					    	};
            // window.webkit.messageHandlers.myapi.postMessage(message);
		}
        if (btnText ==btns[2]) {
            window.mytest.pushH5('testPromiseCallbackSuccess..')
			.then(function() {
				console.log('调用native后promise返回成功')
			}).catch(function() {
				console.log('调用native后promise返回失败')
			});
		}
        if (btnText ==btns[3]) {
            window.mytest.popH5('testPromiseCallbackSuccess..')
			.then(function() {
				console.log('调用native后promise返回成功')
			}).catch(function() {
				console.log('调用native后promise返回失败')
			});
		}
        if (btnText ==btns[4]) {
            window.mytest.popToRoot('testPromiseCallbackSuccess..')
			.then(function() {
				console.log('调用native后promise返回成功')
			}).catch(function() {
				console.log('调用native后promise返回失败')
			});
		}
	})

	showInfo("html加载完成")
}
