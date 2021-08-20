////
////  ContactsUser.swift
////  CustomTableView
////
////  Created by Maha Elrays on 19/08/2021.
////
//
import UIKit
//
class ContactsUser: UIViewController ,UITableViewDelegate , UITableViewDataSource {
    
    

    let sectionArr = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    var allNameArr = ["maha","ahmed","sagid","mai","nehal","Manar","Sara","omer","ramy"]
    var distributionNameDic = [String:[String]]()
    func distrubitionName(names : [String])  {
//        let names = ["maha","ahmed","sagid","mai","nehal","Manar","Sara","omer","ramy"]
        
        for item in names {
            let input = item.first
            switch input {
            case "A","a":
                self.distributionNameDic["A",default: []].append(item)
            case "B","b":
                self.distributionNameDic["B",default: []].append(item)
            case "C","c":
                self.distributionNameDic["C",default: []].append(item)
            case "D","d":
                self.distributionNameDic["D",default: []].append(item)
            case "E","e":
                self.distributionNameDic["E",default: []].append(item)
            case "F","f":
                self.distributionNameDic["F",default: []].append(item)
            case "G","g":
                self.distributionNameDic["G",default: []].append(item)
            case "H","h":
                self.distributionNameDic["H",default: []].append(item)
            case "I","i":
                self.distributionNameDic["I",default: []].append(item)
            case "J","j":
                self.distributionNameDic["J",default: []].append(item)
            case "K","k":
                self.distributionNameDic["K",default: []].append(item)
            case "L","l":
                self.distributionNameDic["L",default: []].append(item)
            case "M","m":
                self.distributionNameDic["M" ,default: []].append(item)
            case "N","n":
                self.distributionNameDic["N",default: []].append(item)
            case "O","o":
                self.distributionNameDic["O",default: []].append(item)
            case "P","p":
                self.distributionNameDic["P",default: []].append(item)
            case "Q","q":
                self.distributionNameDic["Q",default: []].append(item)
            case "R","r":
                self.distributionNameDic["R",default: []].append(item)
            case "S","s":
                self.distributionNameDic["S",default: []].append(item)
            case "T","t":
                self.distributionNameDic["T",default: []].append(item)
            case "U","u":
                self.distributionNameDic["U",default: []].append(item)
            case "V","v":
                self.distributionNameDic["V",default: []].append(item)
            case "W","w":
                self.distributionNameDic["W",default: []].append(item)
            case "X","x":
                self.distributionNameDic["X",default: []].append(item)
            case "Y","y":
                self.distributionNameDic["Y",default: []].append(item)
            case "Z","z":
                self.distributionNameDic["Z",default: []].append(item)

            default:
                print(self.distributionNameDic)
            }
        }

    }



    @IBOutlet weak var contactUser: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        distrubitionName(names: allNameArr)
        dump(distributionNameDic)
     
        contactUser.delegate = self
        contactUser.dataSource = self

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sectionsName", for: indexPath)
        return cell
    }}
