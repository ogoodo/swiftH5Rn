import UIKit
import WebKit

class WKWebViewController: UIViewController, WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler { // ,
    
    var webView: WKWebView!
    
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
        
        
        let source = "document.body.style.background = \"#F77\";"
        let userScript = WKUserScript(source: source, injectionTime: WKUserScriptInjectionTime.atDocumentEnd, forMainFrameOnly: true)
        
        let userContentController = WKUserContentController()
        userContentController.addUserScript(userScript)
        
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = userContentController
        
        // 添加WLWebView
        self.webView = WKWebView(frame: CGRect(x: 0,
                                               y: webViewTop,
                                               width: screen.size.width,
                                               height: screen.size.height - webViewTop - 10), configuration: configuration)
        self.view.addSubview(webView)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func testLoadHtmlString(sender: AnyObject){
        
        // CODE
        //从本地加载html
        // let path:String! = NSBundle.mainBundle().pathForResource("index", ofType: "html")
        let htmlPath = Bundle.main.path(forResource: "index", ofType: "html")
        webView.load(NSURLRequest(url: NSURL.fileURL(withPath: htmlPath!)) as URLRequest)
        NSLog("click buttonHtmlString")
    }
    
    func testLoadData(sender: AnyObject){
        
//        let htmlPath = Bundle.main.path(forResource: "index", ofType: "html")
//        NSLog("htmlPath: " + htmlPath!)
//        let bundleUrl = URL.init(fileURLWithPath: Bundle.main.bundlePath)
//        let htmlData = NSData(contentsOfFile: htmlPath!)
//        
//        let html2Data  = htmlData as! Data
        
        
//        self.webView.load(html2Data, mimeType: "text/html",
//                          characterEncodingName: "UTF-8",
//                          baseURL: bundleUrl)
        
        NSLog("click buttonLoadData")
    }
    
    func testLoadRequest(sender: AnyObject){
        
        let url = URL(string: "http://www.baidu.com")
        let request = URLRequest(url: url!)
        self.webView.load(request)
        // self.webView.loadRequest(request as URLRequest)
        // 处理加载过程时间, 加载失败等
        self.webView.navigationDelegate = self
        // 处理alert等事件
        self.webView.uiDelegate = self
        
        NSLog("click buttonLoadRequest")
    }
//    
//    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
//        NSLog("开始加载")
//    }
//    
//    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
//        NSLog("内容开始返回")
//    }
//    
//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        NSLog("内容返回完成")
//    }
//    
//    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
//        NSLog("加载失败 error : %@",error.localizedDescription)
//    }
    
    // 调用JS发送POST请求
    func postRequestWithJS() {
        // 发送POST的参数
        let postData = "\"username\":\"aaa\",\"password\":\"123\""
        // 请求的页面地址
        let urlStr = "http://www.postexample.com"
        // 拼装成调用JavaScript的字符串
        let jscript = "post('\(urlStr)', {\(postData)});"
        // 调用JS代码
        webView.evaluateJavaScript(jscript) { (object, error) in
            
        }
    }
}

private typealias wkNavigationDelegate = WKWebViewController
extension wkNavigationDelegate {
    
//    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
//        // NSLog(error.debugDescription)
//    }
//    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
//        // NSLog(error.debugDescription)
//    }
    
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        NSLog("开始加载2")
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        NSLog("内容开始返回2")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        NSLog("内容返回完成2")
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        NSLog("加载失败2 error : %@",error.localizedDescription)
    }
}

private typealias wkUIDelegate = WKWebViewController
extension wkUIDelegate {
    
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        let ac = UIAlertController(title: webView.title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        ac.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: { (aa) -> Void in
            completionHandler()
        }))
        self.present(ac, animated: true, completion: nil)
    }
}

private typealias wkScriptMessageHandler = WKWebViewController
extension wkScriptMessageHandler {
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "OOXX" {
            if let dic = message.body as? NSDictionary,
                let className = (dic["className"] as AnyObject).description,
                let functionName = (dic["functionName"] as AnyObject).description {
//                if let cls = NSClassFromString((Bundle.main.object(forInfoDictionaryKey: "CFBundleName")! as AnyObject).description + "." + className) as? Plugin.Type{
//                    let obj = cls.init()
//                    obj.wk = self.wk
//                    obj.taskId = (dic["taskId"] as AnyObject).intValue
//                    obj.data = (dic["data"] as AnyObject).description
//                    let functionSelector = Selector(functionName)
//                    if obj.responds(to: functionSelector) {
//                        obj.perform(functionSelector)
//                    } else {
//                        print("方法未找到！")
//                    }
//                } else {
//                    print("类未找到！")
//                }
            }
        }
    }
}


// private typealias wkUIDelegate = WKWebViewController
//extension WKWebViewController {
//    
//    func webView(webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
//        let ac = UIAlertController(title: webView.title, message: message, preferredStyle: UIAlertControllerStyle.alert)
//        ac.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: { (aa) -> Void in
//            completionHandler()
//        }))
//        self.present(ac, animated: true, completion: nil)
//    }
//}
