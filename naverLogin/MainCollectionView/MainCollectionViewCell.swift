//
//  MainCollectionViewCell.swift
//  naverLogin
//
//  Created by 김민종 on 2021/12/23.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    var foodData = [FoodRequest]()
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        FoodRequest().getFoodData(self)

            
    }
    
    func didSuccess(_ response: FoodResponse) {
        
        let data = response.getSafeRestaurantList.item[0].biz_nm
        self.nameLabel.text = data

    }
    


}
