//
//  FormTableViewCell.swift
//  Mik
//
//  Created by Michael on 17/09/2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import UIKit

public class FormTableViewCell: UITableViewCell, UITextFieldDelegate {

    static let identifier = "FormTableViewCell"
    
    public weak var delegate: FormTableViewCellDelegate?
    
    private var model: EditProfileFormModel?
    
    private let formLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 1
        
        return label
    }()
    
    private let field: UITextField = {
        let field = UITextField()
        field.returnKeyType = .done
        return field
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        clipsToBounds = true
        
        contentView.addSubview(formLabel)
        contentView.addSubview(field)
        
        field.delegate = self
        
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureCell(model: EditProfileFormModel) {
        self.model = model
        formLabel.text = model.label
        field.placeholder = model.placeholder
        field.text = model.value
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        
        formLabel.text = nil
        field.placeholder = nil
        field.text = nil
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        formLabel.frame = CGRect(x: 5, y: 0, width: contentView.width / 3, height: contentView.height)
        field.frame = CGRect(x: formLabel.right + 5, y: 0, width: contentView.width - 10 - formLabel.width, height: contentView.height)
        
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        model?.value = textField.text
        guard let model = model else {
            return true
        }
        delegate?.formTableViewCell(_cell: self, didUpdateField: model)
        textField.resignFirstResponder()
        return true
    }
    
}
