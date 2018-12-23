//
//  ProductTableViewCell.swift
//  LayoutDevelopment
//
//  Created by Mayur on 22/12/18.
//  Copyright © 2018 Mayur Patel. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var lbl_Name:UILabel?
    @IBOutlet weak var view_ProductName:UIView?
    @IBOutlet weak var view_ProductDetail:UIView?
    @IBOutlet weak var img_dropdown:UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
