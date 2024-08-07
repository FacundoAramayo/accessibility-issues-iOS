//
//  FormViewController.swift
//  AccesibilityIssues
//
//  Created by Facundo Aramayo on 06/08/2024.
//

import UIKit

class FormViewController: UIViewController {
    
    private let nameTextField = UITextField()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupForm()
    }
    
    private func setupForm() {
        let titleLabel = UILabel()
        titleLabel.text = NSLocalizedString("subscribe_to_get_discounts", comment: "")
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let subtitleLabel = UILabel()
        subtitleLabel.text = NSLocalizedString("complete_the_form", comment: "")
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 2
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        
        let stackView = UIStackView(arrangedSubviews: [nameTextField, emailTextField, passwordTextField])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        nameTextField.placeholder = NSLocalizedString("name", comment: "")
        emailTextField.placeholder = NSLocalizedString("email", comment: "")
        passwordTextField.placeholder = NSLocalizedString("password", comment: "")
        passwordTextField.isSecureTextEntry = true
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 330),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subtitleLabel.widthAnchor.constraint(equalToConstant: 380),
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        let submitButton = UIButton(type: .system)
        submitButton.setTitle(NSLocalizedString("submit", comment: ""), for: .normal)
        submitButton.addTarget(self, action: #selector(submitForm), for: .touchUpInside)
        
        view.addSubview(submitButton)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            submitButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func submitForm() {
        // Handle form submission
        goBack()
    }
    
    
     @objc private func goBack() {
         dismiss(animated: true, completion: nil)
     }
     
}
