//
//  FishesViewCellTableViewCell.swift
//  plasticfishes-mvc
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 21/09/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import UIKit

class FishesViewCellTableViewCell: UITableViewCell {

    @IBOutlet weak var fishImageView: UIImageView!
    @IBOutlet weak var fishTitleLabel: UILabel!
    
    @IBOutlet weak var fishSubtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
