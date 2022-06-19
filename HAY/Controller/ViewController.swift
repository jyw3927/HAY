//
//  ViewController.swift
//  HAY
//
//  Created by 전영우 on 2022/06/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var bgView: UIView!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        bgView.setGradient(color1: .primary ?? .white, color2: .subPrimary ?? .black)
    }


}

