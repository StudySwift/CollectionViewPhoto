//
//  DetailViewController.swift
//  CollectionViewPhoto
//
//  Created by Yurik Nosachenko on 13.02.2021.

import UIKit

class DetailViewController: UIViewController {
    var imageFromMain: UIImage?
    var playerFromMain: Player?
    
    @IBOutlet weak var nameSurnameLB: UILabel!
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var positionLB: UILabel!
    @IBOutlet weak var clubLB: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let getPlayer = playerFromMain{
            nameSurnameLB.text = getPlayer.name + " " + getPlayer.surName
            positionLB.text = getPlayer.position
            clubLB.text = getPlayer.club
            imageDetail.image = UIImage(named: getPlayer.photo)
        }
    }
    
    
}
