//
//  AddTaskViewController.swift
//  fireBaseToDo App
//
//  Created by Bibek Shrestha on 2/19/19.
//  Copyright © 2019 Bibek Shrestha. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var userInputText: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let firstVC: HomeScreenViewController = segue.destination as! HomeScreenViewController
        
        if (userInputText.text != nil) {
            newTodoList = userInputText.text!
        } else {
            print("No input found")
        }
        
    }
    
    @IBAction func addTaskButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
