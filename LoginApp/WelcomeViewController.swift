//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Alexey on 09.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeUserLabel: UILabel!
    
    var userName: String?
    
    private let firstColor = UIColor(
        red: 252 / 255,
        green: 70 / 255,
        blue: 107 / 255,
        alpha: 1.0
    )
    
    private let secondColor = UIColor(
        red: 63 / 255,
        green: 94 / 255,
        blue: 251 / 255,
        alpha: 1.0
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientLayer(firstColor: firstColor, secondColor: secondColor)
        guard let userName = userName else { return }
        welcomeUserLabel.text = "Welcome, \(userName)!"
    }
}

// MARK: Set background color
extension UIView {
    func setGradientLayer(firstColor: UIColor, secondColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [firstColor.cgColor, secondColor.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}
