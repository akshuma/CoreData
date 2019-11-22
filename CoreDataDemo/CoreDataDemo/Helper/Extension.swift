//
//  Extension.swift
//  CoreDataDemo
//
//  Created by Akshuma Trivedi on 21/11/19.
//  Copyright © 2019 Akshu. All rights reserved.
//

import UIKit

extension String {
    static var blank: String {
        return ""
    }
}
extension Collection {
    
    /// Returns the element at the specified index iff it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
