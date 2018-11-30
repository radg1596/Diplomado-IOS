import UIKit

class CenterViewController: UIViewController {
  
  @IBOutlet weak fileprivate var imageView: UIImageView!
  @IBOutlet weak fileprivate var titleLabel: UILabel!
  @IBOutlet weak fileprivate var creatorLabel: UILabel!
  
  var delegate: CenterViewControllerDelegate?
  
  // MARK: Button actions  
  @IBAction func kittiesTapped(_ sender: Any) {
    delegate?.toggleLeftPanel?()
  }
  
  @IBAction func puppiesTapped(_ sender: Any) {
    delegate?.toggleRightPanel?()
  }
}
