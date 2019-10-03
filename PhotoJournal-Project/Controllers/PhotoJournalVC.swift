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
extension PhotoJournalVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoAlbums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionViewOutlet.dequeueReusableCell(withReuseIdentifier: "journalCell", for: indexPath) as? PhotoJournalCell {
            let album = photoAlbums[indexPath.row]
            cell.textViewOutlet.text = album.title
            
            // TODO: set image for cell
            
            return cell
        }
        return UICollectionViewCell()
    }
}

