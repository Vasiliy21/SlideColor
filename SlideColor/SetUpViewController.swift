//
//  ViewController.swift
//  SlideColor
//
//  Created by Vasiliy on 26.06.2022.
//

import UIKit

class SetUpViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var RGBView: UIView!
    
    @IBOutlet var redValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!

    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!

    // MARK: - Public Properties
    var delegate: SetUpViewControllerDelegate!
    var viewColor: UIColor!
    
    // MARK: - View Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        RGBView.backgroundColor = viewColor

        RGBView.layer.cornerRadius = 10

        setValue(for: redSlider, greenSlider, blueSlider)
        setValue(for: redValue, greenValue, blueValue)
        setValue(for: redTextField, greenTextField, blueTextField)

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    // MARK: - IB Actions
    @IBAction func slidersAction(_ sender: UISlider) {
        switch sender {
        case redSlider:
            setValue(for: redValue)
            setValue(for: redTextField)
        case greenSlider:
            setValue(for: greenValue)
            setValue(for: greenTextField)
        default:
            setValue(for: blueValue)
            setValue(for: blueTextField)
        }
        setColor()
    }

    @IBAction func doneButtonPressed() {
        delegate?.setColor(RGBView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
}
// MARK: - Private Methods
extension SetUpViewController {
    private func setColor() {
        RGBView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }

    private func setValue(for colorSliders: UISlider...) {
        let ciColor = CIColor(color: viewColor )
        colorSliders.forEach { slider in
            switch slider {
            case redSlider: redSlider.value = Float(ciColor.red)
            case greenSlider: greenSlider.value = Float(ciColor.green)
            default: blueSlider.value = Float(ciColor.blue)
            }
        }
    }

    private func setValue(for colorLabels: UILabel...) {
        colorLabels.forEach { label in
            switch label {
            case redValue: label.text = string(from: redSlider)
            case greenValue: label.text = string(from: greenSlider)
            default: label.text = string(from: blueSlider)
            }
        }
    }

    private func setValue(for colorTextField: UITextField...) {
        colorTextField.forEach { textField in
            switch textField {
            case redTextField: textField.text = string(from: redSlider)
            case greenTextField: textField.text = string(from: greenSlider)
            default: textField.text = string(from: blueSlider)
            }
        }

    }

    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }

    @objc private func didTapDone() {
        view.endEditing(true)
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
// MARK: - UITextFieldDelegate
extension SetUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }

    func textFieldDidEndEditing(_ textField: UITextField) {

        guard let text = textField.text else {return}

        if let currentValue = Float(text) {
            switch textField {
            case redTextField:
                redSlider.setValue(currentValue, animated: true)
                setValue(for: redValue)
            case greenTextField:
                greenSlider.setValue(currentValue, animated: true)
                setValue(for: greenValue)
            default:
                blueSlider.setValue(currentValue, animated: true)
                setValue(for: blueValue)
            }
            setColor()
            return
        }
        showAlert(title: "Wrong format!", message: "Please enter correct value")
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        let keyboardToolBar = UIToolbar()
        keyboardToolBar.sizeToFit()
        textField.inputAccessoryView = keyboardToolBar

        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(didTapDone)
        )

        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )

        keyboardToolBar.items = [flexBarButton, doneButton]
    }
}
