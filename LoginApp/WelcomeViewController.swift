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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let userName = self.userName else { return }
        welcomeUserLabel.text = "Welcome, \(userName)!"

        let colorBackgroundOne = UIColor(red: 252 / 255, green: 70 / 255, blue: 107 / 255, alpha: 1.0).cgColor
        let colorBackgroundTwo = UIColor(red: 63 / 255, green: 94 / 255, blue: 251 / 255, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [colorBackgroundOne, colorBackgroundTwo]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    @IBAction func logOutTappedButton() {
        dismiss(animated: true)
    }
    
}
