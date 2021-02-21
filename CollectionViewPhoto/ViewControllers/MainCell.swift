//
//  MainCell.swift
//  CollectionViewPhoto
//
//  Created by Yurik Nosachenko on 13.02.2021.
//

import UIKit

class MainCell: UICollectionViewCell {
    @IBOutlet weak var imageCellOT: UIImageView!

    func fillCell(player: Player){
            if player.newPhoto == nil{
                imageCellOT.image = UIImage(named: player.photo!)
            }else {
                imageCellOT.image = player.newPhoto
            }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageCellOT.image = nil
    }
    
}
