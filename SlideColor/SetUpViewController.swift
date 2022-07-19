//
//  ViewController.swift
//  SlideColor
//
//  Created by Vasiliy on 26.06.2022.
//

import UIKit

class SetUpViewController: UIViewController {
    
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

    var RGB = UIColor()

    override func viewDidLoad() {
        super.viewDidLoad()
        RGBView.backgroundColor = RGB
        RGBView.layer.cornerRadius = 10
        setColour()
        setLabels()
    }
    
    @IBAction func slidersAction() {
        setColour()
        setLabels()
    }
    
    // MARK: - Private Methods

    private func setColour() {
        RGBView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
        RGB = RGBView.backgroundColor!
    }

    private func setLabels() {
        redValue.text = String(format: "%.2f", redSlider.value)
        greenValue.text = String(format: "%.2f", greenSlider.value)
        blueValue.text = String(format: "%.2f", blueSlider.value)
    }
}

