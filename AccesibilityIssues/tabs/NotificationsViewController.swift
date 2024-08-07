//
//  NotificationsViewController.swift
//  AccesibilityIssues
//
//  Created by Facundo Aramayo on 06/08/2024.
//

import UIKit

class NotificationsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableView = UITableView()
        let notifications = [
            (String(format: NSLocalizedString("discount_voucher", comment: ""), "15%"), "01/08/2024", String(format: NSLocalizedString("terms_and_conditions", comment: ""), "15%"), true),
            (String(format: NSLocalizedString("discount_voucher", comment: ""), "9%"), "01/07/2024", String(format: NSLocalizedString("terms_and_conditions", comment: ""), "9%"), false),
            (NSLocalizedString("refer_a_friend", comment: ""), "12/06/2024", NSLocalizedString("refer_a_friend_description", comment: ""), true),
            (NSLocalizedString("welcome_to_finance_app", comment: ""), "12/06/2024", NSLocalizedString("your_financial_companion", comment: ""), false)
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        let titleLabel = UILabel()
        titleLabel.text = NSLocalizedString("notifications_tab", comment: "")
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let subtitleLabel = UILabel()
        subtitleLabel.text = NSLocalizedString("check_your_messages", comment: "")
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 2
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 380),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subtitleLabel.widthAnchor.constraint(equalToConstant: 380),
            
            tableView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let notification = notifications[indexPath.row]
        
        let titleLabel = UILabel()
        titleLabel.text = notification.0
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        let dateLabel = UILabel()
        dateLabel.text = notification.1
        
        let contentLabel = UILabel()
        contentLabel.text = notification.2
        contentLabel.numberOfLines = 3
        
        cell.contentView.addSubview(titleLabel)
        cell.contentView.addSubview(dateLabel)
        cell.contentView.addSubview(contentLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        
       
        
        if notification.3 {
            let actionButton = UIButton(type: .system)
            actionButton.setTitle(NSLocalizedString("go", comment: ""), for: .normal)
            actionButton.addTarget(self, action: #selector(goToForm), for: .touchUpInside)
            cell.contentView.addSubview(actionButton)
            actionButton.translatesAutoresizingMaskIntoConstraints = false
            
            let constraints = [
                titleLabel.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 10),
                titleLabel.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 10),
                dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
                dateLabel.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 10),
                contentLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5),
                contentLabel.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 10),
                contentLabel.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -10),
                actionButton.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 10),
                actionButton.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 10),
                actionButton.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -10),
                actionButton.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: -10)
            ]
            NSLayoutConstraint.activate(constraints)
        } else {
            let constraints = [
                titleLabel.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 10),
                titleLabel.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 10),
                dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
                dateLabel.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 10),
                contentLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5),
                contentLabel.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 10),
                contentLabel.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -10),
                contentLabel.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: -10)
            ]
            NSLayoutConstraint.activate(constraints)
        }
        
        return cell
    }
    
    @objc private func goToForm() {
        let formViewController = FormViewController()
        let navigationController = UINavigationController(rootViewController: formViewController)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
    }
}
