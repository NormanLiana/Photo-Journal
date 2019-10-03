//
//  PhotoJournalVC.swift
//  PhotoJournal-Project
//
//  Created by Liana Norman on 10/3/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit

class PhotoJournalVC: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    
    // MARK: Properties
    var photoAlbums = [PhotoJournal]()
    
    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Private Methods
    

}

// MARK: Extensions
extension PhotoJournalVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        <#code#>
//    }
}
