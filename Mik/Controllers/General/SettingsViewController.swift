//
//  SettingsViewController.swift
//  Mik
//
//  Created by Michael on 14/09/2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import SafariServices
import UIKit

final class SettingsViewController: UIViewController {
    
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return table
    }()
    
    private var data = [[SettingCellModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureModels()
        
        AuthManager.shared.handleNotAuthenticated(vc: self)
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
        
    }
    
    private func configureModels() {
        data.append([
            SettingCellModel(title: "Edit Profile") { [weak self] in
                self?.didTapEditProfile()
            },
            SettingCellModel(title: "Invite Friends") { [weak self] in
                self?.didTapInviteFriends()
            }
        ])
        
        data.append([
            SettingCellModel(title: "Terms of Service") { [weak self] in
                self?.didTapTerms()
            },
            SettingCellModel(title: "Privacy Policy") { [weak self] in
                self?.didTapPrivacy()
            },
            SettingCellModel(title: "Help") { [weak self] in
                self?.didTapHelp()
            },
            SettingCellModel(title: "About Maiven") { [weak self] in
                self?.didTapAbout()
            }
        ])
        
        data.append([
            SettingCellModel(title: "Logout") { [weak self] in
                self?.didTapLogOut()
            }
        ])
    }
    
    private func didTapEditProfile() {
        let vc = EditProfileViewController()
        
        vc.title = "Edit Profile"
        
        
        let navVC = UINavigationController(rootViewController: vc)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
    
    private func didTapInviteFriends() {
        
    }
    
    private func didTapTerms() {
        self.openURL(type: .terms)
    }
    
    private func didTapPrivacy() {
        self.openURL(type: .privacy)
        
    }
    
    private func didTapHelp() {
        self.openURL(type: .help)
        
    }
    
    private func didTapAbout() {
        
    }
    
    
    private func didTapLogOut() {
        
        let actionSheet = UIAlertController(title: "Log Out", message: "Do you want to log out?", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { _ in
            DispatchQueue.main.async {
                AuthManager.shared.logOut(completion: {success in
                    if success {
                        // show login
                        let loginVC = LoginViewController()
                        loginVC.modalPresentationStyle = .fullScreen
                        self.present(loginVC, animated: true) {
                            self.navigationController?.popToRootViewController(animated: false)
                            self.tabBarController?.selectedIndex = 0
                        }
                    } else {
                        // error
                        fatalError("Could not log out user")
                    }
                })
            }
        }))
        
        actionSheet.popoverPresentationController?.sourceView = tableView
        actionSheet.popoverPresentationController?.sourceRect = tableView.bounds
        
        present(actionSheet, animated: true)
        
    }
    
    private func openURL(type: SettingsURLType) {
        
        let urlString: String
        
        switch  type {
        case .terms: urlString = "https://help.instagram.com/478745558852511"
        case .privacy: urlString = "https://help.instagram.com/519522125107875"
        case .help: urlString = "https://help.instagram.com/"
        }
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
        
        
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = data[indexPath.section][indexPath.row]
        
        model.handler()
    }
}

