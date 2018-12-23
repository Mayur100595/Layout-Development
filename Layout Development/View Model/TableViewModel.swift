//
//  TableViewModel.swift
//  LayoutDevelopment
//
//  Created by Mayur on 22/12/18.
//  Copyright © 2018 Mayur Patel. All rights reserved.
//

import UIKit

class TableViewModel: NSObject {
    
    //MARK: - Bottom Shadow Method
    
    func bottomshadow(to ShadowView: UIView?, borderColor BorderColor: UIColor?, bottomShadowColor BottomShadowColor: UIColor?) {
        ShadowView?.layer.borderWidth = 0.5
        ShadowView?.layer.borderColor = BorderColor?.cgColor
        ShadowView?.layer.shadowColor = BottomShadowColor?.cgColor
        ShadowView?.layer.shadowOffset = CGSize(width: 1, height: 1)
        ShadowView?.layer.shadowOpacity = 0.8
        ShadowView?.layer.shadowRadius = 1.0
        ShadowView?.layer.masksToBounds = false
    }
}
