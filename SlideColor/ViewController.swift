//
//  ViewController.swift
//  SlideColor
//
//  Created by Vasiliy on 26.06.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var RGBView: UIView!

    @IBOutlet var redValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var blueValue: UILabel!

    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        RGBView.layer.cornerRadius = 10
    }

    // MARK: - Private Methods
    private func setupValues() {
        redValue.text = String(redSlider.value)
        greenValue.text = String(greenSlider.value)
        blueValue.text = String(blueSlider.value)
    }
}

