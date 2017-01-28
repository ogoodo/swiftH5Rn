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
    var taskId: Int!
    var data: String?
    required override init() {
    }
    // 处理完成回调js
    func callback(_ error: Bool, _ values: NSDictionary) -> Bool {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: values, options: JSONSerialization.WritingOptions())
            if let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue) as? String {
                let js = "window.msg.callback(\(self.callbackId), \(error), '\(jsonString)');"
                self.wk.evaluateJavaScript(js, completionHandler: nil)
                return true
            }
        } catch let error as NSError{
            NSLog(error.debugDescription)
            return false
        }
        return false
    }
    func callback2(_ values: NSDictionary) -> Bool {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: values, options: JSONSerialization.WritingOptions())
            if let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue) as? String {
                let js = "fireTask(\(self.taskId), '\(jsonString)');"
                self.wk.evaluateJavaScript(js, completionHandler: nil)
                return true
            }
        } catch let error as NSError{
            NSLog(error.debugDescription)
            return false
        }
        return false
    }
    func errorCallback(_ errorMessage: String) {
        let js = "onError(\(self.taskId), '\(errorMessage)');"
        self.wk.evaluateJavaScript(js, completionHandler: nil)
    }
}
