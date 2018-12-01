import UIKit

// A delay function
func delay(_ seconds: Double, completion: @escaping ()->Void) {
  DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
}

class ViewController: UIViewController {
  
  // MARK: IB outlets
  
  @IBOutlet var loginButton: UIButton!
  @IBOutlet var heading: UILabel!
  @IBOutlet var username: UITextField!
  @IBOutlet var password: UITextField!
  
  @IBOutlet var cloud1: UIImageView!
  @IBOutlet var cloud2: UIImageView!
  @IBOutlet var cloud3: UIImageView!
  @IBOutlet var cloud4: UIImageView!
  
  // MARK: further UI
  
  let spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
  let status = UIImageView(image: UIImage(named: "banner"))
  let label = UILabel()
  let messages = ["Connecting ...", "Authorizing ...", "Sending credentials ...", "Failed"]
  
  var statusPosition = CGPoint.zero
  
  // MARK: view controller methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //set up the UI
    loginButton.layer.cornerRadius = 8.0
    loginButton.layer.masksToBounds = true
    
    spinner.frame = CGRect(x: -20.0, y: 6.0, width: 20.0, height: 20.0)
    spinner.startAnimating()
    spinner.alpha = 0.0
    loginButton.addSubview(spinner)
    
    status.isHidden = true
    status.center = loginButton.center
    view.addSubview(status)
    
    label.frame = CGRect(x: 0.0, y: 0.0, width: status.frame.size.width, height: status.frame.size.height)
    label.font = UIFont(name: "HelveticaNeue", size: 18.0)
    label.textColor = UIColor(red: 0.89, green: 0.38, blue: 0.0, alpha: 1.0)
    label.textAlignment = .center
    status.addSubview(label)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    heading.center.x -= view.bounds.width
    username.center.x -= view.bounds.width
    password.center.x -= view.bounds.width
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    UIView.animate(withDuration: 0.5) {
        self.heading.center.x += self.view.bounds.width
    }
    UIView.animate(withDuration: 0.5, delay: 0.3, options: [], animations: {
        self.username.center.x += self.view.bounds.width
    }, completion: nil)
    UIView.animate(withDuration: 0.8, delay: 0.6, options: [.curveEaseInOut], animations: {
        self.password.center.x += self.view.bounds.width
    }, completion: nil)
    
    //Clouds
    UIView.animate(withDuration: 5.0, delay: 0.1, options: [.curveEaseIn, .curveEaseInOut, .autoreverse, .repeat], animations: {
        self.cloud1.center.x += self.view.bounds.width
    }, completion: nil)
    UIView.animate(withDuration: 5.0, delay: 0.1, options: [.curveEaseIn,.curveEaseInOut, .autoreverse, .repeat], animations: {
        self.cloud2.center.x -= self.view.bounds.width
    }, completion: nil)
    UIView.animate(withDuration: 7.0, delay: 0.1, options: [.curveEaseIn, .curveEaseInOut, .autoreverse, .repeat], animations: {
        self.cloud3.center.x += self.view.bounds.width / 6
    }, completion: nil)
    UIView.animate(withDuration: 7.0, delay: 0.1, options: [.curveEaseIn,.curveEaseInOut, .autoreverse, .repeat], animations: {
        self.cloud4.center.x -= self.view.bounds.width / 6
    }, completion: nil)
    
  }
  
  // MARK: further methods
  
  @IBAction func login() {
    view.endEditing(true)
  }
  
  // MARK: UITextFieldDelegate
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    let nextField = (textField === username) ? password : username
    nextField?.becomeFirstResponder()
    return true
  }
  
}
