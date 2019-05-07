//
//  SearchResultsCell.swift
//  Appstore
//
//  Created by OYEGOKE TOMISIN on 01/04/2019.
//  Copyright © 2019 com.OyegokeTomisin. All rights reserved.
//

import UIKit

class SearchResultsCell: UICollectionViewCell {
    
    var appResult: Result!{
        didSet{
            nameLabel.text = appResult.trackName
            categoryLabel.text = appResult.primaryGenreName
            ratingsLabel.text = "Rating: \(appResult.averageUserRating ?? 0)"
            appIconImageView.sd_setImage(with: URL(string: appResult.artworkUrl100))
            screenShot1ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[0]))
            if appResult.screenshotUrls.count > 1{
                screenShot2ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[1]))
            }
            if appResult.screenshotUrls.count > 2{
                screenShot3ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[2]))
            }
        }
    }
    
    let appIconImageView: UIImageView = {
        let img = UIImageView()
        img.widthAnchor.constraint(equalToConstant: 64).isActive = true
        img.heightAnchor.constraint(equalToConstant: 64).isActive = true
        img.layer.cornerRadius = 12
        img.clipsToBounds = true
        return img
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Instagram"
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Photo & Video"
        return label
    }()
    
    let ratingsLabel: UILabel = {
        let label = UILabel()
        label.text = "9.26M"
        return label
    }()
    
    let getButton: UIButton = {
        let button = UIButton()
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.layer.cornerRadius = 16
        return button
    }()
    
    lazy var screenShot1ImageView = self.createScreenShotImage()
    lazy var screenShot2ImageView = self.createScreenShotImage()
    lazy var screenShot3ImageView = self.createScreenShotImage()
    
    func createScreenShotImage() -> UIImageView{
        let img = UIImageView()
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 8
        img.layer.borderWidth = 0.5
        img.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        return img
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let labelsStackView = VerticalStackView(arrangedSubviews: [nameLabel, categoryLabel, ratingsLabel])
        
        let infoTopStackView = UIStackView(arrangedSubviews: [appIconImageView, labelsStackView, getButton])
        infoTopStackView.spacing = 12
        infoTopStackView.alignment = .center
        
        let screenShotStackView = UIStackView(arrangedSubviews: [screenShot1ImageView, screenShot2ImageView, screenShot3ImageView])
        screenShotStackView.spacing = 12
        screenShotStackView.distribution = .fillEqually
        
        let overallStackView = VerticalStackView(arrangedSubviews: [infoTopStackView, screenShotStackView], spacing: 16)
        addSubview(overallStackView)
        overallStackView.fillSuperview(padding: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
