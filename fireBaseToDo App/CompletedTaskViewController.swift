//
//  CompletedTaskViewController.swift
//  fireBaseToDo App
//
//  Created by Bibek Shrestha on 2/19/19.
//  Copyright © 2019 Bibek Shrestha. All rights reserved.
//

import UIKit

class CompletedTaskViewController: UIViewController {

    @IBAction func dismissButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
