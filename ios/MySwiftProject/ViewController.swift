//
//  ViewController.swift
//  MySwiftProject
//
//  Created by chen on 2016/12/27.
//  Copyright © 2016年 chen. All rights reserved.
//


import UIKit

// class ViewController: CDVViewController {
class ViewController: UIViewController {
    @IBOutlet weak var myLabel: UILabel!

    @IBAction func go(_ sender: UIButton) {
        self.myLabel.text = "hello world!"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

