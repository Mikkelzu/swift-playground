//
//  FeedPostActionsTableViewCell.swift
//  Mik
//
//  Created by Michael on 14/09/2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import UIKit

class FeedPostActionsTableViewCell: UITableViewCell {

   static let identifier = "FeedPostActionsTableViewCell"
   
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: reuseIdentifier)
   }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
   
   public func configure() {
       // configure the cell
   }
   
   override func layoutSubviews() {
       super.layoutSubviews()
   }

}
