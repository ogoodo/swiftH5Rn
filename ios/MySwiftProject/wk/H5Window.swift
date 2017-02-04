//
//  H5Window.swift
//  MySwiftProject
//
//  Created by chen on 2017/1/29.
//  Copyright © 2017年 chen. All rights reserved.
//

import UIKit

class H5Window: Plugin {
    private static var navigationController: UINavigationController?
    static var dicH5 = Dictionary<Int, UIViewController>()
    static var indexH5 = 0
    
    static func setNav(_ navigationController: UINavigationController?) {
        if navigationController == nil {
            NSLog("没有navigation")
            return
        } else {
            H5Window.navigationController = navigationController
        }
    }

    func pushH5() {
        let sb = UIStoryboard(storyboard: .WKH5)
        let vc: WKWebViewController = sb.instantiateViewController()
        // 隐藏下部的tab按钮
        vc.hidesBottomBarWhenPushed = true
        H5Window.navigationController?.pushViewController(vc, animated: true)
        // H5Window.navigationController?.setNavigationBarHidden(true, animated: true)
        H5Window.indexH5 = H5Window.indexH5 + 1;
        H5Window.dicH5[H5Window.indexH5] = vc
        let test = H5Window.dicH5
        let dic: NSDictionary  = ["a":"b", "C":"D"];
        _ = self.callbackSuccess(dic)
    }

    func popH5ById() {
        // H5Window.navigationController?.viewControllers[1]
        //通过堆栈顺序获取要跳转的视图控制器
        let vc = (H5Window.navigationController?.viewControllers[1])! as UIViewController
        H5Window.navigationController?.popToViewController(vc, animated: true)
        let dic: NSDictionary  = ["a":"b", "C":"D"];
    }

    func popH5WithCount(popCount count:Int) {
        if count < 1 || count > H5Window.dicH5.count {
            NSLog("关闭窗口超出了已有窗口的范围")
            return;
        }
        NSLog("栈内的H5Window")
        for (key, value) in H5Window.dicH5{
            print("key:\(key) value:\(value)")
        }
        H5Window.dicH5.removeValue(forKey: H5Window.indexH5)
        H5Window.indexH5 = H5Window.indexH5 - count;
        H5Window.navigationController?.popViewController(animated: true)
    }

    static func popH5Static() {
        NSLog("栈内的H5Window")
        for (key, value) in H5Window.dicH5{
            print("key:\(key) value:\(value)")
        }
        H5Window.dicH5.removeValue(forKey: H5Window.indexH5)
        H5Window.indexH5 = H5Window.indexH5 - 1;
        H5Window.navigationController?.popViewController(animated: true)
    }

    func popH5() {
        self.popH5WithCount(popCount: 1)
        // H5Window.popH5Static()
    }

    func popToRoot(){
        H5Window.dicH5 = Dictionary<Int, UIViewController>()
        H5Window.indexH5 = 0;
        H5Window.navigationController?.popToRootViewController(animated:true)
        // H5Window.navigationController?.
    }

    static func pushH5B() {
        
    }
}
