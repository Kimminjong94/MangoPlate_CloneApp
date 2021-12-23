//
//  InfoSection.swift
//  naverLogin
//
//  Created by 김민종 on 2021/12/23.
//

import UIKit

class InfoSection: UITableViewCell {
    
    @IBOutlet weak var sectionImageview: UIImageView!
    
    @IBOutlet weak var sectionLabelView: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    func setSectionName(_ name: String) {
        self.sectionLabelView.text = name
        self.sectionImageview.image = UIImage(named: "")
    }
    
    
}
