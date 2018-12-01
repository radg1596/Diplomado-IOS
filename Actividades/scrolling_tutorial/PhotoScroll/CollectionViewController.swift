import UIKit

class CollectionViewController: UICollectionViewController {
  fileprivate let reuseIdentifier = "PhotoCell"
  fileprivate let thumbnailSize = CGSize(width: 70.0, height: 70.0)
  fileprivate let sectionInsets = UIEdgeInsets(top: 10, left: 5.0, bottom: 10.0, right: 5.0)
  fileprivate let photos = ["photo1", "photo2", "photo3", "photo4", "photo5"]
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let cell = sender as? UICollectionViewCell,
      let indexPath = collectionView?.indexPath(for: cell),
      let zoomedPhotoViewController = segue.destination as? ZoomedPhotoViewController {
      zoomedPhotoViewController.photoName = "photo\(indexPath.row + 1)"
    }
  }
}

// MARK: UICollectionViewDataSource
extension CollectionViewController {
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return photos.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoCell
    let fullSizedImage = UIImage(named:photos[indexPath.row])
    cell.imageView.image = fullSizedImage?.thumbnailOfSize(thumbnailSize)
    return cell
  }
}

// MARK:UICollectionViewDelegateFlowLayout
extension CollectionViewController : UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return thumbnailSize
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return sectionInsets
  }
}
