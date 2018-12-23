//
//  FASHIONCollectionViewCell.swift
//  LayoutDevelopment
//
//  Created by Mayur Patel on 20/12/18.
//  Copyright © 2018 Mayur Patel. All rights reserved.
//

import UIKit

class FASHIONCollectionViewCell: UICollectionViewCell {

    var product = TableViewModel()

    @IBOutlet weak var view_Main:UIView?
    @IBOutlet weak var img_Main:UIImageView?
    @IBOutlet weak var lbl_Main:UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        product.bottomshadow(to: view_Main, borderColor: .lightGray, bottomShadowColor: .lightGray)
    }

}
