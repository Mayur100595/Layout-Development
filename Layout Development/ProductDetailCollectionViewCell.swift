//
//  ProductDetailCollectionViewCell.swift
//  LayoutDevelopment
//
//  Created by Mayur Patel on 23/12/18.
//  Copyright © 2018 Mayur Patel. All rights reserved.
//

import UIKit

class ProductDetailCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var btn_Add:UIButton?
    @IBOutlet weak var btn_Add1:UIButton?
    @IBOutlet weak var btn_Add2:UIButton?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let  marrbtn = [btn_Add2,btn_Add1,btn_Add]
        
        for btn in marrbtn {
            
            btn?.layer.cornerRadius = 15.0
            btn?.clipsToBounds = true
            btn?.backgroundColor = .red
            btn?.setTitleColor(.white, for: .normal)
        }
        
    }

}
