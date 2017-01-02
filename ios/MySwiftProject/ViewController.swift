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

    @IBAction func openSBMyRnView(_ sender: UIButton, forEvent event: UIEvent) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "myRnView") else {
            print("View controller myRnView not found")
            return
        }
        navigationController?.pushViewController(vc, animated: true)
        return;
    }
    
    @IBAction func openSBMyH5View(_ sender: UIButton, forEvent event: UIEvent) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "myH5View") else {
            print("View controller myH5View not found")
            return
        }
        navigationController?.pushViewController(vc, animated: true)
        return;
    }

    @IBAction func openXibTwoView(_ sender: UIButton, forEvent event: UIEvent) {
        let vc = TwoViewController(nibName: "TwoViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func openOtherSbView(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Second", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "First")as? UIViewController
        self.navigationController?.pushViewController(vc!, animated: true)

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

