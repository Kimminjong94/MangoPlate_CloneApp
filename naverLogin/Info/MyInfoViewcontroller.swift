//
//  MyInfo.swift
//  naverLogin
//
//  Created by 김민종 on 2021/12/23.
//

import UIKit

class MyInfo: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var kakaoProfile: UILabel!
    
    var kakaoNickname: String?
    
    var sectionCell: [[String]] = [["이벤트"], ["구매한 EAT딜","EAT딜 입고알림"],["타임라인", "가고싶다", "마이리스트", "북마크", "내가 등록한 식당"], ["설정"]]
    var myImages = ["인포배너", "인포배너", "인포배너", "인포배너", "인포배너", "인포배너"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.tintColor = .label
        tableView.register(UINib(nibName: "InfoSection", bundle: nil), forCellReuseIdentifier: "InfoSection")

        configureItem()
        
        tableView.tableFooterView = UIView(frame:  .zero)
        tableView.dataSource = self
        tableView.delegate = self
        

    }
    // UserDefault -> 프로필이름 가져오기
    override func viewWillAppear(_ animated: Bool) {
        if let value = UDM.shared.defaults.value(forKey: "Key") as? String {
            kakaoProfile.text = value
        }
    }
    // NavigationBar
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


//MARK: - Delegate, DataSource

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
