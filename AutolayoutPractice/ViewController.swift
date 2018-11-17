//
//  ViewController.swift
//  AutolayoutPractice
//
//  Created by Mehmet Salih Koçak on 16.11.2018.
//  Copyright © 2018 Mehmet Salih Koçak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let bearImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let tv = UITextView()
        
        let titleAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)]
        let descAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13),
                              NSAttributedString.Key.foregroundColor: UIColor.gray]
        
        let attributedText = NSMutableAttributedString(string: "Ahmet Mithat Kara'nın mülkiyetidir!!!\n\n", attributes: titleAttributes)
        attributedText.append(NSAttributedString(string: "Dikkat! Burası Ahmet Mithat Kara Beyefendi'nin mülküdür. İzinsiz girilmesi durumunda kanuni işlem başlatılır. Dikkat! Burası Ahmet Mithat Kara Beyefendi'nin mülküdür. İzinsiz girilmesi durumunda kanuni işlem başlatılır.", attributes: descAttributes))
        
        tv.attributedText = attributedText
        tv.textAlignment = .center
        tv.isEditable = false
        tv.isScrollEnabled = false
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    let upperHalfView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.tintColor = UIColor.gray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.tintColor = .mainPink
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = UIColor.mainPink.withAlphaComponent(0.25)
        pc.translatesAutoresizingMaskIntoConstraints = false
        return pc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(upperHalfView)
        upperHalfView.addSubview(bearImageView)
        view.addSubview(descriptionTextView)
        
        setupBottomControls()
        
        setupUpperHalfView()
        setupBearImageView()
        setupDescriptionTextView()
    }
    
    fileprivate func setupBottomControls(){
        let stackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        [
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -4),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 50)
        ].forEach({$0.isActive = true})
    }
    
    private func setupUpperHalfView(){
        [
            upperHalfView.topAnchor.constraint(equalTo: view.topAnchor),
            upperHalfView.bottomAnchor.constraint(equalTo: view.centerYAnchor),
            upperHalfView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            upperHalfView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
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
            descriptionTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8)
        ].forEach({$0.isActive = true})
    }
    
}

extension UIColor{
    static let mainPink = UIColor(red: 250/255, green: 70/255, blue: 140/255, alpha: 1.0)
}
