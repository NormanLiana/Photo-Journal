//
//  PhotoEntryVC.swift
//  PhotoJournal-Project
//
//  Created by Liana Norman on 10/4/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit

class PhotoEntryVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: Actions
    
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
