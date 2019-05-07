//
//  AppsSearchCollectionViewController.swift
//  Appstore
//
//  Created by OYEGOKE TOMISIN on 01/04/2019.
//  Copyright © 2019 com.OyegokeTomisin. All rights reserved.
//

import UIKit
import SDWebImage

class AppsSearchCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate{
    
    fileprivate let cellId = "id1234"
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    fileprivate var appResults = [Result]()
    fileprivate var timer: Timer?
    fileprivate let enterSearchTermLabel: UILabel = {
        let label =  UILabel()
        label.text = "Please enter search term above..."
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(SearchResultsCell.self, forCellWithReuseIdentifier: cellId)
        setUpSearchBar()
        //fetchITunesApps()
        collectionView.addSubview(enterSearchTermLabel)
        enterSearchTermLabel.fillSuperview(padding: .init(top: 50, left: 50, bottom: 0, right: 50))
    }
    
    fileprivate func setUpSearchBar(){
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        //searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        // throttling the search
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_)  in
            Service.shared.fetchApps(searchTerm: searchText) { (results, err) in
                if let err = err {
                    print("Failed to fetch apps:", err)
                    return
                }
                self.appResults = results
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        })
    }
    
    fileprivate func fetchITunesApps() {
        Service.shared.fetchApps(searchTerm: "Twitter") { (results, err) in
            if let err = err {
                print("Failed to fetch apps:", err)
                return
            }
            self.appResults = results
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultsCell
        let appResult = appResults[indexPath.item]
        cell.appResult = appResult
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        enterSearchTermLabel.isHidden = appResults.count != 0
        return appResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
