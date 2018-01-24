//
//  mainTableViewController.swift
//  TodoList App
//
//  Created by Emily on 1/23/18.
//  Copyright © 2018 Emily. All rights reserved.
//

import UIKit
import CoreData


class mainTableViewController: UITableViewController, AddViewControllerDelegate {
    
    

    var items = [ToDoList]()
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllItems()
        self.tableView.rowHeight = 100
        tableView.reloadData()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        if items.count != 0{
            cell.title?.text = items[indexPath.row].list
            let formatter = DateFormatter()
            formatter.dateFormat = "MM/dd/yyyy"
            let myDate = items[indexPath.row].date
            cell.date.text = formatter.string(from: myDate!)
            cell.detail.text = items[indexPath.row].detail
            if items[indexPath.row].mark == true{
                cell.accessoryType = .checkmark
        }
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let addItemViewController = segue.destination as! addItemViewController
        addItemViewController.delegate = self
    }
    
    func addItem(_ controller: addItemViewController, with list: String, _ detail: String, and date: Date) {
        let item = NSEntityDescription.insertNewObject(forEntityName: "ToDoList", into: managedObjectContext) as! ToDoList
//        print(title,content,date)
        item.list = list
        item.detail = detail
        item.date = date
        item.mark = false
        items.append(item)
        do{
            try managedObjectContext.save()
        }
        catch{
            print("\(error)")
        }
        dismiss(animated: true, completion: nil)
        
        tableView.reloadData()
    }


    func fetchAllItems(){
        let itemRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ToDoList")
        
        do {
            let results = try managedObjectContext.fetch(itemRequest)
            items = results as! [ToDoList]
        }catch {
            // print the error if it is caught (Swift automatically saves the error in "error")
            print("\(error)")
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let item = items[indexPath.row]
        item.mark = true
        do{
            try managedObjectContext.save()
        }
        catch{
            print("\(error)")
        }
        tableView.reloadData()
    }
}


