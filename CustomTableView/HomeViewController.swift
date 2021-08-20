//
//  HomeViewController.swift
//  CustomTableView
//
//  Created by Maha Elrays on 12/08/2021.
//

import UIKit

class HomeViewController: UITableViewCell {

    @IBOutlet weak var imgFruit: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbPrice: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var btnFavourite: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupCell(photo:UIImage,name:String,price:Double,description:String){
        imgFruit.image=photo
        lbName.text=name
        lbPrice.text=String(price)+" SEK"
        lbDescription.text=description
        
    }
}
