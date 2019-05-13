//
//  AppsHorizontalController.swift
//  Appstore
//
//  Created by OYEGOKE TOMISIN on 13/05/2019.
//  Copyright © 2019 com.OyegokeTomisin. All rights reserved.
//

import UIKit

class AppsHorizontalController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = "cellId"
    fileprivate let lineSpacing: CGFloat = 10
    fileprivate let topBottomPadding: CGFloat = 12
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .green
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout  {
            layout.scrollDirection = .horizontal
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .orange
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.height - (2 * topBottomPadding) - (2 * lineSpacing)) / 3
        return .init(width: view.frame.width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: topBottomPadding, left: 16, bottom: topBottomPadding, right: 16)
    }
}
