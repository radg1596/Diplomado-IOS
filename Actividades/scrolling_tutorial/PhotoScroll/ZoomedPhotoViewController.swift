import UIKit

class ZoomedPhotoViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewTrailingConstraint: NSLayoutConstraint!
    var photoName: String?
  
  override func viewDidLoad() {
    guard let photoName = photoName else {return}
    imageView.image = UIImage(named: photoName)
  }
  
  //Se manda a llamar cuando se termina de hacer el cálculo de los constraints
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    updateMinZoomScaleForSize(view.bounds.size)
  }
  
  func updateMinZoomScaleForSize(_ size: CGSize) {
    let widthScale = size.width / imageView.bounds.width
    let heightScale = size.height / imageView.bounds.height
    let minScale = min(widthScale, heightScale)
    
    scrollView.minimumZoomScale = minScale
    scrollView.zoomScale = minScale
  }
  
}

extension ZoomedPhotoViewController: UIScrollViewDelegate {
  ////¿A qué UIView se aplicará el Zoom?
  func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    return imageView
  }
  
  func scrollViewDidZoom(_ scrollView: UIScrollView) {
    updateConstraintsForSize(view.bounds.size)
  }
  
  func updateConstraintsForSize(_ size: CGSize) {
    
    let yOffSet = max(0, (size.height - imageView.frame.height) / 2)
    imageViewTopConstraint.constant = yOffSet
    imageViewBottomConstraint.constant = yOffSet
    
    let xOffSet = max(0, (size.width - imageView.frame.width) / 2)
    imageViewLeadingConstraint.constant = xOffSet
    imageViewTrailingConstraint.constant = xOffSet
    
    view.layoutIfNeeded()
    
  }
  
  
}


