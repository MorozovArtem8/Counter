import UIKit

class ViewController: UIViewController {
    //MARK: IBOutle
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var infoTextField: UITextView!
    
    private var labelCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoTextField.isSelectable = false
        labelUpdate()
    }
    
    //MARK: IBAction
    @IBAction func addButtondTapped(_ sender: UIButton) {
        labelCounter += 1
        labelUpdate()
        infoTextField.text += "\n\(currentDateString()): Значение изменено на +1"
    }
    
    @IBAction func subtractButtondTapped(_ sender: UIButton) {
        if labelCounter > 0 {
            labelCounter -= 1
            labelUpdate()
            infoTextField.text += "\n\(currentDateString()): Значение изменено на -1"
        }else {
            infoTextField.text += "\n\(currentDateString()): Попытка уменьшить значение счётчика ниже 0"
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        labelCounter = 0
        labelUpdate()
        infoTextField.text += "\n\(currentDateString()): Значение сброшено"
    }
    
    private func currentDateString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .short
        dateFormater.timeStyle = .short
        dateFormater.locale = Locale(identifier: "ru_RU")
        let date = Date()
        
        return String(dateFormater.string(from: date))
    }
    
    private func labelUpdate() {
        counterLabel.text = "Значение счётчика: \(labelCounter)"
    }
}

