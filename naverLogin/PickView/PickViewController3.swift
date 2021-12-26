
import UIKit
import Alamofire

struct Food: Decodable {
    var results: [results]
}

struct results: Decodable {
    var urls: urls
}

struct urls: Decodable {
    var thumb: String
}

class PickViewController3: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var foods = [Food]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        collectionView.dataSource = self
        
//        let url = "https://api.unsplash.com/search/photos?client_id=f8wWvUvx1lgrsiUVQMA7ceyrNsYO42CoDTt7PWJMU1k&query=food&per_page=5"
//
//        let queryParam: Parameters = [
//            "client_id"  : "f8wWvUvx1lgrsiUVQMA7ceyrNsYO42CoDTt7PWJMU1k",
//            "query" : "food",
//            "per_page" : 5,
//        ]
//
//        AF.request(url,
//                   method: .get,
//                   parameters: queryParam,
//                   headers: nil)
//            .responseDecodable(of: [Food].self) { response in
//
//                switch response.result {
//                case .success(let response):
//                    debugPrint(response)
//                    print("debud resonse\(response)")
////                    viewController.didSuccess(response)
//
//
//                case .failure(let error):
//                    print("debug get error: \(error.localizedDescription)")
//                }
//                }
//        self.collectionView.reloadData()
//
//
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foods.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PickCollectionViewCell", for: indexPath) as! PickCollectionViewCell

        cell.imageView.contentMode = .scaleAspectFill
        cell.imageView.image
        return cell
    }


}
