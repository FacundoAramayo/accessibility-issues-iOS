//
//  DashboardViewController.swift
//  AccesibilityIssues
//
//  Created by Facundo Aramayo on 06/08/2024.
//

import UIKit

class DashboardViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        let titleLabel = UILabel()
        titleLabel.text = NSLocalizedString("dashboard_tab", comment: "")
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    
        let subtitleLabel = UILabel()
        subtitleLabel.text = NSLocalizedString("your_status", comment: "")
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 2
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let chartImageView = UIImageView(image: UIImage(named: "chart_save"))
        chartImageView.accessibilityLabel = NSLocalizedString("save_money_now", comment: "")
        chartImageView.accessibilityTraits = UIAccessibilityTraits.none
        chartImageView.isAccessibilityElement = true
        chartImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let iconImageView = UIImageView(image: UIImage(named: "discount"))
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
                
        let iconTextLabel = UILabel()
        iconTextLabel.text = NSLocalizedString("discount", comment: "")
        iconTextLabel.font = UIFont.preferredFont(forTextStyle: .body)
        iconTextLabel.isAccessibilityElement = false
        iconTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let iconTextStackView = UIStackView(arrangedSubviews: [iconImageView, iconTextLabel])
        iconTextStackView.axis = .horizontal
        iconTextStackView.spacing = 8
        iconTextStackView.alignment = .center
        iconTextStackView.isAccessibilityElement = true
        iconTextStackView.accessibilityLabel = String(format: NSLocalizedString("param_discount", comment: ""), "15%")
        iconTextStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let actionButton = UIButton(type: .system)
        actionButton.setTitle(NSLocalizedString("go", comment: ""), for: .normal)
        actionButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        actionButton.accessibilityLabel = NSLocalizedString("go_to_subscribe_form", comment: "")
        actionButton.addTarget(self, action: #selector(goToForm), for: .touchUpInside)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
    
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(chartImageView)
        view.addSubview(iconTextStackView)
        view.addSubview(actionButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 380),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subtitleLabel.widthAnchor.constraint(equalToConstant: 380),
            
            chartImageView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 150),
            chartImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chartImageView.widthAnchor.constraint(equalToConstant: 250),
            chartImageView.heightAnchor.constraint(equalToConstant: 250),
            
            iconTextStackView.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -20),
            iconTextStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            actionButton.topAnchor.constraint(equalTo: iconTextStackView.bottomAnchor, constant: 20),
            actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    @objc private func goToForm() {
        let formViewController = FormViewController()
        let navigationController = UINavigationController(rootViewController: formViewController)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
    }
}
