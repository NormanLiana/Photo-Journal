//
//  PhotoPersistHelper.swift
//  PhotoJournal-Project
//
//  Created by Liana Norman on 10/4/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation

struct PhotoPersistHelper {
    
    static let manager = PhotoPersistHelper()
    
    func savePhoto(newPhoto: PhotoJournal) throws {
        try persistenceHelper.save(newElement: newPhoto)
    }
    
    func getPhoto() throws -> [PhotoJournal] {
        return try persistenceHelper.getObjects()
    }
    
    func delete(tag: Int) throws {
        try persistenceHelper.delete(index: tag)
    }
    
    func edit(element: PhotoJournal, index: Int) throws {
        try persistenceHelper.edit(newElement: element, index: index)
    }
    
    private let persistenceHelper = PersistenceManager<PhotoJournal>(fileName: "photos.plist")
    
    private init() {}
}
