//
//  Utils.swift
//  CoreDataDemo
//
//  Created by Akshu on 20/11/19.
//  Copyright © 2019 Akshu. All rights reserved.
//

import UIKit
import Foundation


class Utils: NSObject {
    class func convertStringToGenericOutput<T>(text: String, type: T.Type) -> T? {
        
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? T
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    public static func getVCWith(identifier: String) -> UIViewController {
          let storyboard = UIStoryboard(name: "Main", bundle: nil)
          let viewController = storyboard.instantiateViewController(withIdentifier: identifier)
          return viewController
      }

}
