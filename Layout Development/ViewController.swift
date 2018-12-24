//
//  ViewController.swift
//  LayoutDevelopment
//
//  Created by Mayur Patel on 20/12/18.
//  Copyright © 2018 Mayur Patel. All rights reserved.
//

import UIKit

let cellcollectionviewIdentifier = "FASHIONCollectionViewCell"
let cellTableViewIdentifierProduct = "ProductTableViewCell"
let cellProductDetailcell = "ProductDetailCollectionViewCell"
class ViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    var marrFashion:NSMutableArray = []
    var intSelectedCell:Int?
    
    @IBOutlet weak var view_statusBar:UIView?
    @IBOutlet weak var clv_Function:UICollectionView?
    @IBOutlet weak var clv_Brand:UICollectionView?
    @IBOutlet weak var tbl_BrandCategory:UITableView?
    @IBOutlet weak var const_StatusBarHeight:NSLayoutConstraint?
    @IBOutlet weak var btn_Add:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let statusbarHeight = UIApplication.shared.statusBarFrame.size.height
        const_StatusBarHeight?.constant = statusbarHeight
        
        intSelectedCell = 0
        
        self.LayoutDataSetupMethod()
        
        clv_Function?.register(UINib.init(nibName: "FASHIONCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellcollectionviewIdentifier)
        tbl_BrandCategory?.register(UINib.init(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: cellTableViewIdentifierProduct)
        clv_Brand?.register(UINib.init(nibName: "ProductDetailCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellProductDetailcell)
        
        btn_Add?.layer.cornerRadius = 25.0
        btn_Add?.clipsToBounds = true
        btn_Add?.backgroundColor = UIColor.blue
        
        let FooterView = UIView.init(frame: CGRect(x:0,y:0,width:(self.tbl_BrandCategory?.frame.size.width)!,height:50))
        FooterView.backgroundColor = UIColor.clear
        self.tbl_BrandCategory?.tableFooterView = FooterView
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
        
        if collectionView == clv_Function {
            return marrFashion.count
        } else{
            
            return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == clv_Function {
            let cell = clv_Function?.dequeueReusableCell(withReuseIdentifier: cellcollectionviewIdentifier, for: indexPath) as! FASHIONCollectionViewCell
            
            var mdictTemp:[String:Any] = [:]
            mdictTemp = marrFashion[indexPath.item] as! Dictionary<String,Any>
            
            cell.img_Main?.image = UIImage.init(named: mdictTemp["image"] as! String)
            cell.lbl_Main?.text = mdictTemp["name"] as? String
            
            return cell
        } else{
            
            let cell = clv_Brand?.dequeueReusableCell(withReuseIdentifier: cellProductDetailcell, for: indexPath) as! ProductDetailCollectionViewCell
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == clv_Function{
            
            return CGSize(width: 80, height: 80)
        }
        else{
            clv_Brand?.layoutIfNeeded()
            return CGSize(width: (clv_Brand?.frame.size.width)!, height:  (clv_Brand?.frame.size.height)!)
        }
    }
}

extension ViewController:UITableViewDataSource, UITableViewDelegate{
    
    //MARK: - UITableview Delegate and Datasource method
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellTableViewIdentifierProduct) as! ProductTableViewCell
        
        if intSelectedCell == indexPath.row{
            
            cell.view_ProductDetail?.isHidden = false;
            cell.img_dropdown?.image = UIImage.init(named: "down")
        } else{
            
            cell.view_ProductDetail?.isHidden = true;
            cell.img_dropdown?.image = UIImage.init(named: "up")
        }
        
        if indexPath.row == 0{
            
            cell.lbl_Name?.text = "Lips";
        } else if indexPath.row == 1{
            cell.lbl_Name?.text = "Face";
        } else if indexPath.row == 2{
            cell.lbl_Name?.text = "Nails";
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        intSelectedCell = indexPath.row
        tbl_BrandCategory?.reloadData()
        tbl_BrandCategory?.scrollToRow(at: indexPath, at: .top, animated: true)
        //tbl_BrandCategory?.reloadRows(at: [indexPath], with: .fade)
    }
}

