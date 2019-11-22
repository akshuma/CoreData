//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Akshu on 20/11/19.
//  Copyright © 2019 Akshu. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    var userData = [UserInfoElement]()
    var manageObjectContext: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.parseData()
        manageObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
    }

    func parseData() {
       let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
            let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                guard let data = data else { return }
                guard let userString = String(data: data, encoding: .utf8)  else {return}
                let jsonData = userString.data(using: .utf8)!
                let user = try! JSONDecoder().decode([UserInfoElement].self, from: jsonData)
                self.userData = user
                self.reloadTblView()
                
            }
            task.resume()
        }
    func reloadTblView()  {
        DispatchQueue.main.async {
            CoreDataManager.shared.deleteData()
            self.tblView.reloadData()
            CoreDataManager.shared.saveData(userData : self.userData)
        }
    }
   

}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : DisplayTableViewCell = tableView.dequeueReusableCell(withIdentifier: "DisplayTableViewCell") as! DisplayTableViewCell
         cell.setUpCell(userElement: self.userData[indexPath.row])

              return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let newsDetailVc = Utils.getVCWith(identifier: "DisplayViewController") as! DisplayViewController
        self.navigationController?.pushViewController(newsDetailVc, animated: true)
    }
    
}
