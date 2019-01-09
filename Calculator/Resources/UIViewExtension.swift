//
//  UIViewExtension.swift
//  Calculator
//
//  Created by Brady Bentley on 1/8/19.
//  Copyright © 2019 Brady. All rights reserved.
//

import UIKit

extension UIView{
    func anchor(top: NSLayoutYAxisAnchor?, bottom: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingBottom: CGFloat, paddingLeft: CGFloat, paddingRight: CGFloat, width: CGFloat?, height: CGFloat?){
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let bottom = bottom{
            bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        
        if let left = left{
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let right = right{
            rightAnchor.constraint(equalTo: right, constant: paddingRight).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height{
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}

extension UIButton {
    func setupButtons(title: String, cornerRadius: CGFloat, backgroundColor: UIColor, textColor: UIColor, fontSize: CGFloat){
        setTitle(title, for: .normal)
        layer.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
        self.setTitleColor(textColor, for: .normal)
        titleLabel?.font = .systemFont(ofSize: fontSize)
    }
}

