//
//  AppDetailsController.swift
//  Appstore
//
//  Created by OYEGOKE TOMISIN on 24/05/2019.
//  Copyright © 2019 com.OyegokeTomisin. All rights reserved.
//

import UIKit

class AppDetailController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let detailCellId = "detailCellId"
    var appId: String!{
        didSet{
            print("here is my app id", appId)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        collectionView.backgroundColor = .white
        collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: detailCellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailCellId, for: indexPath) as! AppDetailCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
}
