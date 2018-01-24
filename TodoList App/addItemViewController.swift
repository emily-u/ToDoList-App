//
//  addItemViewController.swift
//  TodoList App
//
//  Created by Emily on 1/23/18.
//  Copyright © 2018 Emily. All rights reserved.
//

import UIKit

class addItemViewController: UIViewController {
    @IBOutlet weak var toDoList: UITextField!
    @IBOutlet weak var toDoDetail: UITextView!
    @IBOutlet weak var toDoDate: UIDatePicker!
    
    
    
    var delegate: AddViewControllerDelegate?

    @IBAction func addItemButton(_ sender: UIButton) {
        delegate?.addItem(self, with: toDoList.text!, toDoDetail.text!, and: toDoDate.date)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

protocol AddViewControllerDelegate: class {
    func addItem(_ controller: addItemViewController, with list:String, _ detail:String, and date:Date)
}


