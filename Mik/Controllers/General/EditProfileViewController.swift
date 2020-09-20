//
//  EditProfileViewController.swift
//  Mik
//
//  Created by Michael on 14/09/2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import UIKit

final class EditProfileViewController: UIViewController, UITableViewDataSource  {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FormTableViewCell.self, forCellReuseIdentifier: FormTableViewCell.identifier)
        return tableView;
    }()
    
    private var models = [[EditProfileFormModel]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureModels()
        tableView.tableHeaderView = createTableHeaderView()
        tableView.dataSource = self
        
        view.addSubview(tableView)

        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(didTapCancel))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    }
    
    private func configureModels() {
        let sectionOneLabels = ["Name", "Username", "Bio"]
        var sectionOne = [EditProfileFormModel]()
        
        for label in sectionOneLabels {
            let model = EditProfileFormModel(label: label, placeholder: "Enter \(label)", value: nil)
            sectionOne.append(model);
        }
        models.append(sectionOne)
        
       let section2Labels = ["Email", "Phone", "Gender"]
        var section2 = [EditProfileFormModel]()
        
        for label in section2Labels {
            let model = EditProfileFormModel(label: label, placeholder: "Enter \(label)", value: nil)
            section2.append(model);
        }
        models.append(section2)
    }
    
    private func createTableHeaderView() -> UIView {
        let header = UIView(frame:  CGRect(
                                x: 0,
                                y: 0,
                                width: view.width,
                                height: view.height / 4 ).integral
                            )
        let size = header.height / 1.5
        
        let profilePhotoButton = UIButton(frame: CGRect(
                                            x: (view.width - size) / 2,
                                            y: (header.height - size) / 2 ,
                                            width: size,
                                            height: size)
                                        )
        
        header.addSubview(profilePhotoButton)
        profilePhotoButton.layer.masksToBounds = true
        profilePhotoButton.layer.cornerRadius = size / 2.0
        profilePhotoButton.addTarget(self, action: #selector(didTapProfilePhotoButton), for: .touchUpInside)
        profilePhotoButton.setBackgroundImage(UIImage(systemName: "person.circle"), for: .normal)
        profilePhotoButton.layer.borderWidth = 1
        profilePhotoButton.layer.borderColor = UIColor.secondarySystemBackground.cgColor
        profilePhotoButton.tintColor = .label
        
        return header
    }
    
    @objc private func didTapProfilePhotoButton() {
        
    }
    
    @objc private func didTapSave() {
        // save info
        
        //dismiss when saved to db
        dismiss(animated: true, completion: nil)
    }
    @objc private func didTapCancel() {
        dismiss(animated: true, completion: nil )
    }
    
    @objc private func didTapChangeProfilePicture() {
        let actionSheet = UIAlertController(title: "Profile picture", message: "Change profile picture", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { _ in
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Choose from Camera Roll", style: .default, handler: { _ in
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        actionSheet.popoverPresentationController?.sourceView = view
        actionSheet.popoverPresentationController?.sourceRect = view.bounds
        
        present(actionSheet, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = models[indexPath.section][indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: FormTableViewCell.identifier, for: indexPath) as! FormTableViewCell
        
        cell.configureCell(model: model)
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard section == 1 else {
            return "Public Information"
        }
        
        return "Private Information"
    }


}

extension EditProfileViewController: FormTableViewCellDelegate {
    func formTableViewCell(_cell: FormTableViewCell, didUpdateField updatedModel: EditProfileFormModel) {
        
        print(updatedModel.value ?? "nil")
    }
    
    
}
