//
//  CategoryViewController.swift
//  Todoey
//
//  Created by msingh on 5/29/18.
//  Copyright © 2018 rockitman. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    var categories = [Category]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
        
    }
    
    
    
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Category",
                                      message: "",
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default){ (action) in
            let newCategory = Category(context: self.context)
            newCategory.name = textField.text!
            self.categories.append(newCategory)
            self.saveCategories()
            
        }
        alert.addAction(action)
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "Add a new category"
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        if let indexPath =  tableView.indexPathForSelectedRow{
            destinationVC.selectedCategory = categories[indexPath.row]
        }
    }
    
    
    //Mark: - TABLEVIEW DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    
    //Mark: - Table view datadelegate methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row].name
        return cell
    }
    
    //Mark: - saveCategories
    
    func saveCategories(){
        
        do{
           try context.save()
        }
        catch{
            print("error saving categories: \(error)")
        }
        tableView.reloadData()
        
    }
    
    //MARK: - loadCategories
    func loadCategories(){
        let request: NSFetchRequest<Category> = Category.fetchRequest()
        do{
        categories = try context.fetch(request)
        }
        catch{
            print("error loading categories: \(error)")
        }
        tableView.reloadData()
        
    }
    
}
