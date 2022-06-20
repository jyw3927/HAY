//
//  ViewController.swift
//  HAY
//
//  Created by 전영우 on 2022/06/19.
//

import UIKit

class GameTabViewController: UIViewController {

    @IBOutlet var background: UIView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        background.setGradient(color1: .primary ?? .white, color2: .subPrimary ?? .black)
    }


}

