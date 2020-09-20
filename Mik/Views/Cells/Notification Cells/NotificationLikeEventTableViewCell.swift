//
//  NotificationLikeEventTableViewCell.swift
//  Mik
//
//  Created by Michael on 18/09/2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import UIKit
import SDWebImage

class NotificationLikeEventTableViewCell: UITableViewCell {
    
    static let identifier = "NotificationLikeEventTableViewCell"
    
    weak var delegate: NotificationLikeEventTableViewCellDelegate?
    
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
        label.text = "@lacien liked your photo"
        return label
    }()
    
    private let postButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "test"), for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.clipsToBounds = true
        
        contentView.addSubview(profileImageView)
        contentView.addSubview(label)
        contentView.addSubview(postButton)
        
        postButton.addTarget(self, action: #selector(didTapPostButton), for: .touchUpInside)
        selectionStyle = .none
    }
    
    @objc private func didTapPostButton() {
        guard let model = model else {
            return
        }
        
        delegate?.didTapRelatedPostButton(model: model)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        profileImageView.frame = CGRect(x: 3, y: 3, width: contentView.height - 6, height: contentView.height - 6)
        profileImageView.layer.cornerRadius = profileImageView.height / 2
        
        let size = contentView.height - 4
        postButton.frame = CGRect(x: contentView.width - 5 - size, y: 2, width: size, height: size)
        
        label.frame = CGRect(x: profileImageView.right + 5, y: 0, width: contentView.width - size - profileImageView.width - 16, height: contentView.height)
    }
    
    public func configure(model: UserNotification) {
        self.model = model
        
        switch model.type {
            case.like(let post):
                let thumbnail = post.thumbnailImage
                
                guard !thumbnail.absoluteString.contains("google.com") else {
                    return
                }
                postButton.sd_setBackgroundImage(with: thumbnail, for: .normal, completed: nil)
            case.follow:
                break;
        }
        
        label.text = model.text
        profileImageView.sd_setImage(with: model.user.profilePic, completed: nil)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        postButton.setBackgroundImage(nil, for: .normal)
        
        label.text = nil
        profileImageView.image = nil
    }
    
}
