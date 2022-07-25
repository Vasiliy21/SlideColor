//
//  MainViewController.swift
//  SlideColor
//
//  Created by Vasiliy on 19.07.2022.
//

import UIKit

protocol SetUpViewControllerDelegate {
    func setColor(_ color: UIColor)
}

class MainViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let setUpVC = segue.destination as? SetUpViewController else {return}
        setUpVC.delegate = self
        setUpVC.viewColor = view.backgroundColor
    }
}

// MARK: - ColorDelegate
extension MainViewController: SetUpViewControllerDelegate {
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}

