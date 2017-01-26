import UIKit
import WebKit


class WKWebViewController: UIViewController, WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler {
    
    var wk: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barHeight: CGFloat = 60
        let btnHeight: CGFloat = 30;
        let webViewTop: CGFloat = barHeight + btnHeight;
        let screen = UIScreen.main.bounds
        
        // 添加按钮栏
        let buttonBarWidth:CGFloat = 316
        let buttonBar = UIView(frame: CGRect(x: (screen.size.width - buttonBarWidth)/2,
                                             y: barHeight, width: buttonBarWidth, height: btnHeight))
        self.view.addSubview(buttonBar)
        
        // 添加加载htmlString按钮到按钮栏
        let buttonHtmlString = UIButton(type: UIButtonType.system)
        buttonHtmlString.setTitle("LoadHtmlString", for: UIControlState.normal)
        buttonHtmlString.frame = CGRect(x: 0, y: 0, width: 117, height: btnHeight)
        buttonHtmlString.addTarget(self,
                                   action: #selector(self.testLoadHtmlString(sender:)),
                                   for: UIControlEvents.touchUpInside)
        buttonBar.addSubview(buttonHtmlString)
        
        // 添加loadData按钮到按钮栏
        let buttonLoadData = UIButton(type: UIButtonType.system)
        buttonLoadData.setTitle("loadData", for: UIControlState.normal)
        buttonLoadData.frame = CGRect(x: 137, y: 0, width: 67, height: btnHeight)
        buttonLoadData.addTarget(self,
                                 action: #selector(self.testLoadData(sender:)),
                                 for: UIControlEvents.touchUpInside)
        buttonBar.addSubview(buttonLoadData)
        
        // 添加loadRequest按钮到按钮栏
        let buttonLoadRequest = UIButton(type: UIButtonType.system)
        buttonLoadRequest.setTitle("loadRequest", for: UIControlState.normal)
        buttonLoadRequest.addTarget(self,
                                    action: #selector(self.testLoadRequest(sender:)),
                                    for: UIControlEvents.touchUpInside)
        buttonLoadRequest.frame = CGRect(x: 224, y: 0, width: 92, height: btnHeight)
        buttonBar.addSubview(buttonLoadRequest)
        
        // http://www.jianshu.com/p/0042d8eb67c0
        // WKUserScript 允许在正文加载之前或之后注入到页面中
        let source = "document.body.style.background = \"#aaa\";"
        let userScript = WKUserScript(source: source, injectionTime: WKUserScriptInjectionTime.atDocumentEnd, forMainFrameOnly: true)
        
        let userContentController = WKUserContentController()
        userContentController.addUserScript(userScript)
        let handler = self
        userContentController.add(handler, name: "myapi")

        
        let conf = WKWebViewConfiguration()
        conf.userContentController = userContentController
        
        // 添加WLWebView
        self.wk = WKWebView(frame: CGRect(x: 0,
                                               y: webViewTop,
                                               width: screen.size.width,
                                               height: screen.size.height - webViewTop - 10), configuration: conf)
        self.view.addSubview(self.wk)
        
        // 处理加载过程时间, 加载失败等
        self.wk.navigationDelegate = self
        // 处理alert等事件
        self.wk.uiDelegate = self
        self.runPluginJS(["Callme",  "Console"])
        // self.runPluginJS(["Callme", "Base", "Console", "Accelerometer"])
        //监听状态
        self.wk.addObserver(self, forKeyPath: "loading", options: .new, context: nil)
        self.wk.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
//        //监听是否可以前进后退，修改btn.enable属性
//        self.wk.addObserver(self, forKeyPath: "loading", options: .new, context: nil)
//        //监听加载进度
//        self.wk.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        //        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 注入JS, 在页面加载前就能注入好
    func runPluginJS(_ names: Array<String>) {
        for name in names {
            let path = Bundle.main.path(forResource: name, ofType: "js")
            // let path3 = Bundle.main.path(forResource: name, ofType: "js", inDirectory: "www/plugins")
            if path != nil {
                do {
                    let js = try NSString(contentsOfFile: path!, encoding: String.Encoding.utf8.rawValue)
                    self.wk.evaluateJavaScript(js as String, completionHandler: nil)
                } catch let error as NSError {
                    NSLog(error.debugDescription)
                }
            }
        }
    }

    func testLoadHtmlString(sender: AnyObject){
        
        // CODE
        //从本地加载html
        // let path:String! = NSBundle.mainBundle().pathForResource("index", ofType: "html")
        let htmlPath = Bundle.main.path(forResource: "index3", ofType: "html")
        wk.load(NSURLRequest(url: NSURL.fileURL(withPath: htmlPath!)) as URLRequest)
        NSLog("click buttonHtmlString")
    }
    
    func testLoadData(sender: AnyObject){
        
//        let htmlPath = Bundle.main.path(forResource: "index", ofType: "html")
//        NSLog("htmlPath: " + htmlPath!)
//        let bundleUrl = URL.init(fileURLWithPath: Bundle.main.bundlePath)
//        let htmlData = NSData(contentsOfFile: htmlPath!)
//        
//        let html2Data  = htmlData as! Data
        
        
//        self.wk.load(html2Data, mimeType: "text/html",
//                          characterEncodingName: "UTF-8",
//                          baseURL: bundleUrl)
        
        NSLog("click buttonLoadData")
    }
    
    func testLoadRequest(sender: AnyObject){
        
        let url = URL(string: "http://www.baidu.com")
        let request = URLRequest(url: url!)
        self.wk.load(request)
        // self.wk.loadRequest(request as URLRequest)
//        // 处理加载过程时间, 加载失败等
//        self.wk.navigationDelegate = self
//        // 处理alert等事件
//        self.wk.uiDelegate = self
        
        NSLog("click buttonLoadRequest")
    }
    
