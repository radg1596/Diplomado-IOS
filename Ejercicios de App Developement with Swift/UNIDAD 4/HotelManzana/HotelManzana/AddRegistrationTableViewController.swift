//
//  AddRegistrationTableViewController,.swift
//  HotelManzana
//
//  Created by macbook on 12/07/18.
//  Copyright © 2018 Ingenieros Unam. All rights reserved.
//

import UIKit

class AddRegistrationTableViewController_: UITableViewController, SelectRoomTypeTableViewControllerDelegate {
    
    ////Propiedad computada
    var registration: Registration? {
        
        guard let roomType = roomType else {return nil}
        
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let checkInDate = checkInDataPicker.date
        let checkOutDate = checkOutDataPicker.date
        let numberOfAdults = Int(numberOfAdultsStepper.value)
        let numberOfChildren = Int( numberOfChildrenStepper.value)
        let hasWifi = wifiSwitch.isOn
        
        return Registration(firstName: firstName, lastName: lastName, emailAdress: email, checkInDate: checkInDate, checkOutDate: checkOutDate, numberOfAdults: numberOfAdults, numberOfChilds: numberOfChildren, roomType: roomType , wifi: hasWifi)
        
        
    }
    
    func didSelect(roomType: RoomType) {
        self.roomType = roomType
        updateRoomType()
    }

    ///Tipo de cuarto
    var roomType: RoomType?
    
    
    ///TextFields
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    ///Date
    
    @IBOutlet weak var checkInDateLabel: UILabel!
    @IBOutlet weak var checkOutDateLabel: UILabel!
    @IBOutlet weak var checkInDataPicker: UIDatePicker!
    @IBOutlet weak var checkOutDataPicker: UIDatePicker!
    
    ////Contar
    @IBOutlet weak var numberOfAdultsLabel: UILabel!
    @IBOutlet weak var numberOfAdultsStepper: UIStepper!
    @IBOutlet weak var numberOfChildrenLabel: UILabel!
    @IBOutlet weak var numberOfChildrenStepper: UIStepper!
    
    ///Switch
    @IBOutlet weak var wifiSwitch: UISwitch!
    ///Detalle de cuarto
    @IBOutlet weak var roomTypeLabel: UILabel!
    
    @IBAction func wifiSwitchHasChanged(_ sender: UISwitch) {
    }
    ///Propiedades
    let checkInDatePickerIndexPath = IndexPath(row: 1, section: 1)
    let checkOutDatePickerIndexPath = IndexPath(row: 3, section: 1)
    
    var isCheckInDatePickerShown: Bool = false {
        didSet {
            checkInDataPicker.isHidden = !isCheckInDatePickerShown
        }
    }
    
    var isCheckOutDatePickerShown: Bool = false {
        didSet{
            checkOutDataPicker.isHidden = !isCheckOutDatePickerShown
        }
    }
    
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        updateDateViews()
    }
    
    func updateDateViews() {
        
        checkOutDataPicker.minimumDate = checkInDataPicker.date.addingTimeInterval(86400)
        
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .medium
        
        ///Asignando la fecha actual y la mínima
        checkInDateLabel.text = dateFormater.string(from: checkInDataPicker.date)
        checkOutDateLabel.text = dateFormater.string(from: checkOutDataPicker.date)
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let midnightToday = Calendar.current.startOfDay(for: Date())
        
        checkInDataPicker.minimumDate = midnightToday
        checkInDataPicker.date = midnightToday
        updateDateViews()
        updateNumberOfGuests()
        updateRoomType()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.section, indexPath.row) {
        case (checkInDatePickerIndexPath.section, checkInDatePickerIndexPath.row):
            if isCheckInDatePickerShown {
                return 162.0
            }
            else {
                return 0.0
            }
        case (checkOutDatePickerIndexPath.section, checkOutDatePickerIndexPath.row):
            if isCheckOutDatePickerShown {
                return 162.0
            }
            else {
                return 0.0
            }
        default:
            return 44.0
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch (indexPath.section, indexPath.row) {
        case (checkInDatePickerIndexPath.section, checkInDatePickerIndexPath.row - 1):
            
            if isCheckInDatePickerShown {
                isCheckInDatePickerShown = false
            }
            else if isCheckOutDatePickerShown {
                isCheckOutDatePickerShown = false
                isCheckInDatePickerShown = true
            }
            else {
                isCheckInDatePickerShown = true
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()
            
        case (checkOutDatePickerIndexPath.section, checkOutDatePickerIndexPath.row - 1):
            
            if isCheckOutDatePickerShown {
                isCheckOutDatePickerShown = false
            }
            else if isCheckInDatePickerShown {
                isCheckInDatePickerShown = false
                isCheckOutDatePickerShown = true
            }
            else {
                isCheckOutDatePickerShown = true
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()
            
        default:
            break
        }
    }

    func updateNumberOfGuests() {
        numberOfAdultsLabel.text = "\(Int(numberOfAdultsStepper.value))"
        numberOfChildrenLabel.text = "\(Int(numberOfChildrenStepper.value))"
    }
    
    @IBAction func valueOfStepperChanged (_ sender: UIStepper) {
        updateNumberOfGuests()
    }
    
    func updateRoomType() {
        if let roomType = roomType {
            roomTypeLabel.text = roomType.name
        }
        else {
            roomTypeLabel.text = "Not set"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectRoomType" {
            let destinationViewController = segue.destination as?  SelectRoomTypeTableViewController
            destinationViewController?.delegate = self
            destinationViewController?.roomType = roomType
        }
    }
    
    @IBAction func cancelButtonTapped() {
        dismiss(animated: true, completion: nil)
    }

}
