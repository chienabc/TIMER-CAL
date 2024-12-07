import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var results: UILabel!
    // biến lưu trữ trạng thái của máy tính
    var firstNumber: Double = 0 // lưu số đầu tiên trong phép tính
    var currentOperation: String = "" // lưu phép tính hiện tạu
    var isInputCompleted = false // kiểm soát trạng thái
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        results.text = "0"
    }
    
    
    // Hàm thêm số vào màn hình
    func addNumber(_ number: String) {
        // Nếu hoàn thanh nhập liệu hoặc giá trị mặc định là 0
        if isInputCompleted || results.text == "0" {
            // thay thế giá trị bằng số mới
            results.text = number
            isInputCompleted = false
        } else {
            // Nối số mới vào giá trị hiện tại
            results.text! += number
        }
    }
    
    
    // Xử lý đặt các phép toán
    func setOperation(_ operation: String) {
        // chuyển giá trị hiện tại sang kiểu số
        firstNumber = Double(results.text ?? "0") ?? 0
        // lưu phép toán hiện tại
        currentOperation = operation
        isInputCompleted = true
    }
    
    // thực hiện các phép toán
    func calculate() {
        // kiểm tra và chuyển đổi giá trị thứ hai sáng số
        guard let currentText = results.text,
              let secondValue = Double(currentText) else { return }
        // thực hiện phép tính đã chọn
        var result: Double = 0
        switch currentOperation {
        case "+": result = firstNumber + secondValue
        case "-": result = firstNumber - secondValue
        case "*": result = firstNumber * secondValue
        case "/": result = secondValue != 0 ? firstNumber / secondValue : 0
        default: result = secondValue // nếu không có phép toán, lấy giá trị thứ hai
        }
        // hiển thị kết quả
        results.text = String(result)
        isInputCompleted = true
        currentOperation = ""
    }
    
    
    // xoá tất cả
    @IBAction func clear(_ sender: Any) {
        results.text = "0"
        firstNumber = 0
        currentOperation = ""
        isInputCompleted = false
    }
    // phương thức đổi đấu
    @IBAction func changeSign(_ sender: Any) {
        guard var currentValue = Double(results.text ?? "0") else { return }
        currentValue = -currentValue
        results.text = String(currentValue)
    }
    
    // xoá ký tự cuối cùng
    @IBAction func deleteLast(_ sender: Any) {
        guard var text = results.text, text.count > 1 else {
            results.text = "0"
            return
        }
        text.removeLast()
        results.text = text
    }
    
    @IBAction func decimalPoint(_ sender: Any) {
        guard !(results.text?.contains(".") ?? false) else { return }
        results.text! += "."
    }
    
    @IBAction func operationPlus(_ sender: Any) {
        setOperation("+")
    }
    @IBAction func operationMinus(_ sender: Any) {
        setOperation("-")
    }
    @IBAction func operationMultiply(_ sender: Any) {
        setOperation("*")
    }
    @IBAction func operationDivide(_ sender: Any) {
        setOperation("/")
    }
    @IBAction func equals(_ sender: Any) {
        calculate()
    }
    
    // THÊM CÁC SỐ
    @IBAction func number0(_ sender: Any) {
        addNumber("0")
    }
    
    @IBAction func number1(_ sender: Any) {
        addNumber("1")
    }
    
    @IBAction func number2(_ sender: Any) {
        addNumber("2")
    }
    @IBAction func number3(_ sender: Any) {
        addNumber("3")
    }
    @IBAction func number4(_ sender: Any) {
        addNumber("4")
    }
    @IBAction func number5(_ sender: Any) {
        addNumber("5")
    }
    @IBAction func number6(_ sender: Any) {
        addNumber("6")
    }
    @IBAction func number7(_ sender: Any) {
        addNumber("7")
    }
    @IBAction func number8(_ sender: Any) {
        addNumber("8")
    }
    @IBAction func number9(_ sender: Any) {
        addNumber("9")
    }
}



