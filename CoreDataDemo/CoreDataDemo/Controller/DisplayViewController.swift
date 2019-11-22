//
//  DisplayViewController.swift
//  CoreDataDemo
//
//  Created by Akshu on 20/11/19.
//  Copyright © 2019 Akshu. All rights reserved.
//

import UIKit
import CoreData

class DisplayViewController: UIViewController {
    var userInfodata = [UserEntitie]()
    @IBOutlet weak var displayTblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.reloadTblView()
        

        // Do any additional setup after loading the view.
    }
    func reloadTblView()  {
        DispatchQueue.main.async {
            self.userInfodata = CoreDataManager.shared.retrieveData()
            print(self.userInfodata.count)
            self.displayTblView.reloadData()
           
        }
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
extension DisplayViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userInfodata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : DisplayTableViewCell = tableView.dequeueReusableCell(withIdentifier: "DisplayTableViewCell") as! DisplayTableViewCell
        cell.setUpCell(userElement: userInfodata[safe:indexPath.row])
   
        return cell
    }
    
    
}
