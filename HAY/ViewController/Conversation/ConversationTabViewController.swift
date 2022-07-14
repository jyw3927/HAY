//
//  ConversationTabViewController.swift
//  HAY
//
//  Created by 전영우 on 2022/06/20.
//

import UIKit

class ConversationTabViewController: UIViewController {
    
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
        let conversationList = Conversation.data
        let cellName = "ConversationTabViewCell"
        let cellReuseIdentifier = "conversationCell"
    //
    //    let cellSize = CGSize(width: 200, height: 500)
    //    var minItemSpacing: CGFloat = 20
    //    let cellCount = 8
    //    var previousIndex = 0
    //
    //    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    //        return conversationList.count
    //    }
    
    //    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    //        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as?
    //                ConversationTabViewCell else {
    //                    return UICollectionViewCell()
    //                }
    //        let target = conversationList[indexPath.row]
    //
    //        cell.conversationLabel?.text = target.title
    //
    //        return cell
    //    }
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        background.setGradient(color1: .primary ?? .white, color2: .subPrimary ?? .black)
        
        let customLayout = CustomFlowLayout()
        collectionView.collectionViewLayout = customLayout
        collectionView.dataSource = self
        //        setupCollectionView()
                registerXib()
        collectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
        collectionView.decelerationRate = .fast
    }
    
    //    func setupCollectionView() {
    //        collectionView.contentInsetAdjustmentBehavior = .never
    //        let cellWidth: CGFloat = floor(cellSize.width)
    //        let insetX = (view.bounds.width - cellWidth) / 2.0
    //
    //        collectionView.contentInset = UIEdgeInsets(top: 0, left: insetX, bottom: 0, right: insetX)
    //        collectionView.decelerationRate = .fast
    //        collectionView.delegate = self
    //        collectionView.dataSource = self
    //    }
    //
        private func registerXib() {
            let nibName = UINib(nibName: cellName, bundle: nil)
            collectionView.register(nibName, forCellWithReuseIdentifier: cellReuseIdentifier)
        }
    
}

extension ConversationTabViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.conversationList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as?
                ConversationTabViewCell else {
                    return UICollectionViewCell()
                }
        let target = conversationList[indexPath.row]

        cell.conversationLabel?.text = target.title

        return cell
    }
}

class CustomFlowLayout: UICollectionViewFlowLayout {
    
    private var isInit: Bool = false
    
    override func prepare() {
        super.prepare()
        guard !isInit else { return }
        
        guard let collectionView = self.collectionView else { return }
        
        let collectionViewSize = collectionView.bounds
        itemSize = CGSize(width: 200, height: 320)
        
        let xInset = (collectionViewSize.width-itemSize.width) / 2
        self.sectionInset = UIEdgeInsets(top: 0, left: xInset, bottom: 0, right: xInset)
        
        scrollDirection = .horizontal
        
        minimumLineSpacing = 10
        
        isInit = true
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let superAttributes = super.layoutAttributesForElements(in: rect)
        
        superAttributes?.forEach { attributes in
            guard let collectionView = self.collectionView else { return }
            
            let collectionViewCenter = collectionView.frame.size.width / 2
            let offsetX = collectionView.contentOffset.x
            let center = attributes.center.x - offsetX
            
            let maxDis = self.itemSize.width + self.minimumLineSpacing
            let dis = min(abs(collectionViewCenter-center), maxDis)
            
            let ratio = (maxDis - dis)/maxDis
            let scale = ratio * (1-0.7) + 0.7
            
            attributes.transform = CGAffineTransform(scaleX: scale, y: scale)
        }
        
        return superAttributes
    }
    
}

//extension ConversationTabViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return minItemSpacing
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return cellSize
//    }
//
//    // MARK: Paging Effect
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        let cellWidthIncludeSpacing = cellSize.width + minItemSpacing
//
//        var offset = targetContentOffset.pointee
//        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludeSpacing
//        let roundedIndex: CGFloat = round(index)
//
//        offset = CGPoint(x: roundedIndex * cellWidthIncludeSpacing - scrollView.contentInset.left, y: scrollView.contentInset.top)
//        targetContentOffset.pointee = offset
//    }
//
//    // MARK: Carousel Effect
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//
//        let cellWidthIncludeSpacing = cellSize.width + minItemSpacing
//        let offsetX = collectionView.contentOffset.x
//        let index = (offsetX + collectionView.contentInset.left) / cellWidthIncludeSpacing
//        let roundedIndex = round(index)
//        let indexPath = IndexPath(item: Int(roundedIndex), section: 0)
//        if let cell = collectionView.cellForItem(at: indexPath) {
//            animateZoomforCell(zoomCell: cell)
//        }
//
//        if Int(roundedIndex) != previousIndex {
//            let preIndexPath = IndexPath(item: previousIndex, section: 0)
//            if let preCell = collectionView.cellForItem(at: preIndexPath) {
//                animateZoomforCellremove(zoomCell: preCell)
//            }
//            previousIndex = indexPath.item
//        }
//    }
//
//    func animateZoomforCell(zoomCell: UICollectionViewCell) {
//        UIView.animate(
//            withDuration: 0.2,
//            delay: 0,
//            options: .curveEaseOut,
//            animations: {
//                zoomCell.transform = .identity
//            },
//            completion: nil)
//    }
//
//    func animateZoomforCellremove(zoomCell: UICollectionViewCell) {
//        UIView.animate(
//            withDuration: 0.2,
//            delay: 0,
//            options: .curveEaseOut,
//            animations: {
//                zoomCell.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
//            },
//            completion: nil)
//
//    }
//}
