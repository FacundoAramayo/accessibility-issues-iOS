//
//  HomeViewController.swift
//  AccesibilityIssues
//
//  Created by Facundo Aramayo on 06/08/2024.
//

import UIKit

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        let titleLabel = UILabel()
        titleLabel.text = NSLocalizedString("welcome_to_finance_app", comment: "")
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let subtitleLabel = UILabel()
        subtitleLabel.text = NSLocalizedString("your_financial_companion", comment: "")
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 2
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView = UIImageView(image: UIImage(named: "finance"))
        imageView.accessibilityLabel = NSLocalizedString("financial_strategy", comment: "")
        imageView.isAccessibilityElement = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let longTextLabel = UILabel()
        longTextLabel.text = String(format: NSLocalizedString("terms_and_conditions", comment: ""), "15%")
        longTextLabel.font = UIFont.preferredFont(forTextStyle: .body)
        longTextLabel.textColor = .gray
        longTextLabel.numberOfLines = 0
        longTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let actionButton = UIButton(type: .system)
        actionButton.setTitle(NSLocalizedString("go", comment: ""), for: .normal)
        actionButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        actionButton.accessibilityLabel = NSLocalizedString("go_to_subscribe_form", comment: "")
        actionButton.addTarget(self, action: #selector(goToForm), for: .touchUpInside)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(imageView)
        view.addSubview(longTextLabel)
        view.addSubview(actionButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 380),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subtitleLabel.widthAnchor.constraint(equalToConstant: 380),
            
            imageView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 330),
            imageView.heightAnchor.constraint(equalToConstant: 330),
            
            longTextLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            longTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            longTextLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            actionButton.topAnchor.constraint(equalTo: longTextLabel.bottomAnchor, constant: 20),
            actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func goToForm() {
        let formViewController = FormViewController()
        let navigationController = UINavigationController(rootViewController: formViewController)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
    }
}
