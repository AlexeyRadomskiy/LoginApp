//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Alexey on 09.03.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func logInTappedButton(_ sender: Any) {
        guard let inputLogin = userNameTextField.text, !inputLogin.isEmpty, userNameTextField.text == "Swift", passwordTextField.text == "qwe" else {
            showAlert(with: "Invalid login or password", and: "Please, enter correct login and password")
            return
        }
    }
    
    @IBAction func forgotUserNameTappedButton() {
        showAlert(with: "Oops!", and: "Your name is Swift")
    }
    
    @IBAction func forgotPasswordTappedButton() {
        showAlert(with: "Oops!", and: "Your password is qwe")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let user = segue.destination as? WelcomeViewController else { return }
        user.userName = userNameTextField.text
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.view.endEditing(true)
    }
}

// MARK: - Private Methods
extension LoginViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.userNameTextField.text = ""
            self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
