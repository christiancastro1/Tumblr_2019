//
//  PhotoCell.swift
//  Tumblr_2019
//
//  Created by Christian Alexander Valle Castro on 10/15/19.
//  Copyright © 2019 valle.co. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {
    // Mark: - properties
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
