//
//  LoginViewController.swift
//  WeatherApp
//
//  Created by Hrayr Yeghiazaryan on 02/03/2019.
//  Copyright © 2019 Hrayr Yeghiazaryan. All rights reserved.
//

import UIKit
import MBProgressHUD

class LoginViewController: UIViewController {

    // MARK: - Variables
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var emailDescriptionLabel: UILabel!
    @IBOutlet weak var passwordDescriptionLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!

    // MARK: - Constraints
    @IBOutlet weak var emailTopConstraint: NSLayoutConstraint!
    private var defaultTopConstraint: CGFloat!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureNotifications()
        defaultTopConstraint = emailTopConstraint.constant
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

// MARK: - View's configuration
extension LoginViewController {

    func setupView() {
        configureNavigationBar()
        configureForgotPasswordButton()
        configureDescriptionLabelsAttributedText()
        configureTextFieldsAttributedText()
        configureButtonsAttributedText()
        setupGestureRecognizer()
    }

    func configureNavigationBar() {
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.barTintColor = .white
        navigationItem.titleView = createNavigationTitleView()
    }

    func createNavigationTitleView() -> UIView {
        let navigationTitleView = UILabel()
        navigationTitleView.attributedText = FontManager.getTextWith(letterSpacing: UIConstants.navigationTitleLetterSpacing,
                                                                     lineHeight: 0,
                                                                     text: UIConstants.loginNavigationTitle,
                                                                     fontName: UIConstants.textMediumFont,
                                                                     textSize: UIConstants.navigationTitleTextize)
        return navigationTitleView
    }

    func setupGestureRecognizer() {
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(resignAllRespondersAndResetTopPosition))
        view.addGestureRecognizer(tap)
    }

    func configureForgotPasswordButton() {
        forgotPasswordButton.layer.borderWidth = 0.5
        forgotPasswordButton.layer.borderColor = UIConstants.forgotPasswordBorderColor.cgColor
        if let titleLabel = forgotPasswordButton.titleLabel, let text = titleLabel.text {
            let attributedString = FontManager.getTextWith(letterSpacing: UIConstants.fogortPasswordLetterSpacing,
                                                                          lineHeight: UIConstants.forgotPasswordButtonLineSpacing,
                                                                          text: text,
                                                                          fontName: UIConstants.textRegularFont,
                                                                          textSize: UIConstants.forgotPasswordButtonTextSize)
            forgotPasswordButton.setAttributedTitle(attributedString, for: .normal)
        }
    }

    func configureDescriptionLabelsAttributedText() {
        if let emailText = emailDescriptionLabel.text, let passwordText = passwordDescriptionLabel.text {
            emailDescriptionLabel.attributedText = FontManager.getTextWith(letterSpacing: UIConstants.descriptionLabelLetterSpacing,
                                                                                          lineHeight: UIConstants.descriptionLabelLineSpacing,
                                                                                          text: emailText,
                                                                                          fontName: UIConstants.textRegularFont,
                                                                                          textSize: UIConstants.descriptionLabelTextSize)
            passwordDescriptionLabel.attributedText = FontManager.getTextWith(letterSpacing: UIConstants.descriptionLabelLetterSpacing,
                                                                                          lineHeight: UIConstants.descriptionLabelLineSpacing,
                                                                                          text: passwordText,
                                                                                          fontName: UIConstants.textRegularFont,
                                                                                          textSize: UIConstants.descriptionLabelTextSize)
        }
    }

    func configureTextFieldsAttributedText() {
        if let text = emailTextField.text {
            emailTextField.attributedText = FontManager.getTextWith(letterSpacing: UIConstants.textFieldLetterSpacing,
                                                                    lineHeight: 0,
                                                                    text: text,
                                                                    fontName: UIConstants.textRegularFont,
                                                                    textSize: UIConstants.textFieldTextSize)
        }
        if let text = passwordTextField.text {
            passwordTextField.attributedText = FontManager.getTextWith(letterSpacing: UIConstants.textFieldLetterSpacing,
                                                                       lineHeight: 0,
                                                                       text: text,
                                                                       fontName: UIConstants.textRegularFont,
                                                                       textSize: UIConstants.textFieldTextSize)
        }
    }

