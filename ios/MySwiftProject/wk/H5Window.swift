//
//  H5Window.swift
//  MySwiftProject
//
//  Created by chen on 2017/1/29.
//  Copyright © 2017年 chen. All rights reserved.
//

import UIKit

class H5Window: Plugin {
    static var navigationController: UINavigationController?
    
    func pushH5() {
        let sb = UIStoryboard(storyboard: .Main)
        let vc: WKWebViewController = sb.instantiateViewController()
        H5Window.navigationController?.pushViewController(vc, animated: true)
        // H5Window.navigationController?.setNavigationBarHidden(true, animated: true)
        let dic: NSDictionary  = ["a":"b", "C":"D"];
        _ = self.callbackSuccess(dic)
    }
    
    func popH5() {
        H5Window.navigationController?.popViewController(animated: true)
    }
    
    func popToRoot(){
        H5Window.navigationController?.popToRootViewController(animated:true)
        // H5Window.navigationController?.
    }

    static func pushH5B() {
        
    }
}
