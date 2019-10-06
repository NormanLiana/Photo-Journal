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
    var photoAlbums = [PhotoJournal]() {
        didSet {
            collectionViewOutlet.reloadData()
        }
    }
    
    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        loadEntry()
        collectionViewOutlet.dataSource = self
        collectionViewOutlet.delegate = self
    }
    
    
    // MARK: Actions
    @IBAction func addEntryButtonPressed(_ sender: UIBarButtonItem) {
        let entryVC = storyboard?.instantiateViewController(identifier: "PhotoEntryVC") as! PhotoEntryVC
        present(entryVC, animated: true, completion: nil)
    }
    
    
    @IBAction func settingsButtonPressed(_ sender: UIButton) {
        let settingsVC = storyboard?.instantiateViewController(identifier: "SettingsVC") as! SettingsVC
        present(settingsVC, animated: true, completion: nil)
    }
    
    
    // MARK: Private Methods
    private func loadEntry() {
        do {
            photoAlbums = try PhotoPersistHelper.manager.getPhoto()
            
        } catch {
            print(error)
        }
    }

}

// MARK: Extensions
extension PhotoJournalVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoAlbums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionViewOutlet.dequeueReusableCell(withReuseIdentifier: "journalCell", for: indexPath) as? PhotoJournalCell {
            let album = photoAlbums[indexPath.row]
            cell.titleLabel.text = album.title
            cell.imgOutlet.image = UIImage(data: album.photo)
            cell.optionsButton.tag = indexPath.row
            cell.delegate = self
            return cell
        }
        return UICollectionViewCell()
    }
}


extension PhotoJournalVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 300)
    }
}

extension PhotoJournalVC: UICollectionViewDelegate {}


extension PhotoJournalVC: PhotoJournalCellDelegate {
    func actionSheet(tag: Int) {
        let optionsMenu = UIAlertController(title: "Options", message: "Pick an option below", preferredStyle: .actionSheet)
        let deleteAlbum = UIAlertAction(title: "Delete", style: .default, handler: nil)
        let editAlbum = UIAlertAction(title: "Edit", style: .default, handler: nil)
        let shareAlbum  = UIAlertAction(title: "Share", style: .default, handler: nil)
        optionsMenu.addAction(deleteAlbum)
        optionsMenu.addAction(editAlbum)
        optionsMenu.addAction(shareAlbum)
        self.present(optionsMenu, animated: true, completion: nil)
    }
    
    
}
