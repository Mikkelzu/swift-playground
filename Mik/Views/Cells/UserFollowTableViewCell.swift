//
//  UserFollowTableViewCell.swift
//  Mik
//
//  Created by Michael on 18/09/2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import UIKit

class UserFollowTableViewCell: UITableViewCell {

    static let identifier = "UserFollowTableViewCell"
    
    public weak var delegate: userFollowTableViewCellDelegate?
    
    private var model: UserRelation?
    
    private let profileImageView: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.backgroundColor = .secondarySystemBackground
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.text = "Michael 🇫🇮🇸🇪"
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .secondaryLabel
        label.text = "@mikku"
        return label
    }()
    
    private let followButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .link
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        contentView.clipsToBounds = true
        
        contentView.addSubview(profileImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(followButton)
        
        followButton.addTarget(self, action: #selector(didTapFollowButton), for: .touchUpInside)
    }
    
    @objc private func didTapFollowButton() {
        guard let model = model else {
            return
        }
        delegate?.didTapFollowToggleButton(model: model)
    }
    
    public func configure(model: UserRelation) {
        
        self.model = model
        
        nameLabel.text = model.name
        usernameLabel.text = model.username
        
        if (model.type == UserFollowState.following) {
            followButton.setTitle("Unfollow", for: .normal)
            followButton.backgroundColor = .systemBackground
            followButton.layer.borderWidth = 1
            followButton.layer.borderColor = UIColor.label.cgColor
            followButton.setTitleColor(.label, for: .normal)
        } else {
            followButton.setTitle("Follow", for: .normal)
            followButton.backgroundColor = .systemBlue
            followButton.layer.borderWidth = 0
            followButton.setTitleColor(.white, for: .normal)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        profileImageView.frame = CGRect(x: 3, y: 3, width: contentView.height - 6, height: contentView.height - 6)
        profileImageView.layer.cornerRadius = profileImageView.height / 2.0
        
        let buttonWidth = contentView.width > 500 ? 220 : contentView.width / 3
        
        followButton.frame = CGRect(x: contentView.width - 5 - buttonWidth, y: (contentView.height - 40) / 2 , width: buttonWidth, height: 40)
        
        let labelHeight = contentView.height / 2
        let labelWidth = contentView.width - 8 - profileImageView.width - buttonWidth
        let imageRightMargin = profileImageView.right + 5
        
        nameLabel.frame = CGRect(x: imageRightMargin, y: 0, width: labelWidth, height: labelHeight)
        usernameLabel.frame = CGRect(x: imageRightMargin, y: nameLabel.bottom, width: labelWidth, height: labelHeight)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        profileImageView.image = nil
        nameLabel.text = nil
        usernameLabel.text = nil
        followButton.setTitle(nil, for: .normal)
        followButton.backgroundColor = nil
        followButton.layer.borderWidth = 0
    }
}
