//
//  StoryboardIdentifiable.swift
//  MySwiftProject
//
//  Created by chen on 2017/1/2.
//  Copyright © 2017年 chen. All rights reserved.
//

import UIKit

protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}
