//
//  SectionReusableView.swift
//  CollectionViewPhoto
//
//  Created by Yurik Nosachenko on 14.02.2021.
//

import UIKit

class SectionReusableView: UICollectionReusableView {
        
    @IBOutlet weak var titleLB: UILabel!
    
    var title: String?{
        didSet{
            titleLB.text = title
        }
    }
}
