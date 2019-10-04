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
    
    override func viewWillAppear(_ animated: Bool) {
        loadEntry()
    }
    
    // MARK: Actions
    @IBAction func addEntryButtonPressed(_ sender: UIBarButtonItem) {
        let entryVC = storyboard?.instantiateViewController(identifier: "PhotoEntryVC") as! PhotoEntryVC
        entryVC.modalPresentationStyle = .currentContext
        present(entryVC, animated: true, completion: nil)
    }
    
    
    @IBAction func settingsButtonPressed(_ sender: UIButton) {
        
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
