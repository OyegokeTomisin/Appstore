//
//  AppsController.swift
//  Appstore
//
//  Created by OYEGOKE TOMISIN on 07/05/2019.
//  Copyright © 2019 com.OyegokeTomisin. All rights reserved.
//

import UIKit

class AppsPageController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = "id"
    fileprivate let headerId = "headerId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        fetchData()
    }
    
    //var editorsChoiceGames: AppGroup?
    var groups = [AppGroup]()
    fileprivate func fetchData(){
        
        var group1: AppGroup?
        var group2: AppGroup?
        var group3: AppGroup?
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        Service.shared.fetchGames{(appGroup, err) in
            dispatchGroup.leave()
            group1 = appGroup
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
        dispatchGroup.enter()
        Service.shared.fetchTopGrossing{(appGroup, err) in
            dispatchGroup.leave()
            group2 = appGroup
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
        dispatchGroup.enter()
        Service.shared.fetchAppGroup(urlString: "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/25/explicit.json"){(appGroup, err) in
            dispatchGroup.leave()
            group3 = appGroup
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
        dispatchGroup.notify(queue: .main){
            if let group = group1{
                self.groups.append(group)
            }
            if let group = group2{
                self.groups.append(group)
            }
            if let group = group3{
                self.groups.append(group)
            }
            self.collectionView.reloadData()
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
        
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId , for: indexPath) as! AppsGroupCell
        let appGroups = groups[indexPath.item]
        
        cell.titleLabel.text = appGroups.feed.title
        cell.horizontalController.appGroup = appGroups
        cell.horizontalController.collectionView.reloadData()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
}
