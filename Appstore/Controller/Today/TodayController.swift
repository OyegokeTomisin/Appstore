//
//  TodayController.swift
//  Appstore
//
//  Created by OYEGOKE TOMISIN on 28/05/2019.
//  Copyright © 2019 com.OyegokeTomisin. All rights reserved.
//

import UIKit

class TodayController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        collectionView.backgroundColor = #colorLiteral(red: 0.9529177547, green: 0.9489164948, blue: 0.9570239186, alpha: 1)
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    var startingFrame: CGRect?
    var appFullscreenController: UIViewController!
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let appFullscreenController = AppFullscreenController()
        let animatableView = appFullscreenController.view!
        animatableView.layer.cornerRadius = 16
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleRemoveRedView))
        animatableView.addGestureRecognizer(tapGesture)
        
        self.view.addSubview(animatableView)
        addChild(appFullscreenController)
        
        
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else { return }
        self.startingFrame = startingFrame
        self.appFullscreenController = appFullscreenController
        
        animatableView.frame = startingFrame
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            self.tabBarController?.tabBar.transform =  CGAffineTransform(translationX: 0, y: 100)
            animatableView.frame = self.view.frame
            }, completion: nil)
    }
    
    
    @objc func handleRemoveRedView(gesture: UITapGestureRecognizer){
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseIn, animations: {
            gesture.view?.frame = self.startingFrame ?? .zero
            gesture.view?.alpha = 0.2
            self.tabBarController?.tabBar.transform = .identity
        }, completion: { _ in
            gesture.view?.removeFromSuperview()
            self.appFullscreenController.removeFromParent()
        })
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TodayCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 64, height: 450)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 32, left: 0, bottom: 32, right: 0)
    }
}
