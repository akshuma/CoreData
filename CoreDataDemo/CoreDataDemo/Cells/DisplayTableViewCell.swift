//
//  DisplayTableViewCell.swift
//  CoreDataDemo
//
//  Created by Akshu on 20/11/19.
//  Copyright © 2019 Akshu. All rights reserved.
//

import UIKit

class DisplayTableViewCell: UITableViewCell {

    @IBOutlet weak var lbltitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUpCell<T>(userElement: T)  {
        if let datamodel = userElement as? UserInfoElement {
            self.lbltitle.text = datamodel.title ?? String.blank
        } else if let datamodel = userElement as? UserEntitie {
            self.lbltitle.text = datamodel.title ?? String.blank
        } else {}
        
    }

}
