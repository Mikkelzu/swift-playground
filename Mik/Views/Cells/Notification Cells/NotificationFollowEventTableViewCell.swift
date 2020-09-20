//
//  NotificationFollowEventTableViewCell.swift
//  Mik
//
//  Created by Michael on 18/09/2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import UIKit


public class NotificationFollowEventTableViewCell: UITableViewCell {
    
    static let identifier = "NotificationFollowEventTableViewCell"
    
    weak var delegate: NotificationFollowEventTableViewCellDelegate?
    
    private var model: UserNotification?
    
    private let profileImageView: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.backgroundColor = .tertiarySystemBackground
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .label
        label.text = "@thor followed you"
        return label
    }()
    
    private let followButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.clipsToBounds = true
        
        contentView.addSubview(profileImageView)
        contentView.addSubview(label)
        contentView.addSubview(followButton)
        
        followButton.addTarget(self, action: #selector(didTapFollowToggleButton), for: .touchUpInside)
        
        selectionStyle = .none
    }
    
    @objc private func didTapFollowToggleButton() {
        guard let model = model else {
            return
        }
        
        delegate?.didTapFollowToggleButton(model: model)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        profileImageView.frame = CGRect(x: 3, y: 3, width: contentView.height - 6, height: contentView.height - 6)
        profileImageView.layer.cornerRadius = profileImageView.height / 2
        
        let size: CGFloat = 100
        let buttonHeight: CGFloat = 40
        
        followButton.frame = CGRect(x: contentView.width - 5 - size, y: (contentView.height - buttonHeight) / 2, width: 100, height: buttonHeight)
        
        label.frame = CGRect(x: profileImageView.right + 5, y: 0, width: contentView.width - size - profileImageView.width - 16, height: contentView.height)
        
    }
    
    public func configure(model: UserNotification) {
        self.model = model
        
        switch model.type {
        case.like(_):
            break
        case.follow(let state):
            if state == UserFollowState.following {
                followButton.setTitle("Unfollow", for: .normal)
                followButton.backgroundColor = .systemBackground
                followButton.layer.borderWidth = 1
                followButton.layer.borderColor = UIColor.secondaryLabel.cgColor
                followButton.setTitleColor(.label, for: .normal)
            } else {
                followButton.setTitle("Follow", for: .normal)
                followButton.backgroundColor = .systemBlue
                followButton.layer.borderWidth = 0
                followButton.setTitleColor(.white, for: .normal)
            }
            break
        }
        
        label.text = model.text
        profileImageView.sd_setImage(with: model.user.profilePic, completed: nil)
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        
        followButton.setTitle(nil, for: .normal)
        followButton.backgroundColor = nil
        followButton.layer.borderWidth = 0
        
        label.text = nil
        profileImageView.image = nil
    }
    
}
