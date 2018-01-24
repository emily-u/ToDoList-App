//
//  CustomCell.swift
//  TodoList App
//
//  Created by Emily on 1/24/18.
//  Copyright © 2018 Emily. All rights reserved.
//

// we have to use UIKit to have access to UITableViewCell

import UIKit
class CustomCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var detail: UILabel!
    
}

