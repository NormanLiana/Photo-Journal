//
//  SettingsProtocols.swift
//  PhotoJournal-Project
//
//  Created by Liana Norman on 10/7/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation

protocol SettingsDelegate: AnyObject {
    func darkModeOn()
    func darkModeOff()
    func horizontalScroll()
    func verticalScroll()
}
