//
//  PhotoDetailViewController.swift
//  FlickrApp
//
//  Created by Sevda Abbasi on 8.05.2025.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ownerImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Photo Detail"
       // imageView.backgroundColor = .gray
       // ownerImageView.backgroundColor = .darkGray
        ownerNameLabel.text = "Owner Name"
        descriptionLabel.text = "Description Label Description Label Description LabelDescription Label Description Label Description LabelDescription Label Description Label Description Label Description Label Description Label Description Label Description Label Description Label Description LabelDescription Label"
        
    }
    

   

}
