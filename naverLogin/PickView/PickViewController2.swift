//
//  PickViewController2.swift
//  naverLogin
//
//  Created by 김민종 on 2021/12/23.
//

import UIKit

class PickViewController2: UIViewController,UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!
    
    let images = [UIImage(named: "쿠폰1"), UIImage(named: "쿠폰2"), UIImage(named: "쿠폰3"), UIImage(named: "쿠폰4")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "couponCell", for: indexPath) as! PickTableViewCell
        
        cell.myImage.image = images[indexPath.row]
        
        
        return cell
    }
}
