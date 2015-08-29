//
//  SlotFactory.swift
//  SlotMachine
//
//  Created by Jean Bernard on 8/29/15.
//  Copyright (c) 2015 Jean Bernard. All rights reserved.
//

import Foundation
import UIKit

class SlotFactory {
    class func createSlots() -> [[Slot]] {
        
        let kNumberOfSlots = 3
        let kNumberOfContainers = 3
        var slotsBoard:[[Slot]] = []
        
        //slots = [ [slot1, slot2, slot3], [slot4, slot5, slot6], [slot7, slot8, slot9] ]
        
        for var containerNumber = 0; containerNumber < kNumberOfContainers; containerNumber++ {
            
            var slotArray:[Slot] = []
            
                for var slotNumber = 0; slotNumber < kNumberOfSlots; slotNumber++ {
                    var slotInstance = Slot(value: 0, image: "", isRed: true)
                    slotArray.append(slotInstance)
            }
            slotsBoard.append(slotArray)
        }
        return slotsBoard
    }
}