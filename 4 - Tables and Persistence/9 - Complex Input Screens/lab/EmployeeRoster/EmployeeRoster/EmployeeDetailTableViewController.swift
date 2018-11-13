
import UIKit

class EmployeeDetailTableViewController: UITableViewController, UITextFieldDelegate {
    

    struct PropertyKeys {
        static let unwindToListIndentifier = "UnwindToListSegue"
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var employeeTypeLabel: UILabel!
    
    @IBOutlet weak var birthdayDatePicker: UIDatePicker!
    
    var employee: Employee?
    var employeeType: EmployeeType?
    
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
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dobLabel.text = dateFormatter.string(from: birthdayDatePicker.date)
    }
   // updateView()
    // value changed??

// is editing birthday
let birthdayDatePickerCellIndexPath = IndexPath(row: 2, section: 0)

var isbirthdayDatePickerShown: Bool = false {
    didSet {
        birthdayDatePicker.isHidden = !isbirthdayDatePickerShown
    }
    
}
   
    // change Date() to birthdayDatePicker
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        if let name = nameTextField.text, let employeeType = employeeType {
            employee = Employee(name: name, dateOfBirth: birthdayDatePicker.date, employeeType: employeeType)
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
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch (indexPath.section, indexPath.row) {
        case (birthdayDatePickerCellIndexPath.section,
              birthdayDatePickerCellIndexPath.row - 1):
            if isbirthdayDatePickerShown {
                isbirthdayDatePickerShown = false
            } else { isbirthdayDatePickerShown = true
                
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()
            
        default: break
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.section, indexPath.row) {
        case (birthdayDatePickerCellIndexPath.section,
              birthdayDatePickerCellIndexPath.row):
            if isbirthdayDatePickerShown {
                return 216.0
            } else {
                return 0.0
            }
        default:
            return 44.0
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EmployeeTypeTableViewController {
            destination.delegate = self
        }
    }
}

extension EmployeeDetailTableViewController: EmployeeTypeDelegate{
    func didSelect(employeeType: EmployeeType) {
        self.employeeType = employeeType
        employeeTypeLabel.text = employeeType.description()
        employeeTypeLabel.textColor = .black
    }
}
