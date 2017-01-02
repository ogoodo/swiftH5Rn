//
//  ThreeViewController.swift
//  MySwiftProject
//
//  Created by chen on 2017/1/2.
//  Copyright © 2017年 chen. All rights reserved.
//

import UIKit

class ThreeViewController: UIViewController {

    @IBAction func goHomePage(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated:true)
    }
    @IBAction func goPrevPage(_ sender: UIButton) {
        navigationController?.popViewController(animated:true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
