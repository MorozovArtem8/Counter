import UIKit

final class ViewController: UIViewController {
    //MARK: IBOutlet
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var infoTextField: UITextView!
    
    private var labelCounter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoTextField.isSelectable = false
        labelUpdate()
    }
    
    //MARK: IBAction
    @IBAction private func addButtonTapped(_ sender: UIButton) {
        labelCounter += 1
        labelUpdate()
        infoTextField.text += "\n\(currentDateString()): Значение изменено на +1"
    }
    
    @IBAction private func subtractButtonTapped(_ sender: UIButton) {
        if labelCounter > 0 {
            labelCounter -= 1
            labelUpdate()
            infoTextField.text += "\n\(currentDateString()): Значение изменено на -1"
        }else {
            infoTextField.text += "\n\(currentDateString()): Попытка уменьшить значение счётчика ниже 0"
        }
    }
    
    @IBAction private func resetButtonTapped(_ sender: UIButton) {
        labelCounter = 0
        labelUpdate()
        infoTextField.text += "\n\(currentDateString()): Значение сброшено"
    }
    
    private func currentDateString() -> String {
        let dateFormate = DateFormatter()
        dateFormate.dateStyle = .short
        dateFormate.timeStyle = .short
        dateFormate.locale = Locale(identifier: "ru_RU")
        let date = Date()
        
        return String(dateFormate.string(from: date))
    }
    
    private func labelUpdate() {
        counterLabel.text = "Значение счётчика: \(labelCounter)"
    }
}

