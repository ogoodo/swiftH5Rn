//
//  Plugin.swift
//  MySwiftProject
//
//  Created by chen on 2017/1/26.
//  Copyright © 2017年 chen. All rights reserved.
//

import UIKit
import WebKit

class Plugin: NSObject {
    var wk: WKWebView!
    var callbackId: Int!
    var param: Dictionary<String, Any>?
//    var taskId: Int!
    // var data: String?
    required override init() {
    }
    func getParam() -> String? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self.param!, options: JSONSerialization.WritingOptions())
            let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue) as? String
            return jsonString!
        } catch let error as NSError{
            NSLog(error.debugDescription)
            return ""
        }
    }
    func callbackSuccess(_ values: NSDictionary) -> Bool {
        return self.callbackJs(0, values)
    }
    func callbackFail(_ error: Int, _ values: NSDictionary) -> Bool {
        if error < 1 {
            NSLog("❌回调js失败函数error必须大于0")
            return false
        }
        return self.callbackJs(error, values)
    }
    // 处理完成回调js
    private func callbackJs(_ error: Int, _ values: NSDictionary) -> Bool {
        if self.callbackId == nil {
            NSLog("❌回调js函数callbackId不能为nil")
            return false
        }
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: values, options: JSONSerialization.WritingOptions())
            if let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue) as? String {
                let js = "window.msg.callback(\(self.callbackId!), \(error), '\(jsonString)');"
                self.wk.evaluateJavaScript(js, completionHandler: { (any, error) -> Void in
                    if error != nil {
                        NSLog("JS回调内容:%@", js)
                        NSLog("❌回调JS错误:%@", error.debugDescription)
                        // NSLog("%@", any as! String)
                    }
                })
                return true
            }
        } catch let error as NSError{
            NSLog(error.debugDescription)
            return false
        }
        return false
    }
//    func callback2(_ values: NSDictionary) -> Bool {
//        do {
//            let jsonData = try JSONSerialization.data(withJSONObject: values, options: JSONSerialization.WritingOptions())
//            if let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue) as? String {
//                let js = "fireTask(\(self.taskId), '\(jsonString)');"
//                self.wk.evaluateJavaScript(js, completionHandler: nil)
//                return true
//            }
//        } catch let error as NSError{
//            NSLog(error.debugDescription)
//            return false
//        }
//        return false
//    }
//    func errorCallback(_ errorMessage: String) {
//        let js = "onError(\(self.taskId), '\(errorMessage)');"
//        self.wk.evaluateJavaScript(js, completionHandler: nil)
//    }
}
