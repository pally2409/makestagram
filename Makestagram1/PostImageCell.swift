//
//  PostImageCellTableViewCell.swift
//  Makestagram1
//
//  Created by Pallak Singh on 28/06/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class PostImageCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
