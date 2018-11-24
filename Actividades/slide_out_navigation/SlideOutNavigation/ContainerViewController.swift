import UIKit
import QuartzCore

class ContainerViewController: UIViewController {
  
  enum SlideOutState {
    case bothCollapsed
    case leftPanelExpanded
    case rightPanelExpanded
  }
  
  var centerNavigationController: UINavigationController!
  var centerViewController: CenterViewController!
  
  var currentState: SlideOutState = .bothCollapsed
  var leftViewController: SidePanelViewController?
  let centerPanelExpandedOffset: CGFloat = 60
  
  override func viewDidLoad() {
    super.viewDidLoad()
    centerViewController = UIStoryboard.centerViewController()
    centerViewController.delegate = self
    
    centerNavigationController = UINavigationController(rootViewController: centerViewController)
    
    view.addSubview(centerNavigationController.view)
    addChildViewController(centerNavigationController)
    centerNavigationController.didMove(toParentViewController: self)
    
  }
  
}

extension ContainerViewController: CenterViewControllerDelegate {
  
  func toggleLeftPanel() {
    let notAlreadyExpanded = (currentState != .leftPanelExpanded)
    
    if notAlreadyExpanded {
      addLeftPanelViewController()
    }
    
    animateLeftPanel(shouldExpand: notAlreadyExpanded)
  }
  
  
  func toggleRightPanel() {
  }
  
  
  
  func collapseSidePanels() {
  }
  
  
  
  func addLeftPanelViewController() {
    guard leftViewController == nil else {return}
    if let vc = UIStoryboard.leftViewController() {
      vc.animals = Animal.allCats()
      addChildSidePanelController(vc)
      leftViewController = vc
    }
  }
  
  func addChildSidePanelController(_ sidePanelController: SidePanelViewController) {
    
    view.insertSubview(sidePanelController.view, at: 0)
    
    addChildViewController(sidePanelController)
    sidePanelController.didMove(toParentViewController: self)
    
  }
  
  
  func addRightPanelViewController() {
  }
  
  
  
  func animateLeftPanel(shouldExpand: Bool) {
    
    if shouldExpand {
      currentState = .leftPanelExpanded
      animateCenterXPosition(targetPosition: centerNavigationController.view.frame.width - centerPanelExpandedOffset)
    }
    else {
      animateCenterXPosition(targetPosition: 0) { finished in
        self.currentState = .bothCollapsed
        self.willMove(toParentViewController: nil)
        self.leftViewController?.view.removeFromSuperview()
        self.leftViewController?.removeFromParentViewController()
        self.leftViewController = nil
      }
    }
    
  }
  
  func animateCenterXPosition(targetPosition: CGFloat, completion: ((Bool) -> Void)? = nil) {
    
    UIView.animate(withDuration: 0.5,
                   delay: 0,
                   usingSpringWithDamping: 0.8,
                   initialSpringVelocity: 0,
                   options: .curveEaseInOut, animations: {
                    self.centerNavigationController.view.frame.origin.x = targetPosition
      }
      , completion: completion)
    
  }
  
  
  
  func animateRightPanel(shouldExpand: Bool) {
  }
  
  
  
}

private extension UIStoryboard {
  
  static func mainStoryboard() -> UIStoryboard { return UIStoryboard(name: "Main", bundle: Bundle.main) }
  
  static func leftViewController() -> SidePanelViewController? {
    return mainStoryboard().instantiateViewController(withIdentifier: "LeftViewController") as? SidePanelViewController
  }
  
  static func rightViewController() -> SidePanelViewController? {
    return mainStoryboard().instantiateViewController(withIdentifier: "RightViewController") as? SidePanelViewController
  }
  
  static func centerViewController() -> CenterViewController? {
    return mainStoryboard().instantiateViewController(withIdentifier: "CenterViewController") as? CenterViewController
  }
}
