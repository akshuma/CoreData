//
//  CoreDataManager.swift
//  CoreDataDemo
//
//  Created by Akshuma Trivedi on 21/11/19.
//  Copyright © 2019 Akshu. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    init() {  }
    
    
   func saveData<T>(userData : [T]){
        if let userData = userData as? [UserInfoElement] {
            guard  let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return}
            let manageContext = appDelegate.persistentContainer.viewContext
            guard let userEntities = NSEntityDescription.entity(forEntityName:"UserEntitie", in: manageContext) else { return }
            for userinfo in userData {
                let user = NSManagedObject(entity: userEntities, insertInto: manageContext)
                user.setValue(userinfo.id, forKey: "id")
                user.setValue(userinfo.userID, forKey: "userId")
                user.setValue(userinfo.title, forKey: "title")
                user.setValue(userinfo.completed, forKey: "completed")
            }
            do {
                try manageContext.save()
            } catch _ as Error {
                print("could not save")
            }
        }
        
    }
    
    func deleteData() {
        guard  let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return}
               let manageContext = appDelegate.persistentContainer.viewContext
               let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserEntitie")
               do {
                   let result = try manageContext.fetch(fetchRequest)
                   for data in result as! [NSManagedObject] {
                       manageContext.delete(data)
                   }
               } catch  {
                   print("fetch")
               }
    }
    
    func retrieveData()  -> [UserEntitie] {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let manageContext = appDelegate.persistentContainer.viewContext
            let request : NSFetchRequest<UserEntitie> = UserEntitie.fetchRequest()
            do {
               let  userInfodata = try manageContext.fetch(request)
               return userInfodata
            } catch  {
                print("error loading data- \(error)")
            }
        }
           return [UserEntitie]()
       }
    

}
