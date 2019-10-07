//
//  SettingsVC.swift
//  PhotoJournal-Project
//
//  Created by Liana Norman on 10/4/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    // MARK: Enums
    enum DarkModeSettings {
        case on
        case off
    }
    
    enum ScrollOrientation: String {
        case horizontal = "horizontal"
        case vertical = "vertical"
    }
    
    // MARK: Outlets
    @IBOutlet weak var segController: UISegmentedControl!
    
    @IBOutlet weak var darkModeSwitch: UISwitch!
    
    // MARK: Properties
    weak var delegate: SettingsDelegate?
    var darkModeSwitchIsOn = false
    
    
    
    
    
    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}
