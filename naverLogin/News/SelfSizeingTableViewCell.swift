//
//  SelfSizeingTableViewCell.swift
//  naverLogin
//
//  Created by 김민종 on 2021/12/23.
//

import UIKit

class SelfSizeingTableViewCell: UITableViewCell {
    @IBOutlet weak var cellText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
