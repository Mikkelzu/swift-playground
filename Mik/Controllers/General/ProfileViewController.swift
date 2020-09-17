//
//  ProfileViewController.swift
//  Mik
//
//  Created by Michael on 14/09/2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import UIKit

final class ProfileViewController: UIViewController {

    private var collectionView: UICollectionView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        AuthManager.shared.handleNotAuthenticated(vc: self)
        AuthManager.shared.getCurrentUserData()
    
        view.backgroundColor = .systemBackground
        
        configureNavBar()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1)
        
        let size = (view.width - 4) / 3
        
        layout.itemSize = CGSize(width: size, height: size)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView?.backgroundColor = .red
        
        // Cell
        collectionView?.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        
        // Headers
        collectionView?.register(ProfileInfoHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileInfoHeaderCollectionReusableView.identifier)
        collectionView?.register(ProfileTabsCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileTabsCollectionReusableView.identifier)
        
        // collectionview delegates
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        guard let collectionView = collectionView else {
            return
        }
        
        view.addSubview(collectionView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        collectionView?.frame = view.bounds
    }
    
    private func configureNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(didTapSettingsButton))
        navigationItem.rightBarButtonItem?.tintColor = .label
    }
    
    @objc private func didTapSettingsButton() {
        let vc = SettingsViewController()
        vc.title = "Settings"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}


extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    
}
