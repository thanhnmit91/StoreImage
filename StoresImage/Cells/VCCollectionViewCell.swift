//
//  VCCollectionViewCell.swift
//  StoresImage
//
//  Created by administrator on 11/18/19.
//  Copyright © 2019 Vision. All rights reserved.
//

import UIKit



class VCCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func actRemove(_ sender: Any) {
    }
}
