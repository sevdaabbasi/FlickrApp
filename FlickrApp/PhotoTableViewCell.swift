//
//  PhotoTableViewCell.swift
//  FlickrApp
//
//  Created by Sevda Abbasi on 8.05.2025.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {
 
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var ownerImageView: UIImageView!
    
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
//bashbsc
}
