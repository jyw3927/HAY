//
//  ViewController.swift
//  HAY
//
//  Created by 전영우 on 2022/06/19.
//

import UIKit

class GameTabViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let gameList = Game.data
    let cellReuseIdentifier = "GameCell"
    let cellSpacingHeight: CGFloat = 1
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return gameList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! GameTabViewCell
        let target = gameList[indexPath.section]
        
        let img = UIImage(named: "\(target.image).png")
        cell.gameImage?.image = img
        cell.gameLabel?.text = target.title
        cell.backgroundColor = UIColor.clear.withAlphaComponent(0)
        
        return cell
    }

    @IBOutlet weak var background: UIView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        background.setGradient(color1: .primary ?? .white, color2: .subPrimary ?? .black)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.clear.withAlphaComponent(0)
    }

}

class GameTabViewCell: UITableViewCell {

    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var gameLabel: UILabel!
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
}
