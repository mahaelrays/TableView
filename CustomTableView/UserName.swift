//
//  UserName.swift
//  CustomTableView
//
//  Created by Maha Elrays on 16/08/2021.
//

import UIKit

class UserName: UIViewController , UITableViewDelegate ,UITableViewDataSource {
    var userNameArr = [String]()
    var userNameFavouriteArr = [String]()
    var flageFavourite = false
    
    
    

    @IBAction func editBtn(_ sender: Any) {
        tableUser.isEditing = !tableUser.isEditing
    }
    @IBOutlet weak var userNameTxt: UITextField!
    @IBAction func addBtn(_ sender: Any) {
        if let text = userNameTxt.text {
            userNameArr.append(text)
            let indexPath = IndexPath(row: userNameArr.count - 1 , section: 0)
            tableUser.beginUpdates()
            tableUser.insertRows(at: [indexPath], with: .automatic)
            tableUser.endUpdates()
            userNameTxt.text = ""
            
            
        }
    }
    @IBOutlet weak var tableUser: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableUser.delegate = self
        tableUser.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userNameArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userName", for: indexPath )
        cell.textLabel?.text=userNameArr[indexPath.row]
        return cell
        
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        userNameArr.swapAt(sourceIndexPath.row , destinationIndexPath.row )
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "delete") { (action, view, complationHandler) in
           
            for itemFav in self.userNameFavouriteArr{
                if itemFav == self.userNameArr[indexPath.row] {
                    let remFav = self.userNameFavouriteArr.firstIndex(of: itemFav)!
                    self.userNameFavouriteArr.remove(at: remFav)
                    print(self.userNameFavouriteArr)
                }
            }
            self.userNameArr.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            complationHandler(true)
        }
        
        
        
        let favouriteAction = UIContextualAction(style: .normal, title: "favourite") { action, view, complationHandler in
//            print("user favourite")
            if(self.userNameFavouriteArr.isEmpty ){
                self.userNameFavouriteArr.append(self.userNameArr[indexPath.row])}
            else{
                    for item in self.userNameFavouriteArr {
                        if item == self.userNameArr[indexPath.row]  {
                            self.flageFavourite = true
                            let indexItem = self.userNameFavouriteArr.firstIndex(of: item)
                            self.userNameFavouriteArr.remove(at: indexItem!)
                            break;
                        }
                        
                    }
                    if self.flageFavourite == false {
                        
                            self.userNameFavouriteArr.append(self.userNameArr[indexPath.row])
                            print(self.userNameFavouriteArr)
                            
                           
                        
                        

                    }
                    
                }
            
            self.flageFavourite = false
            complationHandler(true)
//            print(self.userNameFavouriteArr)
            
        }
        deleteAction.image = UIImage(systemName: "trash")
        favouriteAction.image = UIImage(systemName: "heart")
        
        return UISwipeActionsConfiguration(actions: [deleteAction,favouriteAction])
        
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
