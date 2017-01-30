//
//  ReactView.swift
//  MySwiftProject
//
//  Created by chen on 2017/1/2.
//  Copyright © 2017年 chen. All rights reserved.
//

import UIKit
// import React

class ReactView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    // let url22 = NSURL(string: "http://localhost:8081/index.ios.bundle?platform=ios")
    // let url = NSURL(string: "http://192.168.1.105:8081/index.ios.bundle?platform=ios&dev=true")
    let rootView: RCTRootView = RCTRootView(
        // bundleURL: NSURL(string: "http://192.168.1.105:8081/index.ios.bundle?platform=ios&dev=true") as URL!,
        bundleURL: NSURL(string: "http://10.180.186.4:8081/index.ios.bundle?platform=ios&dev=true") as URL!,
        // bundleURL: url as URL!,
        moduleName:"MySwiftProject", initialProperties: nil, launchOptions: nil)
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        loadReact()
    }
    
    func loadReact () {
        addSubview(rootView)
        rootView.frame = self.bounds
    }

}
