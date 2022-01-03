
import UIKit
import Alamofire

class PickViewController3: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var foods = [urls]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension PickViewController3: UICollectionViewDataSource, UICollectionViewDelegate {
    
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
