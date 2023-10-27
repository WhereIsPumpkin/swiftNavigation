//
//  ViewController.swift
//  AssignmentNavigation
//
//  Created by Saba Gogrichiani on 27.10.23.
//

import UIKit

class ViewController: UIViewController {
    
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createVerticalStackView()
    }
    
    func createVerticalStackView() {
        let mainStackView = createMainStackView()
        
        let nestedStackView = createNestedStackView()
        mainStackView.addArrangedSubview(nestedStackView)
        
        let formStackView = createFormStackView()
        mainStackView.addArrangedSubview(formStackView)
        
        let signInButton = signInButton()
        mainStackView.addArrangedSubview(signInButton)
        
        let otherSignInMethod = otherSignMethodStackView()
        mainStackView.addArrangedSubview(otherSignInMethod)
        
        let createNewAccLabel = createAccountLabel()
        mainStackView.addArrangedSubview(createNewAccLabel)
        
        self.view.addSubview(mainStackView)
        
        // Set up constraints
        setupMainStackViewConstraints(mainStackView)
    }
    
    func createMainStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 28
        stackView.isLayoutMarginsRelativeArrangement = true
        let screenHeight = UIScreen.main.bounds.height
           let topAndBottomMargin: CGFloat
           if screenHeight <= 812.0 {
               topAndBottomMargin = 12.0
           } else {
               topAndBottomMargin = 45.0
           }

           stackView.layoutMargins = UIEdgeInsets(top: topAndBottomMargin, left: 50.5, bottom: topAndBottomMargin, right: 50.5)
        return stackView
    }
    
    func createNestedStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 15
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "avatar")
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 160)
        ])
        stackView.addArrangedSubview(imageView)
        
        let signInLabel = UILabel()
        signInLabel.text = "Sign In"
        signInLabel.font = UIFont(name: "Inter-Regular_Bold", size: 28)
        stackView.addArrangedSubview(signInLabel)
        
        return stackView
    }
    
    func createFormStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 15
        
        let borderColor = UIColor(red: 178/255, green: 178/255, blue: 178/255, alpha: 64/255)
        
        emailTextField.placeholder = "Email"
        emailTextField.layer.cornerRadius = 16
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = borderColor.cgColor
        emailTextField.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        emailTextField.setLeftPaddingPoints(16)
        NSLayoutConstraint.activate([
            emailTextField.heightAnchor.constraint(equalToConstant: 53)
        ])
        stackView.addArrangedSubview(emailTextField)

        passwordTextField.placeholder = "Password"
        passwordTextField.layer.cornerRadius = 16
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = borderColor.cgColor
        passwordTextField.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.setLeftPaddingPoints(16)
        NSLayoutConstraint.activate([
            passwordTextField.heightAnchor.constraint(equalToConstant: 53)
        ])
        stackView.addArrangedSubview(passwordTextField)

        
        let forgotPasswordButton = UIButton(type: .system)
        forgotPasswordButton.setTitle("Forgot Your Password?", for: .normal)
        forgotPasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        forgotPasswordButton.setTitleColor(UIColor(red: 95/255, green: 95/255, blue: 95/255, alpha: 1), for: .normal)
        forgotPasswordButton.contentHorizontalAlignment = .right
        stackView.addArrangedSubview(forgotPasswordButton)

        return stackView
    }
    
    func signInButton() -> UIButton {
            let signInButton = UIButton()
            signInButton.setTitle("Sign In", for: .normal)
            signInButton.layer.cornerRadius = 16
            signInButton.backgroundColor = UIColor(red: 34/255.0, green: 87/255.0, blue: 122/255.0, alpha: 1.0)
            signInButton.titleLabel?.font = UIFont(name: "Inter-Regular_Medium", size: 15)
            NSLayoutConstraint.activate([
                signInButton.heightAnchor.constraint(equalToConstant: 45)
            ])

            // Add a target action to handle the button click
            signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)

            return signInButton
        }
    
    @objc func signInButtonTapped() {
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            // Show an error alert
            let alert = UIAlertController(title: "Error", message: "Email and Password should not be empty.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
            return
        }

        let homepageVC = HomePageViewController()
        self.navigationController?.pushViewController(homepageVC, animated: true)
    }

    
    func otherSignMethodStackView() -> UIView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 14
        
        // add or divider
        let divider = createDividerWithLabel()
        stackView.addArrangedSubview(divider)
        
        // add icons view
        let iconsView = iconView()
        stackView.addArrangedSubview(iconsView)
        
        
        
        return stackView
    }
    
    func createDividerWithLabel() -> UIStackView {
        // Create the stack view
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center

        // Create the lines
        let line1 = UIView()
        line1.backgroundColor = .gray
        line1.heightAnchor.constraint(equalToConstant: 1).isActive = true

        let line2 = UIView()
        line2.backgroundColor = .gray
        line2.heightAnchor.constraint(equalToConstant: 1).isActive = true

        // Create the label
        let label = UILabel()
        label.text = "Or"
        label.textColor = .gray

        // Add the lines and label to the stack view
        stackView.addArrangedSubview(line1)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(line2)

        // Add constraints to the lines
        NSLayoutConstraint.activate([
            line1.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.4),
            line2.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.4)
        ])

        return stackView
    }
    
    func iconView() -> UIView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing

        // Create buttons with icons
        let iconNames = ["FaceBook", "Google", "LinkedIn"]

        for iconName in iconNames {
            let icon = createIcon(named: iconName)
            stackView.addArrangedSubview(icon)
        }
        
        stackView.isLayoutMarginsRelativeArrangement = true
            stackView.layoutMargins = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50)
        
        return stackView
    }
    
    func createIcon(named: String) -> UIImageView {
        let icon = UIImageView()
        icon.image = UIImage(named: named)
        NSLayoutConstraint.activate([
            icon.heightAnchor.constraint(equalToConstant: 50),
            icon.widthAnchor.constraint(equalToConstant: 50)
        ])
        return icon
    }
    
    func createAccountLabel() -> UILabel {
        let signupText = UILabel()
        signupText.text = "Don’t have an account.Sign Up"
        signupText.textAlignment = .center
        signupText.textColor = UIColor(red: 95/255, green: 95/255, blue: 95/255, alpha: 1)
        
        return signupText
    }

    func setupMainStackViewConstraints(_ mainStackView: UIStackView) {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// textfield paddingისთვის
extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

#Preview("ViewController"){
    ViewController()
}
