//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Chris Abbod on 12/24/18.
//  Copyright © 2018 Chris Abbod. All rights reserved.
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

    //MARK: - TableView Datasource Methods

    //Setup number of items in tableview
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Create a reusable cell and add it to the table at the end of the indexPath
        //CategoryCell is the identifier given to the prototype cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = categories[indexPath.row].name
        
        return cell
    }
    
    //MARK: - TableView Delegate Methods

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    //Load the items for the corresponding tableView
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //make destinationVC equal to the new View Controller we segue to by downcasting it as the TodoListViewController
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories[indexPath.row]
        }
    }
    //MARK: - Data Manipulation Methods
    func saveCategory(){
        
        do{
            try context.save()
        }catch{
            print("Error saving category \(error)")
        }
        
        self.tableView.reloadData()
    }
    
    func loadCategories(with request: NSFetchRequest<Category> = Category.fetchRequest()){
        
        do{
            categories = try context.fetch(request)
        }catch{
            print("Error loading categories \(error)")
        }
        
        tableView.reloadData()
    }
    
    //MARK: - Add New Categories
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            //What will happen once the user clicks on the add category button
            
            //Create the context (staging area) where we make changes before saving them
            let newCategory = Category(context: self.context)
            
            newCategory.name = textField.text!
            self.categories.append(newCategory)
            
            self.saveCategory()
        }
        
        alert.addAction(action)

        alert.addTextField { (field) in
            textField = field
            field.placeholder = "Add a new category"
        }
        
        present(alert, animated: true, completion: nil)
    }
    
}
