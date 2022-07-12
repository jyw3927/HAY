//
//  TestTabViewController.swift
//  HAY
//
//  Created by 전영우 on 2022/06/20.
//

import UIKit

class TestTabViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let testList = Test.data
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "testCell", for: indexPath) as?
                TestCell else {
                    return UICollectionViewCell()
                }
        
        let img = UIImage(named: "\(testList[indexPath.row].image).png")
        cell.testImage?.image = img
        cell.testLabel?.text = testList[indexPath.row].title
        
        return cell
    }

    @IBOutlet weak var background: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        background.setGradient(color1: .primary ?? .white, color2: .subPrimary ?? .black)
        
        collectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
    }

}

class TestCell: UICollectionViewCell {
    
    @IBOutlet weak var testImage: UIImageView!
    @IBOutlet weak var testLabel: UILabel!
    
}
