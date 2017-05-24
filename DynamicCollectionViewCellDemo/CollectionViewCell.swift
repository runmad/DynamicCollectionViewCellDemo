//
//  CollectionViewCell.swift
//  DynamicCollectionViewCellDemo
//
//  Created by Rune Madsen on 4/10/17.
//  Copyright © 2017 The App Boutique. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell
{
    
    let view: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .black
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        label.textColor = UIColor.white
        return label
    }()
    let yellowView: UIView = {
        let yellowView = UIView()
        yellowView.backgroundColor = .yellow
        return yellowView
    }()
    let blueView: UIView = {
        let yellowView = UIView()
        yellowView.backgroundColor = .blue
        return yellowView
    }()
    let purpleView: UIView = {
        let yellowView = UIView()
        yellowView.backgroundColor = .purple
        return yellowView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    static func reuseIdentifier() -> String
    {
        return String(describing: self)
    }
    
    func setup()
    {
        contentView.backgroundColor = UIColor.brown
        contentView.addSubview(view)
        contentView.addSubview(label)
        contentView.addSubview(yellowView)
        yellowView.addSubview(blueView)
        yellowView.addSubview(purpleView)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        blueView.translatesAutoresizingMaskIntoConstraints = false
        purpleView.translatesAutoresizingMaskIntoConstraints = false
        
        view.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        let heightConstraint = view.heightAnchor.constraint(equalToConstant: 100)
        heightConstraint.isActive = true
        // priority is needed to supress layout warnings for the height of the cell
        heightConstraint.priority = 999
        
        label.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 10).isActive = true
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        contentView.trailingAnchor.constraint(equalTo: label.trailingAnchor, constant: 10).isActive = true
        
        yellowView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
        yellowView.leadingAnchor.constraint(equalTo: label.leadingAnchor).isActive = true
        yellowView.trailingAnchor.constraint(equalTo: label.trailingAnchor).isActive = true
        yellowView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
        purpleView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        purpleView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        purpleView.topAnchor.constraint(greaterThanOrEqualTo: yellowView.topAnchor).isActive = true
        let purpleViewTopConstraint = purpleView.topAnchor.constraint(equalTo: yellowView.topAnchor)
        purpleViewTopConstraint.priority = UILayoutPriorityDefaultLow
        purpleViewTopConstraint.isActive = true
        purpleView.leadingAnchor.constraint(equalTo: yellowView.leadingAnchor).isActive = true
        purpleView.bottomAnchor.constraint(lessThanOrEqualTo: yellowView.bottomAnchor).isActive = true
        let purpleViewBottomConstraint = purpleView.topAnchor.constraint(equalTo: yellowView.bottomAnchor)
        purpleViewBottomConstraint.priority = UILayoutPriorityDefaultLow
        purpleViewBottomConstraint.isActive = true
        purpleView.centerYAnchor.constraint(equalTo: yellowView.centerYAnchor).isActive = true
        
        blueView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        blueView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        blueView.topAnchor.constraint(greaterThanOrEqualTo: yellowView.topAnchor).isActive = true
        let blueViewTopConstraint = blueView.topAnchor.constraint(equalTo: yellowView.topAnchor)
        blueViewTopConstraint.priority = UILayoutPriorityDefaultLow
        blueViewTopConstraint.isActive = true
        blueView.trailingAnchor.constraint(equalTo: yellowView.trailingAnchor).isActive = true
        blueView.bottomAnchor.constraint(lessThanOrEqualTo: yellowView.bottomAnchor).isActive = true
        let blueViewBottomConstraint = blueView.bottomAnchor.constraint(equalTo: yellowView.bottomAnchor)
        blueViewBottomConstraint.priority = UILayoutPriorityDefaultLow
        blueViewBottomConstraint.isActive = true
        blueView.centerYAnchor.constraint(equalTo: yellowView.centerYAnchor).isActive = true
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var newFrame = layoutAttributes.frame
        // note: don't change the width
        newFrame.size.height = ceil(size.height)
        layoutAttributes.frame = newFrame
        return layoutAttributes
    }
    
    override func prepareForReuse()
    {
        super.prepareForReuse()
        label.text = nil
    }
    
}

