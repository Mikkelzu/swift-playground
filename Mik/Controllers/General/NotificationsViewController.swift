//
//  NotificationsViewController.swift
//  Mik
//
//  Created by Michael on 14/09/2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import UIKit

final class NotificationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let table = UITableView()
        
        table.register(NotificationLikeEventTableViewCell.self, forCellReuseIdentifier: NotificationLikeEventTableViewCell.identifier)
        
        table.register(NotificationFollowEventTableViewCell.self, forCellReuseIdentifier: NotificationFollowEventTableViewCell.identifier)
        
        return table
    }()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.tintColor = .label
        return spinner
    }()
    
    private lazy var noNotificationsView = NoNotificationsView()
    
    private var models = [UserNotification]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchNotifications()
        
        AuthManager.shared.handleNotAuthenticated(vc: self)
        navigationItem.title = "Notifications"
        view.backgroundColor = .systemBackground
        
        view.addSubview(spinner)
        //spinner.startAnimating()
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
        spinner.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        spinner.center = view.center
    }
    
    private func fetchNotifications() {
        for x in 0...100 {
            let p = UserPost(
            identifier: "test",
            postType: UserPostType.photo,
            thumbnailImage: URL(string: "https://www.google.com")!,
            caption: "Haha this is a test!",
            likeCount: [],
            comments: [],
            postUrl: URL(string: "https://www.google.com")!,
            createdDate: Date(),
            taggedUsers: ["@lacien", "@jon"])
            
            let model = UserNotification(type: x % 2 == 0 ? .like(post: p) : .follow(state: x % 3 == 0 ? .following : .notFollowing), text: "followed you", user: User(
                    username: "lacien",
                    userId: "test",
                    name: ("Adam", "Test"),
                    dateOfBirth: Date(),
                    gender: Gender.male,
                    bio: "Test bio",
                    counts: UserCount(followers: 1, following: 1, posts: 1),
                    joinDate: Date(),
                    profilePic: URL(string: "https://www.google.com")!))
            
            models.append(model)
        }
        
        
    }
    
    private func noNotificationViewLayout() {
        tableView.isHidden = true
        
        view.addSubview(noNotificationsView)
        
        noNotificationsView.frame = CGRect(x: 0, y: 0, width: view.width / 2, height: view.width / 4)
        noNotificationsView.center = view.center
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        
        switch model.type {
        case .like(_):
            let cell = tableView.dequeueReusableCell(withIdentifier: NotificationLikeEventTableViewCell.identifier, for: indexPath) as! NotificationLikeEventTableViewCell
            
            cell.configure(model: model)
            cell.delegate = self
            
            return cell
        case .follow:
            let cell = tableView.dequeueReusableCell(withIdentifier: NotificationFollowEventTableViewCell.identifier, for: indexPath) as! NotificationFollowEventTableViewCell
            
            cell.configure(model: model)
            cell.delegate = self
            return cell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
}

extension NotificationsViewController: NotificationLikeEventTableViewCellDelegate {
    func didTapRelatedPostButton(model: UserNotification) {
        switch model.type {
        case .like(let post):
            let postViewController = PostViewController(model: post)
            postViewController.title = post.postType.rawValue
            postViewController.navigationItem.largeTitleDisplayMode = .never
            
            navigationController?.pushViewController(postViewController, animated: true)
        case .follow(_):
            fatalError("Dev Issue: should not be called")
            break;
        }
        //open post
        
    }
}

extension NotificationsViewController: NotificationFollowEventTableViewCellDelegate {
    func didTapFollowToggleButton(model: UserNotification) {
        print("followed user back")
        
        // perform db update
    }
    

}
