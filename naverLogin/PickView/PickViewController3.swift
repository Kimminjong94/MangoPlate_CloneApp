
import UIKit
import Alamofire

struct Food: Decodable {
    var results: [results]
}

struct results: Decodable {
    var urls: [urls]
}

struct urls: Decodable {
    var thumb: String
}

class PickViewController3: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var foods = [urls]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