    // 调用JS发送POST请求
    func postRequestWithJS() {
        // 发送POST的参数
        let postData = "\"username\":\"aaa\",\"password\":\"123\""
        // 请求的页面地址
        let urlStr = "http://www.postexample.com"
        // 拼装成调用JavaScript的字符串
        let jscript = "post('\(urlStr)', {\(postData)});"
        // 调用JS代码
        wk.evaluateJavaScript(jscript) { (object, error) in
            
        }
    }
    func webViewDidFinishLoad(webView: UIWebView) {
        
        let context = webView.value(forKeyPath: "documentView.webView.mainFrame.javaScriptContext") as? JSContext
        
        let callBack : @convention(block) (AnyObject?) -> Void = { [weak self] (paramFromJS) -> Void in
            //    Waiting
        }
        
        context?.setObject(unsafeBitCast(callBack, to: AnyObject.self), forKeyedSubscript: "callNative" as (NSCopying & NSObjectProtocol)!)
    }
    
    //监控webView变量
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        NSLog("observeValue:\(keyPath)")
        //是否读取完成
        if (keyPath == "loading") {
//            gobackBtn.isEnabled = webView.canGoBack
//            forwardBtn.isEnabled = webView.canGoForward
        }
        //加载进度
        if (keyPath == "estimatedProgress") {
//            progress.isHidden = webView.estimatedProgress==1
//            progress.setProgress(Float(webView.estimatedProgress), animated: true)
        }
    }
}


//// 接收到服务器跳转请求之后调用
//- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation;
//// 在收到响应后，决定是否跳转
//- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler;
//// 在发送请求之前，决定是否跳转
//- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler;

// WKNavigationDelegate: 提供了追踪主窗口网页加载过程和判断主窗口和子窗口是否进行页面加载新页面的相关方法
private typealias wkNavigationDelegate = WKWebViewController
extension wkNavigationDelegate {
    
//    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
//        // NSLog(error.debugDescription)
//    }
//    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
//        // NSLog(error.debugDescription)
//    }
    
    // 页面开始加载时调用
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        NSLog("页面开始加载时调用")
    }
    // 当内容开始返回时调用
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        NSLog("当内容开始返回时调用")
    }
    
    // 页面加载完成之后调用
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // let context = webView.value(forKeyPath: "documentView.webView.mainFrame.javaScriptContext")
        NSLog("内容返回完成2")
    }
    
    // 页面加载失败时调用
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        NSLog("加载失败2 error : %@",error.localizedDescription)
    }
}

// WKUIDelegate: 提供用原生控件显示网页的方法回调。
private typealias wkUIDelegate = WKWebViewController
extension wkUIDelegate {
    
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        let ac = UIAlertController(title: webView.title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        ac.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: { (aa) -> Void in
            completionHandler()
            NSLog("alert finish")
        }))
        self.present(ac, animated: true, completion: nil)
    }
}

// WKScriptMessageHandler: 提供从网页中收消息的回调方法。

private typealias wkScriptMessageHandler = WKWebViewController
extension wkScriptMessageHandler {
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print("userContentController:", message.name)
        print("userContentController:", message.body)
        if message.name == "myapi" {
            if let dic = message.body as? NSDictionary,
                let className = (dic["className"] as AnyObject).description,
                let functionName = (dic["functionName"] as AnyObject).description {
                if let cls = NSClassFromString((Bundle.main.object(forInfoDictionaryKey: "CFBundleName")! as AnyObject).description + "." + className) as? Plugin.Type{
                    let obj = cls.init()
                    obj.wk = self.wk
                    obj.taskId = (dic["taskId"] as AnyObject).intValue
                    obj.data = (dic["data"] as AnyObject).description
                    let functionSelector = Selector(functionName)
                    if obj.responds(to: functionSelector) {
                        obj.perform(functionSelector)
                    } else {
                        print("方法未找到！")
                    }
                } else {
                    print("类未找到！")
                }
            }
        }
    }
}
//private typealias wkScriptMessageHandler = WKWebViewController
//extension wkScriptMessageHandler {
//    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
//        print("userContentController:", message.name)
//        print("userContentController:", message.body)
//        if message.name == "myapi" {
//            //直接执行alert
//            // self.webView.stringByEvaluatingJavaScriptFromString("alert('hi')")
//            self.webView.evaluateJavaScript("alert('from native call js alert')")
//            // self.webView.evaluateJavaScript(<#T##javaScriptString: String##String#>, completionHandler: <#T##((Any?, Error?) -> Void)?##((Any?, Error?) -> Void)?##(Any?, Error?) -> Void#>)
//            //执行有返回值的js函数
//            // NSLog("%@", self.webView.stringByEvaluatingJavaScriptFromString("getName()")!)
//            if let dic = message.body as? NSDictionary,
//                let className = (dic["className"] as AnyObject).description,
//                let functionName = (dic["functionName"] as AnyObject).description {
//                if let cls = NSClassFromString((Bundle.main.object(forInfoDictionaryKey: "CFBundleName")! as AnyObject).description + "." + className) as? NSObject.Type{
//                    let obj = cls.init()
//                    let functionSelector = Selector(functionName)
//                    if obj.responds(to: functionSelector) {
//                        obj.perform(functionSelector)
//                    } else {
//                        print("方法未找到！")
//                    }
//                } else {
//                    print("类未找到！")
//                }            }
//        }
//    }
//}

