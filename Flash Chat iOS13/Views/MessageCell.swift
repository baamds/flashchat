//
//  MessageCell.swift
//  Flash Chat iOS13
//
//  Created by Amir Bakhshi on 2021-09-02.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class MessageCell: UITableViewCell {

    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var rightImgView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        messageBubble.layer.cornerRadius = messageBubble.frame.size.height / 3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        // Configure the view for the selected state
        // Configure the view for the selected state
    }
 
    func configure(for message: Message, email: String) {
        if email == Auth.auth().currentUser?.email {
            if message.sender == Auth.auth().currentUser?.email {
                leftImageView.isHidden = true
                rightImgView.isHidden = false
                backgroundColor = UIColor(named: K.BrandColors.lightPurple)
                label.textColor = UIColor(named: K.BrandColors.purple)
            } else {
                leftImageView.isHidden = false
                rightImgView.isHidden = true
                backgroundColor = UIColor(named: K.BrandColors.purple)
                label.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
            }
        }
    }
    
}
