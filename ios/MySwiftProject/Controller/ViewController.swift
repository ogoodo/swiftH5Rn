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
    
    //        guard let vc = storyboard?.instantiateViewController(withIdentifier: "RNViewController") else {
    //            print("View controller myRnView not found")
    //            return
    //        }
    //        navigationController?.pushViewController(vc, animated: true)
    //        return;
    @IBAction func openSBMyRnView(_ sender: UIButton, forEvent event: UIEvent) {
//        let sb = UIStoryboard(storyboard: .Main)
//        let vc: RNViewController = sb.instantiateViewController()
//        navigationController?.pushViewController(vc, animated: true)
        
        let sb = UIStoryboard(storyboard: .ReactNative)
        let vc: RNViewController = sb.instantiateViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func openSBMyH5View(_ sender: UIButton, forEvent event: UIEvent) {
//        guard let vc = storyboard?.instantiateViewController(withIdentifier: "myH5View") else {
//            print("View controller myH5View not found")
//            return
        //        }
        let sb = UIStoryboard(storyboard: .Main)
        let vc: H5ViewController = sb.instantiateViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func openXibTwoView(_ sender: UIButton, forEvent event: UIEvent) {
        let vc = TwoViewController(nibName: "TwoViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func openOtherSbView(_ sender: UIButton) {
        let sb = UIStoryboard(storyboard: .Second)
        let vc: SecondOneViewController = sb.instantiateViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func openSecondTwoSbView(_ sender: UIButton) {
        let sb = UIStoryboard(storyboard: .Second)
        let vc: SecondTwoViewController = sb.instantiateViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func openWKWebView(_ sender: UIButton) {
//        let sb = UIStoryboard(storyboard: .WKH5)
//        let vc: WKWebViewController = sb.instantiateViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
//        // self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        let wk = H5Window()
        wk.pushH5();
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        H5Window.navigationController = self.navigationController;
        // self.navigationController?.setNavigationBarHidden(true, animated: true )
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

