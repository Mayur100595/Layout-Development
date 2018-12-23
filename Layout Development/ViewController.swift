//
//  ViewController.swift
//  LayoutDevelopment
//
//  Created by Mayur Patel on 20/12/18.
//  Copyright © 2018 Mayur Patel. All rights reserved.
//

import UIKit

let cellcollectionviewIdentifier = "FASHIONCollectionViewCell"

class ViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    var marrFashion:NSMutableArray = []
    
    @IBOutlet weak var view_statusBar:UIView?
    @IBOutlet weak var clv_Function:UICollectionView?
    @IBOutlet weak var const_StatusBarHeight:NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let statusbarHeight = UIApplication.shared.statusBarFrame.size.height
        const_StatusBarHeight?.constant = statusbarHeight
        
        self.LayoutDataSetupMethod()
        
        clv_Function?.register(UINib.init(nibName: "FASHIONCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellcollectionviewIdentifier)
    }
    
    //MARK: - Layout Data Setup Method
    
    func LayoutDataSetupMethod() {
        
        var mdictMakeup:[String:Any] = [:]
        mdictMakeup["name"] = "Makeup"
        mdictMakeup["image"] = "makeup"
        
        var mdictSkincare:[String:Any] = [:]
        mdictSkincare["name"] = "Skincare"
        mdictSkincare["image"] = "skincare"
        
        var mdictHaircare:[String:Any] = [:]
        mdictHaircare["name"] = "Haircare"
        mdictHaircare["image"] = "haircare"
        
        var mdictBeautyTool:[String:Any] = [:]
        mdictBeautyTool["name"] = "BeautyTools"
        mdictBeautyTool["image"] = "beauty"
        
        var mdictHome:[String:Any] = [:]
        mdictHome["name"] = "Home Fragrances"
        mdictHome["image"] = "home"
        
        var mdictGift:[String:Any] = [:]
        mdictGift["name"] = "Gift"
        mdictGift["image"] = "gift"
        
        var mdictMen:[String:Any] = [:]
        mdictMen["name"] = "Men"
        mdictMen["image"] = "men"
        
        marrFashion = NSMutableArray.init()
        marrFashion.add(mdictMakeup)
        marrFashion.add(mdictSkincare)
        marrFashion.add(mdictHaircare)
        marrFashion.add(mdictBeautyTool)
        marrFashion.add(mdictHome)
        marrFashion.add(mdictGift)
        marrFashion.add(mdictMen)
        
    }
    
    //MARK: - UIcollectionView Delegate method
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return  1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
            return marrFashion.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = clv_Function?.dequeueReusableCell(withReuseIdentifier: cellcollectionviewIdentifier, for: indexPath) as! FASHIONCollectionViewCell
        
        var mdictTemp:[String:Any] = [:]
        mdictTemp = marrFashion[indexPath.item] as! Dictionary<String,Any>
        
        cell.img_Main?.image = UIImage.init(named: mdictTemp["image"] as! String)
        cell.lbl_Main?.text = mdictTemp["name"] as? String
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            return CGSize(width: 80, height: 80)
    }
}

