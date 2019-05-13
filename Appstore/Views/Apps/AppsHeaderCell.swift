//
//  AppsHeaderCell.swift
//  Appstore
//
//  Created by OYEGOKE TOMISIN on 13/05/2019.
//  Copyright © 2019 com.OyegokeTomisin. All rights reserved.
//

import UIKit

class AppsHeaderCell: UICollectionViewCell {
    
    let companyLabel = UILabel(text: "Facebook", font: .boldSystemFont(ofSize: 12))
    let titleLabel = UILabel(text: "Keeping up with friends is faster than ever", font: .systemFont(ofSize: 24))
    let imageView = UIImageView(cornerRadius: 8)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        companyLabel.textColor = .blue
        titleLabel.numberOfLines = 2
        imageView.backgroundColor = .red
        let stackview = VerticalStackView(arrangedSubviews: [companyLabel, titleLabel, imageView], spacing: 12)
        addSubview(stackview)
        stackview.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
