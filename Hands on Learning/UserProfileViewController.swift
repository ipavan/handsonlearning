//
//  UserProfileViewController.swift
//  Hands on Learning
//
//  Created by Pavan Sadarangani on 14/09/2022.
//

import UIKit

class UserProfileViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: IB Outlets
    
    @IBOutlet weak var userIDTextField: UITextField!
    @IBOutlet weak var colorAttributeTextField: UITextField!
    @IBOutlet weak var eventTextField: UITextField!
    @IBOutlet weak var productNameTextField: UITextField!
    @IBOutlet weak var productPriceTextField: UITextField!
    
    @IBOutlet weak var userIDLabel: UILabel!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var booleanValue: UISwitch!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var numericAttribute: Int = 5
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userIDTextField.delegate = self
        colorAttributeTextField.delegate = self
        eventTextField.delegate = self
        productNameTextField.delegate = self
        productPriceTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: Action Functions
    
    @IBAction func setUserID(_ sender: UIButton) {
        let userID = userIDTextField.text ?? ""
        
        //************************************************
        // SET YOUR BRAZE USER ID HERE
        
        
        
        //************************************************
    }
    
    @IBAction func setColorAttribute(_ sender: UIButton) {
        let favoriteColor = colorAttributeTextField.text ?? ""
        
        //************************************************
        // SET YOUR FAVORITE COLOR ATTRIBUTE HERE
        
        
        
        //************************************************
    }
    
    @IBAction func logCustomEvent(_ sender: UIButton) {
        let customEvent = eventTextField.text ?? ""

        //************************************************
        // SET YOUR CUSTOM EVENT HERE
        
        
        
        //************************************************
    }
    
    @IBAction func flushData(_ sender: UIButton) {
        //************************************************
        // FLUSH DATA HERE
        
        
        
        //************************************************
    }
    
    @IBAction func setNumericAttribute(_ sender: UIButton) {
        //************************************************
        // SET NUMERIC ATTRIBUTE HERE
        // User the variable numericAttribute
        
        
        
        //************************************************
    }
    
    @IBAction func setBooleanAttribute(_ sender: UIButton) {
        let booleanAttribute = booleanValue.isOn
        
        //************************************************
        // SET BOOLEAN ATTRIBUTE HERE
        
        
        
        //************************************************
    }
    
    @IBAction func logPurchase(_ sender: UIButton) {
        let productName = productNameTextField.text ?? ""
        let productPrice = Double(productPriceTextField.text ?? "0.0") ?? 0.0

        //************************************************
        // SET YOUR PURCHASE EVENT HERE
        
        
        
        //************************************************
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        numericAttribute = Int(sender.value)
        
        sliderLabel.text = "Current Value: \(numericAttribute)"
    }
    
    // MARK: Text Field Delegate Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    // MARK: Keyboard Handling
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        let userInfo: NSDictionary = notification.userInfo! as NSDictionary
        let keyboardInfo = userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue
        let keyboardSize = keyboardInfo.cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset = .zero
        scrollView.scrollIndicatorInsets = .zero
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
