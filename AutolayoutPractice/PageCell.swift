//
//  PageCell.swift
//  AutolayoutPractice
//
//  Created by Mehmet Salih Koçak on 17.11.2018.
//  Copyright © 2018 Mehmet Salih Koçak. All rights reserved.
//

import UIKit

class PageCell:UICollectionViewCell{
    
    private let titleAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)]
    private let descAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13),
                          NSAttributedString.Key.foregroundColor: UIColor.gray]
    
    var page:Page?{
        didSet{
            guard let safePage = page else{ return }
            bearImageView.image = UIImage(named: safePage.imageName)
            let attributedText = NSMutableAttributedString(string: safePage.headerText + "\n\n", attributes: titleAttributes)
            attributedText.append(NSAttributedString(string: safePage.descText, attributes: descAttributes))
            
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }
    
    private let bearImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let descriptionTextView: UITextView = {
        let tv = UITextView()
        tv.textAlignment = .center
        tv.isEditable = false
        tv.isScrollEnabled = false
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    private let upperHalfView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(upperHalfView)
        upperHalfView.addSubview(bearImageView)
        addSubview(descriptionTextView)
        
        setupUpperHalfView()
        setupBearImageView()
        setupDescriptionTextView()
    }
    
    
    private func setupUpperHalfView(){
        [
            upperHalfView.topAnchor.constraint(equalTo: topAnchor),
            upperHalfView.bottomAnchor.constraint(equalTo: centerYAnchor),
            upperHalfView.leadingAnchor.constraint(equalTo: leadingAnchor),
            upperHalfView.trailingAnchor.constraint(equalTo: trailingAnchor)
            ].forEach({$0.isActive = true})
    }
    
    private func setupBearImageView(){
        [
            bearImageView.centerXAnchor.constraint(equalTo: upperHalfView.centerXAnchor),
            bearImageView.centerYAnchor.constraint(equalTo: upperHalfView.centerYAnchor),
            bearImageView.heightAnchor.constraint(equalTo: upperHalfView.heightAnchor, multiplier: 0.6),
            bearImageView.widthAnchor.constraint(equalTo: bearImageView.heightAnchor)
            ].forEach({$0.isActive = true})
    }
    
    private func setupDescriptionTextView(){
        [
            descriptionTextView.topAnchor.constraint(equalTo: upperHalfView.bottomAnchor),
            descriptionTextView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 24),
            descriptionTextView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -24),
            descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
            ].forEach({$0.isActive = true})
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
