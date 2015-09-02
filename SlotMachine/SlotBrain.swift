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
            
            if SlotBrain.checkForFlush(slotRow) {
                println("Flush")
                winnings += 1
                flushWinCount += 1
            }
            
            if SlotBrain.checkForThreeRow(slotRow) {
                println("Three in a row!")
                winnings += 1
                straightWinCount += 1
            }
            
            if SlotBrain.checkForThreeOfAKind(slotRow) {
                println("Three of a kind!")
                winnings += 1
                threeOfAKindCount += 1
            }
            
        }
        
        if flushWinCount == 3 {
            println("Royal Flush")
            winnings += 15
        }
        
        if straightWinCount == 3 {
            println("Huge win!!")
            winnings += 1000
        }
        
        if threeOfAKindCount == 3 {
            println("Unique win!!")
            winnings += 500
        }
        
        return winnings
    }
    
    class func checkForFlush(slotRow: [Slot]) -> Bool {
        
        var redCount = 0
        var blackCount = 0
        
        for var index = 0; index < slotRow.count; index++ {
            
            if slotRow[index].isRed {
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
    
    class func checkForThreeRow(slotRow: [Slot]) -> Bool {
        
        var firstNumber = slotRow[0].value
        
        if slotRow[1].value == (firstNumber + 1) && slotRow[2].value == (firstNumber + 2) {
            return true
        } else if slotRow[1].value == (firstNumber - 1) && slotRow[2].value == (firstNumber - 2) {
            return true
        } else {
            return false
        }
        
    }
    
    class func checkForThreeOfAKind(slotRow: [Slot]) -> Bool {
        
        var firstNumber = slotRow[0].value
        var secondNumber = slotRow[1].value
        var thirdNumber = slotRow[2].value
        
        if firstNumber == secondNumber && firstNumber == thirdNumber {
            return true
        } else {
            return false
        }

    }
    
}
    