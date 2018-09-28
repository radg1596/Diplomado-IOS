//
//  EmojiTableViewCell.swift
//  emojiDictionary
//
//  Created by macbook on 10/07/18.
//  Copyright © 2018 Ingenieros Unam. All rights reserved.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {

    
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func update(with emoji: Emoji) {
        
        symbolLabel.text = emoji.symbol
        nameLabel.text = emoji.name
        descriptionLabel.text = emoji.description
        
    }

}
