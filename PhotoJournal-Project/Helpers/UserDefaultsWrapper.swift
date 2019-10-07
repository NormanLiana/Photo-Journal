//
//  UserDefaultsWrapper.swift
//  PhotoJournal-Project
//
//  Created by Liana Norman on 10/6/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation
import UIKit

class UserDefaultsWrapper {
    
    // MARK: Singleton
    static let shared = UserDefaultsWrapper()
    
    // MARK: Private Keys
    private let backgroundColorKey = "backgroundColor"
    private let scrollOrientationKey = "scrollOrientation"
    
    
    // MARK: Getters
    func getBackgroundColor() -> UIColor {
        return UserDefaults.standard.value(forKey: backgroundColorKey) as! UIColor
    }
    
    func getScrollOrientation() -> Bool {
        return UserDefaults.standard.value(forKey: scrollOrientationKey) as! Bool
    }
    
    // MARK: Setter
    
    

}
