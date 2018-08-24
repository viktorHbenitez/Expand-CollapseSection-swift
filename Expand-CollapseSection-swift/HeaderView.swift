//
//  HeaderView.swift
//  Expand-CollapseSection-swift
//
//  Created by Victor Hugo Benitez Bosques on 23/08/18.
//  Copyright © 2018 Victor Hugo Benitez Bosques. All rights reserved.
//

import UIKit

class HeaderView: UIView {

    
    // lazy property : do not store the property in memory just call and execute
    lazy var btnSection: UIButton = {
      
        let btnSection = UIButton(frame: CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.width, height: self.frame.height))
        btnSection.backgroundColor = UIColor.red
        
        btnSection.titleLabel?.text = "Title Section"
        btnSection.addTarget(self, action: #selector(onClickTrigger), for: .touchUpInside)
        return btnSection
    }()
    
    
    @objc func onClickTrigger() {
        print("Tapped in the title section")
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(btnSection)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
