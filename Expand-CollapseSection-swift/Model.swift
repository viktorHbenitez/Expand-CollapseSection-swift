//
//  Model.swift
//  Expand-CollapseSection-swift
//
//  Created by Victor Hugo Benitez Bosques on 23/08/18.
//  Copyright © 2018 Victor Hugo Benitez Bosques. All rights reserved.
//

import UIKit

class Model: NSObject {

    var headerName : String?
    var isExpandable : Bool?
    var subType : [String] = [String]()
    
    
    init(title: String, subType: [String], bExpandable: Bool) {
        
        self.headerName = title
        self.isExpandable = bExpandable
        self.subType = subType
        
    }
}