    func configureButtonsAttributedText() {
        if let titleLabel = loginButton.titleLabel, let text = titleLabel.text {
            let attributedString = FontManager.getTextWith(letterSpacing: UIConstants.loginButtonLetterSpacing,
                                                           lineHeight: 0,
                                                           text: text,
                                                           fontName: UIConstants.textMediumFont,
                                                           textSize: UIConstants.buttonTextSize)
            loginButton.setAttributedTitle(attributedString, for: .normal)
        }
        if let titleLabel = createAccountButton.titleLabel, let text = titleLabel.text {
            let attributedString = FontManager.getTextWith(letterSpacing: UIConstants.createAccountLetterSpacing,
                                                           lineHeight: UIConstants.newAccountButtonLineSpacing,
                                                           text: text, fontName: UIConstants.textRegularFont,
                                                           textSize: UIConstants.buttonTextSize)
            createAccountButton.setAttributedTitle(attributedString, for: .normal)
        }
    }

    func getCorrectDescriptionOfWeather(temperature: NSNumber) -> String {
        var temperatureString = temperature.stringValue
        if temperature.intValue > 0 {
            temperatureString = "+" + temperatureString
        }
        temperatureString = temperatureString + UIConstants.additionalText
        return temperatureString
    }

}

// MARK: - Actions
extension LoginViewController {

    @IBAction func loginButtonTapped(_ sender: Any) {
        let isValidEmail = ValidationManager.isValidEmail(address: emailTextField.text)
        let params = ValidationManager.isValidPassword(pass: passwordTextField.text)
        let isValidPassword = params.valid
        let errorType = params.type
        resignAllRespondersAndResetTopPosition()
        if isValidEmail {
            if isValidPassword {
                if NetworkManager.shared.isNetworkReachable() {
                    let apiService = APIService()
                    MBProgressHUD.showAdded(to: view, animated: true)
                    apiService.getWeatherData { (response) in
                        MBProgressHUD.hide(for: self.view, animated: true)
                        if let weatherResponse = response, let temperature = weatherResponse.temperature as NSNumber? {
                            let temperatureString = self.getCorrectDescriptionOfWeather(temperature: temperature)
                            self.showAlertWithErrorType(.none, temperatureString)
                        } else {
                            self.showAlertWithErrorType(.connectionFailed, "")
                        }
                    }
                } else {
                    self.showAlertWithErrorType(.connectionFailed, "")
                }
            } else {
                showAlertWithErrorType(errorType, "")
            }
        } else {
            showAlertWithErrorType(.incorrectEmail, "")
        }
    }

    func showAlertWithErrorType(_ errorType: ErrorType, _ message: String) {
        let alert = AlertManager.getAlertWithDefaultButton(message: message, errorType: errorType)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }

    @objc func resignAllRespondersAndResetTopPosition() {
        view.endEditing(true)
        emailTopConstraint.constant = defaultTopConstraint
    }
}

// MARK: - Notifications handler
extension LoginViewController {

    func configureNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(_ :)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(_ :)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }

    @objc func keyboardWillShow(_ notification: Notification) {
        adjustViewPosition(shouldShowKeyboard: true, notification: notification)
    }

    @objc func keyboardWillHide(_ notification: Notification) {
        adjustViewPosition(shouldShowKeyboard: false, notification: notification)
    }

    func adjustViewPosition(shouldShowKeyboard: Bool, notification: Notification) {
        guard let userInfo = (notification as NSNotification).userInfo,
            let keyboardFrame: CGRect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            else {
                return
        }
        let animationDurarion = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval ?? 0.3
        let intersect = keyboardFrame.intersects(createAccountButton.frame)
        if shouldShowKeyboard, intersect {
            emailTopConstraint.constant -= keyboardFrame.height / 2
        } else {
            emailTopConstraint.constant = defaultTopConstraint
        }
        UIView.animate(withDuration: animationDurarion) {
            self.view.layoutIfNeeded()
        }
    }

}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        emailTopConstraint.constant = defaultTopConstraint
        return true
    }
    
}
