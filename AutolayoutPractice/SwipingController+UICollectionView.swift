//
//  SwipingController+UICollectionView.swift
//  AutolayoutPractice
//
//  Created by BTK Apple on 17.11.2018.
//  Copyright © 2018 Mehmet Salih Koçak. All rights reserved.
//

import UIKit

extension SwipingController{
    
    func loadUpData(){
        pages.append(Page(imageName: "bear_first", headerText: "Lorem ipsum dolor sit amet", descText: "Mauris a neque vestibulum sem suscipit viverra. Ut interdum eget ipsum ut rhoncus."))
        pages.append(Page(imageName: "heart_second", headerText: "Maecenas lobortis sagittis tellus.", descText: "In hac habitasse platea dictumst. Praesent ornare faucibus sapien, at convallis ex iaculis a."))
        pages.append(Page(imageName: "leaf_third", headerText: "Etiam interdum ultrices purus vitae euismod", descText: "Cras mattis, nisi a luctus semper, orci nibh pulvinar risus, nec tincidunt sapien sapien id quam. Sed ut velit nibh."))
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> PageCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PageCell
        cell.page = pages[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
