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
                var slotInstance = SlotFactory.createSlot(slotArray)
                slotArray.append(slotInstance)
            }
            slotsBoard.append(slotArray)
        }
        return slotsBoard
    }
    
    
    class func createSlot(currentCards:[Slot]) -> Slot {
        
        var currentCardValues:[Int] = []
        
        for slot in currentCards {
            currentCardValues.append(slot.value)
        }
        
        var randomNumber = Int(arc4random_uniform(UInt32(13))) + 1
        
        while contains(currentCardValues, randomNumber) {
            randomNumber = Int(arc4random_uniform(UInt32(13)))
        }
        
        var slot:Slot
        
        switch randomNumber {
        case 1:
            slot = Slot(value: 1, image: "Ace", isRed: true)
        case 2:
            slot = Slot(value: 2, image: "Two", isRed: true)
        case 3:
            slot = Slot(value: 3, image: "Three", isRed: true)
        case 4:
            slot = Slot(value: 4, image: "Four", isRed: true)
        case 5:
            slot = Slot(value: 5, image: "Five", isRed: false)
        case 6:
            slot = Slot(value: 6, image: "Six", isRed: false)
        case 7:
            slot = Slot(value: 7, image: "Seven", isRed: true)
        case 8:
            slot = Slot(value: 8, image: "Eight", isRed: false)
        case 9:
            slot = Slot(value: 9, image: "Nine", isRed: false)
        case 10:
            slot = Slot(value: 10, image: "Ten", isRed: true)
        case 11:
            slot = Slot(value: 11, image: "Jack", isRed: false)
        case 12:
            slot = Slot(value: 12, image: "Queen", isRed: false)
        case 13:
            slot = Slot(value: 13, image: "King", isRed: true)
        default:
            slot = Slot(value: 0, image: "Ace", isRed: true)
        }
        return slot
    }
    
}