//
//  SlotBrain.swift
//  SlotMachine
//
//  Created by Jean Bernard on 8/31/15.
//  Copyright (c) 2015 Jean Bernard. All rights reserved.
//

import Foundation

class SlotBrain {
    
    class func unpackSlotIntoRows(packedSlots: [[Slot]]) -> [[Slot]] {
        
        var slotInRows: [Slot] = []
        var slotInRows2: [Slot] = []
        var slotInRows3: [Slot] = []
        
        for slotArray in packedSlots {
            
            for var index = 0; index <= slotArray.count; index++ {
                
                let slot = slotArray[index]
                
                if index == 0 {
                    slotInRows.append(slot)
                } else if index == 1 {
                    slotInRows2.append(slot)
                } else if index == 2 {
                    slotInRows3.append(slot)
                }
                
            }
            
        }
        
        var orderedSlots: [[Slot]] = [slotInRows, slotInRows2, slotInRows3]
        
        return orderedSlots
    }
    
}