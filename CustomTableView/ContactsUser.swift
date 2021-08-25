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
    
    
    var allNameArr = ["maha","ahmed","sagid","mai","nehal","Manar","Sara","omer","ramy"]
    var allNameCharacterSort : [Character]=[]
    var distributionNameDic : Dictionary<Character, [String]> = [:]
    var groupsdistributionNameDic = [[String]]()
    
    @IBOutlet weak var contactUser: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        distributionNameDic = Dictionary(grouping: allNameArr ){Character ( ($0.first?.uppercased())! )}
        allNameCharacterSort = distributionNameDic.keys.sorted()
        for item in allNameCharacterSort {
            groupsdistributionNameDic.append(distributionNameDic[item]!)
        }
    
        contactUser.delegate = self
        contactUser.dataSource = self
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return distributionNameDic.keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return groupsdistributionNameDic[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sectionsName", for: indexPath)
        cell.textLabel?.text = groupsdistributionNameDic[indexPath.section][indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(allNameCharacterSort[section])
    }
}

