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
            
            for var index = 0; index < slotArray.count; index++ {
                
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
    
    class func computeWinnings(slots: [[Slot]]) -> Int {
        
        var unpackedSlots = SlotBrain.unpackSlotIntoRows(slots)
        
        var winnings = 0
        var flushWinCount = 0
        var threeOfAKindCount = 0
        var straightWinCount = 0
        
        for slotRow in unpackedSlots {
            
            if SlotBrain.checkForFlush(slotRow) == true {
                println("Flush")
                winnings += 1
                flushWinCount += 1
            } else {
                println("No flush")
            }
            
        }
        
        if flushWinCount == 3 {
            println("Royal Flush")
            winnings += 15
        }
        
        return winnings
    }
    
    class func checkForFlush(slotRow: [Slot]) -> Bool {
        
        var redCount = 0
        var blackCount = 0
        
        for var index = 0; index < slotRow.count; index++ {
            
            if slotRow[index].isRed == true {
                redCount++
            } else {
                blackCount++
            }
            
        }
        
        if redCount == slotRow.count || blackCount == slotRow.count {
            return true
        } else {
            return false
        }
    }
    

    
}
    