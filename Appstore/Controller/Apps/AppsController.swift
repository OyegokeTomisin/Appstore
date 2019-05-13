//
//  AppsController.swift
//  Appstore
//
//  Created by OYEGOKE TOMISIN on 07/05/2019.
//  Copyright © 2019 com.OyegokeTomisin. All rights reserved.
//

import UIKit

class AppsController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = "id"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .yellow
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellId)
    }
  
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId , for: indexPath) as! AppsGroupCell
        cell.titleLabel.text = "App title" 
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 250)
    }
    
}
