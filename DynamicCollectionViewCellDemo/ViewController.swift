//
//  ViewController.swift
//  DynamicCollectionViewCellDemo
//
//  Created by Rune Madsen on 4/10/17.
//  Copyright © 2017 The App Boutique. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    
    var collectionView: UICollectionView?
    let strings = ["One line", "Two lines\nLine 2", "One line", "One line", "One line", "Two lines\nLine 2", "One line", "One line", "One line", "One Line", "Two lines\nLine 2"]
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        if let collectionView = collectionView
        {
            collectionViewFlowLayout.estimatedItemSize = CGSize(width: collectionView.bounds.width, height: 50)
            collectionView.backgroundColor = UIColor.blue
            collectionView.delegate = self
            collectionView.dataSource = self
            self.view.addSubview(collectionView)
            collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.reuseIdentifier())
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if let collectionView = collectionView
        {
            collectionView.contentInset = UIEdgeInsets(top: self.topLayoutGuide.length, left: 0, bottom: self.bottomLayoutGuide.length, right: 0)
            collectionView.scrollIndicatorInsets = collectionView.contentInset
        }
    }
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return strings.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier(), for: indexPath) as! CollectionViewCell
        cell.label.text = strings[indexPath.row]
        return cell
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: collectionView.bounds.size.width, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return 5
    }
    
}


