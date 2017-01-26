//
//  Console.swift
//  MySwiftProject
//
//  Created by chen on 2017/1/26.
//  Copyright © 2017年 chen. All rights reserved.
//

import UIKit

class Console: Plugin {
    func log() {
        if let string = self.data {
            NSLog("SwiftConsole>>> " + string)
        }
    }

}
