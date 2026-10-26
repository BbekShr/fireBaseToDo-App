//
//  HomeScreenViewController.swift
//  fireBaseToDo App
//
//  Created by Bibek Shrestha on 2/19/19.
//  Copyright © 2019 Bibek Shrestha. All rights reserved.

import UIKit
import Firebase
import FirebaseAuth
import FirebaseUI

var newTodoList: String = ""
var todoListArray: [String] = []

var newCompletedList: String = ""
var completedArray: [String] = []

var tempArray:[String] = []

//var savedData:Bool =

    class HomeScreenViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
        
        var ref : DatabaseReference?
        
        @IBAction func addTaskButton(_ sender: Any) {
            performSegue(withIdentifier: "addTaskSegue", sender: self)
        }
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return todoListArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
            cell.textLabel?.text = todoListArray[indexPath.row]
            return cell
        }
        
        //Complete Function
        func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let contextItem = UIContextualAction(style: .normal, title: "Complete") { (contextualAction, view, boolValue) in
                print("Tap completed button")
                
                completedArray.insert(todoListArray[indexPath.row], at: 0)
                self.ref?.child(userEmail).child("data").child("CompletedList").setValue(completedArray)
                
                todoListArray.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                self.ref?.child(userEmail).child("data").child("ToDoList").setValue(todoListArray)
                
                self.reloadInputViews()
                print(completedArray)
                //print(VC.markedCompletedTextList)
            }
            
            contextItem.backgroundColor = .green
            let swipeActions = UISwipeActionsConfiguration(actions: [contextItem])
            return swipeActions
        }
        
        //Delete function
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                print("Deleted")
                
                todoListArray.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
                
                ref?.setValue(todoListArray)
            }
        }
        
        @IBOutlet weak var tableView: UITableView!
        
        @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue){
            print("Going back")
            
            if (newTodoList.isEmpty) {
                print("No input found " )
            } else {
                todoListArray.insert(newTodoList, at: 0)
                self.ref?.child(userEmail).child("data").child("ToDoList").setValue(todoListArray)
            }
            self.tableView.reloadData()
        }
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            if Auth.auth().currentUser != nil {
                print("Login Sucessful")
            }
            
            self.tableView.reloadData()
            ref = Database.database().reference()
            retriveData("ToDoList")
            retriveData("CompletedList")
            
           
        }
        

        func retriveData(_ list: String){
            ref = Database.database().reference()
            
            ref?.child(userEmail).child("data").child(list).observeSingleEvent(of: .value) { (snapshot: DataSnapshot) in
                for item in snapshot.children {
                    let snap = item as? DataSnapshot
                    let data = snap?.value as! String
                    
                    if list == "CompletedList" {
                        completedArray.insert(data, at: 0)
                    }else{
                        todoListArray.insert(data, at: 0)
                        print(todoListArray)
                    }
                }
                self.tableView.reloadData()
            }
        }
}

