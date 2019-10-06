//
//  PhotoJournalCell.swift
//  PhotoJournal-Project
//
//  Created by Liana Norman on 10/3/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit

protocol PhotoJournalCellDelegate: AnyObject {
    func actionSheet(tag: Int)
}

class PhotoJournalCell: UICollectionViewCell {
    
    // MARK: Outlets
    @IBOutlet weak var imgOutlet: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var optionsButton: UIButton!
    
    // MARK: Delegate
    weak var delegate: PhotoJournalCellDelegate?
    
    // MARK: Actions
    @IBAction func optionsButtonPressed(_ sender: UIButton) {
        delegate?.actionSheet(tag: sender.tag)
    }
    
    
}
