//
//  ViewController.swift
//  CustomTableView
//
//  Created by Maha Elrays on 11/08/2021.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    var arrFruit = [FruitDetails]()
    var arrFavouriteBtn = [Int]()
    

    @IBOutlet weak var tableFruit: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        arrFruit.append(FruitDetails.init(name: "Banana", price:17.90, description: "is very good and color yello", img: UIImage(named: "img_banana")!))
        
        arrFruit.append(FruitDetails.init(name: "Apple", price:17.90, description: "is very good and color red", img: UIImage(named: "img_apple")!))
        
        arrFruit.append(FruitDetails.init(name: "Watermelon", price:17.90, description: "is very good and outside color green and inside color red", img: UIImage(named: "img_watermelon")!))
        
        
        arrFruit.append(FruitDetails.init(name: "Banana", price:17.90, description: "is very good and color yello", img: UIImage(named: "img_banana")!))
        
        arrFruit.append(FruitDetails.init(name: "Apple", price:17.90, description: "is very good and color red", img: UIImage(named: "img_apple")!))
        
        arrFruit.append(FruitDetails.init(name: "Watermelon", price:17.90, description: "is very good and outside color green and inside color red", img: UIImage(named: "img_watermelon")!))
        
        
        arrFruit.append(FruitDetails.init(name: "Banana", price:17.90, description: "is very good and color yello", img: UIImage(named: "img_banana")!))
        
        arrFruit.append(FruitDetails.init(name: "Apple", price:17.90, description: "is very good and color red", img: UIImage(named: "img_apple")!))
        
        arrFruit.append(FruitDetails.init(name: "Watermelon", price:17.90, description: "is very good and outside color green and inside color red", img: UIImage(named: "img_watermelon")!))
        
        
        arrFruit.append(FruitDetails.init(name: "Banana", price:17.90, description: "is very good and color yello", img: UIImage(named: "img_banana")!))
        
        arrFruit.append(FruitDetails.init(name: "Apple", price:17.90, description: "is very good and color red", img: UIImage(named: "img_apple")!))
        
        arrFruit.append(FruitDetails.init(name: "Watermelon", price:17.90, description: "is very good and outside color green and inside color red", img: UIImage(named: "img_watermelon")!))
        
        
        tableFruit.delegate = self
        tableFruit.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrFruit.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let fruitCell = tableView.dequeueReusableCell(withIdentifier: "describeFruitCell")as! HomeViewController
        let dataFruit = arrFruit[indexPath.row]
        fruitCell.setupCell(photo: dataFruit.img, name: dataFruit.name, price: dataFruit.price, description: dataFruit.description)
        fruitCell.btnFavourite.tag = indexPath.row
        fruitCell.btnFavourite.addTarget(self, action: #selector(addFavourite(sender:)), for: .touchUpInside)
        return fruitCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("click the number of row \(indexPath.row)")
    }
    @objc
    func addFavourite(sender:UIButton)  {
        print("button\(sender.tag)")
        let buttonClick = sender.tag
        var flagAddFavourit = true
        if arrFavouriteBtn.isEmpty {
            arrFavouriteBtn.append(buttonClick)
            sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            print(arrFavouriteBtn)
        }else{
            for item in arrFavouriteBtn {
                if item == buttonClick {
                    sender.setImage(UIImage(systemName: "heart"), for: .normal)
                    let disFavourit = arrFavouriteBtn.firstIndex(of: item)!
                    arrFavouriteBtn.remove(at: disFavourit)
                    flagAddFavourit = false
                    print(arrFavouriteBtn)
                }
            }
            if flagAddFavourit == true {
                arrFavouriteBtn.append(buttonClick)
                sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                print(arrFavouriteBtn)
            }
            
        }
    }


}
struct FruitDetails {
    let name:String
    let price:Double
    let description:String
    let img:UIImage
    
    
    
}

