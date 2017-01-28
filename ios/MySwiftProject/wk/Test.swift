//
//  Test.swift
//  MySwiftProject
//
//  Created by chen on 2017/1/27.
//  Copyright © 2017年 chen. All rights reserved.
//

import UIKit

class Test: Plugin {
    func jsCallNative() {
        if let string = self.data {
            NSLog("native函数jsCallNative输出>>> " + string)
        }
        self.nativeCallJs()
    }
    
    func nativeCallJs() {
        NSLog("native函数nativeCallJs输出>>>")
        self.wk.evaluateJavaScript("window.mytest.getName()") { (any,error) -> Void in
            NSLog("native函数nativeCallJs调用JS函数window.mytest.getName()输出:%@", any as! String)
        }
    }

}
