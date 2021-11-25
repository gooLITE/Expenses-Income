//
//  CategoryCollectionVC.swift
//  Expenses&Income
//
//  Created by Yu Sum Yung on 30/10/2021.
//

import UIKit

protocol CategoryCollectionDelegate: AnyObject {
    func didUpdateExpenseCat(selectedCat: String)
}

class CategoryCollectionVC: UICollectionViewController {
    
    weak var delegate: CategoryCollectionDelegate?
    private let itemsPerRow: CGFloat = 3
    private let sectionInsets = UIEdgeInsets(
      top: 10.0,
      left: 10.0,
      bottom: 10.0,
      right: 10.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self

    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return expenseCat.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        
        cell.catTitle.text = ""
        
        cell.catTitle.text = expenseCat[indexPath.row][0]
        cell.catImage.image = UIImage(systemName: expenseCat[indexPath.row][1])
        
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 5
        cell.layer.borderColor = UIColor(red: 81/225, green: 113/225, blue: 165/225, alpha: 1).cgColor
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected category: \(expenseCat[indexPath.row][0])")
        delegate?.didUpdateExpenseCat(selectedCat: expenseCat[indexPath.row][0])
        navigationController?.popViewController(animated: true)
        
    }
    
    
    
    
}


extension CategoryCollectionVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
            
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
