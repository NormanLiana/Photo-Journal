//
//  PhotoEntryVC.swift
//  PhotoJournal-Project
//
//  Created by Liana Norman on 10/4/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit

class PhotoEntryVC: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var imgOutlet: UIImageView!
    @IBOutlet weak var textFieldOutlet: UITextField!
    
    // MARK: Properties
    var journalTitle: String!
    
    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldOutlet.delegate = self

    }
    
    // MARK: Actions
    @IBAction func photoLibraryButtonPressed(_ sender: UIBarButtonItem) {
        let imgPicker = UIImagePickerController()
        imgPicker.delegate = self
        imgPicker.sourceType = .photoLibrary
        present(imgPicker, animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        guard let imgData = self.imgOutlet.image?.jpegData(compressionQuality: 0.7) else {return}
        let journalEntry = PhotoJournal(photo: imgData, title: journalTitle)
        try? PhotoPersistHelper.manager.savePhoto(newPhoto: journalEntry)
        self.dismiss(animated: true, completion: nil)
    }
    
}

// MARK: Extensions
extension PhotoEntryVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imgOutlet.image = image
        }
        dismiss(animated: true, completion: nil)
    }
}

extension PhotoEntryVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let title = textField.text {
            journalTitle = title
        }
        return true
    }
}
