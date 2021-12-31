//
//  MyInfo.swift
//  naverLogin
//
//  Created by 김민종 on 2021/12/23.
//

import UIKit

class MyInfo: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var kakaoProfile: UILabel!

    @IBOutlet weak var email: UILabel!
    
    //화면전환시 값이 잘 넘어오는가 ?
    
    var kakaoNickname: String?
    var myemail: String?
    
    var sectionCell: [[String]] = [["이벤트"], ["구매한 EAT딜","EAT딜 입고알림"],["타임라인", "가고싶다", "마이리스트", "북마크", "내가 등록한 식당"], ["설정"]]
    var myImages = ["인포배너", "인포배너", "인포배너", "인포배너", "인포배너", "인포배너"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
        navigationController?.navigationBar.tintColor = .label
        configureItem()
        
        tableView.tableFooterView = UIView(frame:  .zero)
        tableView.register(UINib(nibName: "InfoSection", bundle: nil), forCellReuseIdentifier: "InfoSection")
        tableView.dataSource = self
        tableView.delegate = self
        

    }
    override func viewWillAppear(_ animated: Bool) {
        if let value = UDM.shared.defaults.value(forKey: "Key") as? String {
            kakaoProfile.text = value
        }

    }
    
    private func configureItem() {
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(
                image: UIImage(systemName: "bell"),
                style: .done,
                target: self,
                action: nil
            )
        ]
    }
}
extension MyInfo: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoSection") as! InfoSection
        
        let item = myImages[indexPath.row]
        cell.sectionLabelView?.text = sectionCell[indexPath.section][indexPath.row]
        cell.sectionImageview?.image = UIImage(named: item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionCell[section].count
    }
}
extension MyInfo {
    private func setUI() {
        if let nickname = kakaoNickname {
            self.kakaoProfile.text = "\(nickname)"
        }
//        if let emial = myemail {
//            email.text = "\(emial)님 환영합니다."
//        } else {
//            email.text = "이메일 정보 없음"
//        }
    }
}
