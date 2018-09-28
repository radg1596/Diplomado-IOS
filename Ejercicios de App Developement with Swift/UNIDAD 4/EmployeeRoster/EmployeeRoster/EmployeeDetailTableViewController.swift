
import UIKit

class EmployeeDetailTableViewController: UITableViewController, UITextFieldDelegate, EmployeeTypeTableViewControllerDelegate {
    
    var emplooyeType: EmployeeType?
    
    var isEditingBirthDay: Bool = false {
        didSet {
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }

    struct PropertyKeys {
        static let unwindToListIndentifier = "UnwindToListSegue"
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var employeeTypeLabel: UILabel!
    @IBOutlet weak var dateBirthdayPicker: UIDatePicker!
    
    var employee: Employee?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    
    func updateView() {
        if let employee = employee {
            navigationItem.title = employee.name
            nameTextField.text = employee.name
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dobLabel.text = dateFormatter.string(from: employee.dateOfBirth)
            dobLabel.textColor = .black
            employeeTypeLabel.text = employee.employeeType.description()
            employeeTypeLabel.textColor = .black
        } else {
            navigationItem.title = "New Employee"
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        if let name = nameTextField.text {
            guard let emplooyeType = emplooyeType else {return}
            
            employee = Employee(name: name, dateOfBirth: dateBirthdayPicker.date, employeeType: emplooyeType)
            performSegue(withIdentifier: PropertyKeys.unwindToListIndentifier, sender: self)
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        employee = nil
        performSegue(withIdentifier: PropertyKeys.unwindToListIndentifier, sender: self)
    }
    
    // MARK: - Text Field Delegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 2 {
            if isEditingBirthDay {
                return 162.0
            }
            else {
                return 0.0
            }
        }
        else { return 44.0 }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 1 {
            isEditingBirthDay = !isEditingBirthDay
            dobLabel.textColor = .black
            dobLabel.text = dataToString(date: dateBirthdayPicker.date)
        }
        
    }
    
    func dataToString (date: Date) -> String {
        
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .medium
        let dateString = dateFormater.string(from: date)
        return dateString
        
    }
    
    @IBAction func dataPickerChanged(_ sender: Any) {
        dobLabel.text = dataToString(date: dateBirthdayPicker.date)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let emplooyeTypeTableViewController = segue.destination as? EmployeeTypeTableViewController
        emplooyeTypeTableViewController?.delegate = self
    }
    
    func didSelect(emplooyeType: EmployeeType) {
        self.emplooyeType = emplooyeType
        employeeTypeLabel.textColor = .black
        employeeTypeLabel.text = emplooyeType.description()
    }
    

}
