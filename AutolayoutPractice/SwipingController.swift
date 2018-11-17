//
//  SwipingController.swift
//  AutolayoutPractice
//
//  Created by Mehmet Salih Koçak on 17.11.2018.
//  Copyright © 2018 Mehmet Salih Koçak. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var pages = [Page]()
    
    // MARK: ----Parameter Definitions
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.tintColor = UIColor.gray
        button.tag = 1
        button.addTarget(self, action: #selector(handleNextOrPrev(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.tintColor = .mainPink
        button.addTarget(self, action: #selector(handleNextOrPrev(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = UIColor.mainPink.withAlphaComponent(0.25)
        pc.translatesAutoresizingMaskIntoConstraints = false
        return pc
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = .white
        collectionView.isPagingEnabled = true
        self.collectionView!.register(PageCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        setupBottomControls()
        loadUpData()
        
        pageControl.currentPage = 0
        pageControl.numberOfPages = pages.count
    }
    
    // MARK: ----Handlers
    @objc private func handleNextOrPrev(_ sender:UIButton){
        let nextStepAmount = sender.tag == 1 ? -1 : 1
        let nextIndex = pageControl.currentPage + nextStepAmount
        if !(nextIndex > pages.count - 1) && !(nextIndex < 0){
            collectionView.scrollToItem(at: IndexPath(item: nextIndex, section: 0), at: .centeredHorizontally, animated: true)
            pageControl.currentPage = nextIndex
        }
    }
    
    // MARK: ----Constraint Definitions
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
    
    // MARK: ----View Delegate Functions
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }) { (bear_) in
            
        }
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        pageControl.currentPage = Int(targetContentOffset.pointee.x / view.frame.width)
    }
}
