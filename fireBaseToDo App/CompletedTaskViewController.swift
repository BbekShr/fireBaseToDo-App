//
//  CompletedTaskViewController.swift
//  fireBaseToDo App
//
//  Created by Bibek Shrestha on 2/19/19.
//  Copyright © 2019 Bibek Shrestha. All rights reserved.
//

import UIKit

class CompletedTaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    @IBAction func dismissButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var completeTableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return completedArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = completeTableView.dequeueReusableCell(withIdentifier: "completeCell", for: indexPath) as UITableViewCell
        print(completedArray)
        cell.textLabel?.text = completedArray[indexPath.row]
        //        UserDefaults.standard.set(markedCompletedTextList, forKey: "completed")
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // print(markedCompletedTextList)
    }

}
