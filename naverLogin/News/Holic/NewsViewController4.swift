//
//  NewsViewController4.swift
//  naverLogin
//
//  Created by 김민종 on 2021/12/23.
//

import UIKit

class NewsViewController4: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let contentArray = [
        "계절이나 유행에 따라서 계속 바뀌는 나의 관심사! 휴대폰을 사고 나면 한동안은 휴대폰 케이스만 찾아다니고, TV에서 맛있는 음식이 나오면 그 음식의 맛집들을 찾아다니기도 해요! ",
        
        "저는 요즘 귀여운 냉장고 자석을 찾아보고 있어요. 잊지 말아야 할 것들을 냉장고나 현관문에 자석으로 붙여놓는데요! 알아보니 열쇠나 마스크를 걸어 놓는 고리로 된 자석도 있고, 귀여운 동물 모양, 맛있는 음식 모양 등 종류가 정말 많았어요! 놓치지 않고 장바구니로 차곡차곡 쌓이고 있답니다. :)",
        
        "여러분의 최근 최애 관심사는 무엇인가요?",
        
        "공부요 공부... 딴 건 신경 쓸 겨를도 없어요ㅠㅠ는 요즘 귀여운 냉장고 자석을 찾아보고 있어요. 잊지 말아야 할 것들을 냉장고나 현관문에 자석으로 붙여놓는데요! 알아보니 열쇠나 마스크를 걸어 놓는 고리로 된 자석도 있고, 귀여운 동물 모양, 맛있는 음식 모양 등 종류가 정말 많았어요! 놓치지 않고 장바구니로 차곡차곡 쌓이고 있답니다.",
        
        " 뭐 그야 제가 하는 모든게 다 제 관심사죠.는 요즘 귀여운 냉장고 자석을 찾아보고 있어요. 잊지 말아야 할 것들을 냉장고나 현관문에 자석으로 붙여놓는데요! 알아보니 열쇠나 마스크를 걸어 놓는 고리로 된 자석도 있고, 귀여운 동물 모양, 맛있는 음식 모양 등 종류가 정말 많았어요! 놓치지 않고 장바구니로 차곡차곡 쌓이고 있답니다.는 요즘 귀여운 냉장고 자석을 찾아보고 있어요. 잊지 말아야 할 것들을 냉장고나 현관문에 자석으로 붙여놓는데요! 알아보니 열쇠나 마스크를 걸어 놓는 고리 로 된 자석도 있고, 귀여운 동물 모양, 맛있는 음식 모양 등 종류가 정말 많았어요! 놓치지 않고 장바구니로 차곡차곡 쌓이고 있답니다."
    
    ]
    var dataSource: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }
}

//MARK: - DataSource

extension NewsViewController4: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let selfSizingCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SelfSizing2
        selfSizingCell.cellText.text = contentArray[indexPath.row]
        return selfSizingCell
    }
}
