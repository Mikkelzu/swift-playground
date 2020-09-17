//
//  ProfileInfoHeaderCollectionReusableView.swift
//  Mik
//
//  Created by Michael on 17/09/2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import UIKit

protocol ProfileInfoHeaderCollectionReusableViewDelegate: AnyObject {
    func profileHeaderDidTapPostButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapFollowersButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapFollowingButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapEditProfileButton(_ header: ProfileInfoHeaderCollectionReusableView)
}

final class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfileInfoHeaderCollectionReusableView"
    
    public weak var delegate: ProfileInfoHeaderCollectionReusableViewDelegate?
    
    private let profilePhotoImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .systemTeal
        image.layer.masksToBounds = true
        return image
    }()
    
    private let postsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Posts", for: .normal)
        button.backgroundColor = .secondarySystemBackground
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    private let followingButton: UIButton  = {
        let button = UIButton()
        button.setTitle("Following", for: .normal)
        button.backgroundColor = .secondarySystemBackground
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    private let followersButton: UIButton = {
        let button = UIButton()
        button.setTitle("Followers", for: .normal)
        button.backgroundColor = .secondarySystemBackground
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    private let editProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit your profile", for: .normal)
        button.backgroundColor = .secondarySystemBackground
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Michael 🇫🇮🇸🇪"
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.text = "iOS Engineer (noob), enjoyer of alcohol, burger master, pizza consumer, absolute fucking unit"
        label.textColor = .label
        label.numberOfLines = 0 //line wrap
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubViews()
        addButtonActions()
        
        backgroundColor = .systemBackground
        clipsToBounds = true
    }
    
    private func addSubViews() {
        addSubview(profilePhotoImageView)
        addSubview(postsButton)
        addSubview(followingButton)
        addSubview(followersButton)
        addSubview(nameLabel)
        addSubview(bioLabel)
        addSubview(editProfileButton)
    }
    
    private func addButtonActions() {
        followersButton.addTarget(self, action: #selector(didTapFollowersButton), for: .touchUpInside)
        followingButton.addTarget(self, action: #selector(didTapFollowingButton), for: .touchUpInside)
        editProfileButton.addTarget(self, action: #selector(didTapEditProfileButton), for: .touchUpInside)
        postsButton.addTarget(self, action: #selector(didTapPostsButton), for: .touchUpInside)
    }
    
    @objc private func didTapFollowersButton() {
        delegate?.profileHeaderDidTapFollowersButton(self)
    }
    
    @objc private func didTapFollowingButton() {
        delegate?.profileHeaderDidTapFollowingButton(self)
    }
    
    @objc private func didTapPostsButton() {
        delegate?.profileHeaderDidTapPostButton(self)
    }
    
    @objc private func didTapEditProfileButton() {
        delegate?.profileHeaderDidTapEditProfileButton(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let profilePhotoSize = width / 4
        let buttonHeight = profilePhotoSize / 2
        let countButtonWidth = (width - 10 - profilePhotoSize) / 3
        let bioLabelSize = bioLabel.sizeThatFits(frame.size)
        
        profilePhotoImageView.frame = CGRect(x: 5, y: 5, width: profilePhotoSize, height: profilePhotoSize).integral
        
        profilePhotoImageView.layer.cornerRadius = profilePhotoSize / 2.0
        
        postsButton.frame = CGRect(x: profilePhotoImageView.right, y: 5, width: countButtonWidth, height: buttonHeight).integral
        followersButton.frame = CGRect(x: postsButton.right, y: 5, width: countButtonWidth, height: buttonHeight).integral
        followingButton.frame = CGRect(x: followersButton.right, y: 5, width: countButtonWidth, height: buttonHeight).integral
        
        editProfileButton.frame = CGRect(x: profilePhotoImageView.right, y: 5 + buttonHeight, width: countButtonWidth * 3, height: buttonHeight).integral
        
        nameLabel.frame = CGRect(x: 5, y: 5 + profilePhotoImageView.bottom, width: width - 10, height: 50).integral
        
        bioLabel.frame = CGRect(x: 5, y: 5 + nameLabel.bottom, width: width - 10, height: bioLabelSize.height).integral
        
    }
    
}
