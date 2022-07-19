//
//  MainViewController.swift
//  SlideColor
//
//  Created by Vasiliy on 19.07.2022.
//

import UIKit

class MainViewController: UIViewController {

    private var RGB = UIColor(red: 1, green: 1, blue: 1, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = RGB
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let setUpVC = segue.destination as? SetUpViewController else {return}
        setUpVC.RGB = RGB
    }

    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        guard let setUpVC = unwindSegue.source as? SetUpViewController else {return}
        view.backgroundColor = setUpVC.RGB
        RGB = setUpVC.RGB


    }

}
