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
        guard let color = UserDefaults.standard.value(forKey: backgroundColorKey) as? UIColor else { return UIColor() }
        return color
    }
    
    func getScrollOrientation() -> Bool {
        guard let scroll = UserDefaults.standard.value(forKey: scrollOrientationKey) as? Bool else { return false }
        return scroll
    }
    
    // MARK: Setter
    
    func setScrollOrientation() {
        
    }
    
    func setBackgroundColor() {
        
    }

}
