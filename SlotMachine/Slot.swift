//
//  Slot.swift
//  SlotMachine
//
//  Created by Jean Bernard on 8/29/15.
//  Copyright (c) 2015 Jean Bernard. All rights reserved.
//

import Foundation
import UIKit

struct Slot {
    var value = 0
    var image = UIImage(named: "Ace")
    var isRed = true
    
    init(value:Int, image: String, isRed: Bool) {
        self.value = value
        self.image = UIImage(named: image)
        self.isRed = isRed
    }
    
}