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
    let cellName = "TestTabViewCell"
    let cellReuseIdentifier = "testCell"
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as?
                TestTabViewCell else {
                    return UICollectionViewCell()
                }
        let target = testList[indexPath.row]
        
        let img = UIImage(named: "\(target.image).png")
        cell.testImage?.image = img
        cell.testLabel?.text = target.title
        
        return cell
    }

    @IBOutlet weak var background: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        background.setGradient(color1: .primary ?? .white, color2: .subPrimary ?? .black)
        
        registerXib()
        
        collectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
    }
    
    private func registerXib() {
        let nibName = UINib(nibName: cellName, bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: cellReuseIdentifier)
    }

}
