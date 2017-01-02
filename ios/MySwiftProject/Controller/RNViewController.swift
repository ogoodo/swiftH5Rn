//
//  RNViewController.swift
//  MySwiftProject
//
//  Created by chen on 2016/12/31.
//  Copyright © 2016年 chen. All rights reserved.
//


import UIKit

// class RNViewController: RCTRootView {
class RNViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        
//       // var strUrl:String = "http://localhost:8081/index.ios.bundle?platform=ios&dev=true";
//        // NSURL * jsCodeLocation = [NSURL URLWithString:strUrl];
//        
//        let rootView:RCTRootView =  RCTRootView();
//            // initWithBundleURL:strUrl, moduleName: "NativeRNApp", initialProperties:nil, launchOptions:nil);
//        self.view = rootView;

//        let bridge = RCTBridge(bundleURL: jsCodeLocation, moduleProvider: nil, launchOptions: nil)
//        
//        let reactRootView = RCTRootView(bridge: bridge, moduleName: "Index", initialProperties: props)
//        
//        self.view.addSubview(reactRootView);
//        reactRootView.frame = self.view.bounds
//        reactRootView.delegate = self;
        
//        let jsCodeLocation:NSURL = "http://localhost:8081/index.ios.bundle?platform=ios&dev=true";
//        let bridge = RCTBridge(bundleURL: jsCodeLocation, moduleProvider: nil, launchOptions: ["controller":self])
//        let controller = self.bridge.launchOptions["controller"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
