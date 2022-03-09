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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = userNameTextField.text
    }
    
    @IBAction func logInTappedButton() {
        guard let inputLogin = userNameTextField.text,
              !inputLogin.isEmpty,
              userNameTextField.text == "Swift",
              passwordTextField.text == "qwe"
        else {
            showAlert(
                with: "Invalid login or password",
                and: "Please, enter correct login and password"
            )
            return
        }
    }
    
    @IBAction func forgotUserNameTappedButton() {
        showAlert(with: "Oops!", and: "Your name is Swift 😉")
        userNameTextField.text = ""
    }
    
    @IBAction func forgotPasswordTappedButton() {
        showAlert(with: "Oops!", and: "Your password is qwe 😉")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
}

// MARK: - Private Methods
extension LoginViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logInTappedButton()
            performSegue(withIdentifier: "goToWelcomeVC", sender: nil)
        }
        return true
    }
}
