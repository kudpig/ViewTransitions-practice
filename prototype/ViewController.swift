//
//  ViewController.swift
//  prototype
//
//  Created by shinichiro kudo on 2021/01/02.
//  Copyright © 2021 shinichiro kudo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func moveSecondView(_ sender: Any) {
        // ボタンが押された時に画面遷移を行う設定をする
        performSegue(withIdentifier: "firstTransitions", sender: nil)
    }
    
    
}

