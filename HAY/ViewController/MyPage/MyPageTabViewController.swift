//
//  MyPageTabViewController.swift
//  HAY
//
//  Created by 전영우 on 2022/06/20.
//

import UIKit

class MyPageTabViewController: UIViewController {

    @IBOutlet weak var background: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        background.setGradient(color1: .primary ?? .white, color2: .subPrimary ?? .black)
    }

}
