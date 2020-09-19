//
//  NoNotificationsView.swift
//  Mik
//
//  Created by Michael on 18/09/2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import UIKit

class NoNotificationsView: UIView {

    private let label: UILabel = {
        let label = UILabel()
        label.text = "No notifications yet..."
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.numberOfLines = 1
        
        return label
    }()
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.tintColor = .secondaryLabel
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "bell")
        
        return image
    }()
    override func layoutSubviews() {
        super.layoutSubviews()
        
        image.frame = CGRect(x: (width - 50) / 2, y: 0, width: 50, height: 50).integral
        
        label.frame = CGRect(x: 0, y: image.bottom, width: width, height: height - 50).integral
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(label)
        addSubview(image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
