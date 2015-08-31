//
//  ViewController.swift
//  SlotMachine
//
//  Created by Jean Bernard on 8/18/15.
//  Copyright (c) 2015 Jean Bernard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var firstContainer: UIView!
    var secondContainer: UIView!
    var thirdContainer: UIView!
    var fourthContainer: UIView!
    
    var titleLabel: UILabel!
    
    // MARK:
    // MARK: Information Labels
    
    var creditsLabel: UILabel!
    var betLabel: UILabel!
    var winnerPaidLabel: UILabel!
    var creditsTitleLabel: UILabel!
    var betTitleLabel: UILabel!
    var winnderPaidTitleLabel: UILabel!
    
    // MARK:
    // MARK: Buttons
    
    var resetButton: UIButton!
    var betOneButton: UIButton!
    var betMaxButton: UIButton!
    var spinButton: UIButton!
    
    
    // MARK:
    // MARK: Constants
    
    let kMarginForView: CGFloat = 10.0
    let kMarginForSlot: CGFloat = 2.0
    let kSixth: CGFloat = 1.0/6.0
    let kThird: CGFloat = 1.0/3.0
    let kEight: CGFloat = 1.0/8.0
    let kHalf: CGFloat = 1.0/2.0
    let kNumberOfContainers = 3
    let kNumberOfSlots = 3
    
    // MARK:
    // MARK: Stats
    
    var credits = 50
    var currentBet = 0
    var winnings = 0
    
    var allCards:[[Slot]] = []
    
    // MARK:
    // MARK: View Controller Methods
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupContainerViews()
        setupFirstContainer(self.firstContainer)
        setupSecondContainer(self.secondContainer)
        setupThirdContainer(self.thirdContainer)
        setupFourthContainer(self.fourthContainer)
        updateMainView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK:
    // MARK: IBActions
    
    func resetButtonPressed(button: UIButton) {
        self.hardReset()
    }
    
    func betOneButtonPressed(button: UIButton) {
        
        if credits <= 0 {
            self.showAlertWithText(header: "Hey!!", message: "You have no more credits left to play. Please reset the game")
        } else {
            if currentBet < 5 {
                currentBet += 1
                credits -= 1
                updateMainView()
            } else {
                self.showAlertWithText(message: "You have exceeded the maximum amount of bets allowed")
            }
        }
        
    }
    
    func betMaxButtonPressed(button: UIButton) {
        
        if credits <= 0 {
            showAlertWithText(header: "", message: "Not Enough Credits")
        } else {
            if currentBet < 5 {
                var creditsToMax = 5 - currentBet
                currentBet += creditsToMax
                credits -= creditsToMax
                updateMainView()
            } else {
                showAlertWithText(message: "Can't bet more credits. Only 5 at a time")
            }
        }
        
        
    }
    
    func spinButtonPressed(button: UIButton) {
        allCards = SlotFactory.createSlots()
        setupSecondContainer(self.secondContainer)
    }
    
    // MARK:
    // MARK: Setup Container Methods

    func setupContainerViews(){
        
        self.firstContainer = UIView(frame: CGRect(
            x: self.view.bounds.origin.x + kMarginForView,
            y: self.view.bounds.origin.y,
            width: self.view.bounds.width - (kMarginForView * 2),
            height: self.view.bounds.height * kSixth))
        self.firstContainer.backgroundColor = UIColor.redColor()
        self.view.addSubview(self.firstContainer)
        
        self.secondContainer = UIView(frame: CGRect(
            x: self.view.bounds.origin.x + kMarginForView,
            y: self.firstContainer.frame.height,
            width: self.view.bounds.width - (kMarginForView * 2),
            height: self.view.bounds.height * (kSixth * 3)))
        self.secondContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.secondContainer)
        
        self.thirdContainer = UIView(frame: CGRect(
            x: self.view.bounds.origin.x + kMarginForView,
            y: self.firstContainer.frame.height + self.secondContainer.frame.height,
            width: self.view.bounds.width - (kMarginForView * 2),
            height: self.view.bounds.height * kSixth))
        self.thirdContainer.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(self.thirdContainer)
        
        self.fourthContainer = UIView(frame: CGRect(
            x: self.view.bounds.origin.x + kMarginForView,
            y: firstContainer.frame.height + secondContainer.frame.height + thirdContainer.frame.height,
            width: self.view.bounds.width - (kMarginForView * 2),
            height: self.view.bounds.height * kSixth))
        self.fourthContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.fourthContainer)
    }
    
    func setupFirstContainer(containerView: UIView) {
        self.titleLabel = UILabel()
        self.titleLabel.text = "Super Slots"
        self.titleLabel.textColor = UIColor.yellowColor()
        self.titleLabel.font = UIFont(name: "MarkerFelt-Wide", size: 40)
        self.titleLabel.sizeToFit()
        self.titleLabel.center = containerView.center
        containerView.addSubview(self.titleLabel)
    }
    
    func setupSecondContainer(containerView: UIView) {
        
        self.removeSubviews(containerView)
    
        for var containerNumber = 0; containerNumber < kNumberOfContainers; ++containerNumber {
            
            for var slotNumber = 0; slotNumber < kNumberOfSlots; ++slotNumber {
                
                var cards:[Slot] = []
                var slotImageView = UIImageView()
                
                if (self.allCards.count != 0) {
                    cards = allCards[containerNumber]
                    slotImageView.image = cards[slotNumber].image
                } else {
                    slotImageView.image = UIImage(named: "Ace")
                }
                
                slotImageView.frame = CGRect(
                    x: containerView.bounds.origin.x + (containerView.bounds.width * CGFloat(containerNumber) * kThird),
                    y: containerView.bounds.origin.y + (containerView.bounds.height * CGFloat(slotNumber) * kThird),
                    width: containerView.bounds.width * kThird - kMarginForSlot,
                    height: containerView.bounds.height * kThird - kMarginForSlot)
                containerView.addSubview(slotImageView)
                
            }
            
        }

    }
    
    func setupThirdContainer(containerView: UIView) {
        
        self.creditsLabel = UILabel()
        self.creditsLabel.text = "000000"
        self.creditsLabel.textColor = UIColor.redColor()
        self.creditsLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.creditsLabel.sizeToFit()
        self.creditsLabel.center = CGPoint(
            x: containerView.frame.width * kSixth,
            y: containerView.frame.height * kThird)
        self.creditsLabel.textAlignment = NSTextAlignment.Center
        self.creditsLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(self.creditsLabel)
        
        self.betLabel = UILabel()
        self.betLabel.text = "0000"
        self.betLabel.textColor = UIColor.redColor()
        self.betLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.betLabel.sizeToFit()
        self.betLabel.center = CGPoint(
            x: containerView.frame.width * kSixth * 3,
            y: containerView.frame.height * kThird)
        self.betLabel.textAlignment = NSTextAlignment.Center
        self.betLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(self.betLabel)
        
        self.winnerPaidLabel = UILabel()
        self.winnerPaidLabel.text = "000000"
        self.winnerPaidLabel.textColor = UIColor.redColor()
        self.winnerPaidLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.winnerPaidLabel.sizeToFit()
        self.winnerPaidLabel.center = CGPoint(
            x: containerView.frame.width * kSixth * 5,
            y: containerView.frame.height * kThird)
        self.winnerPaidLabel.textAlignment = NSTextAlignment.Center
        self.winnerPaidLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(self.winnerPaidLabel)
        
        self.creditsTitleLabel = UILabel()
        self.creditsTitleLabel.text = "Credits"
        self.creditsTitleLabel.textColor = UIColor.blackColor()
        self.creditsTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 16)
        self.creditsTitleLabel.sizeToFit()
        self.creditsTitleLabel.center = CGPoint(
            x: containerView.frame.width * kSixth,
            y: containerView.frame.height * kThird * 2)
        self.creditsTitleLabel.textAlignment = NSTextAlignment.Center
        containerView.addSubview(self.creditsTitleLabel)
        
        self.betTitleLabel = UILabel()
        self.betTitleLabel.text = "Bet"
        self.betTitleLabel.textColor = UIColor.blackColor()
        self.betTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 16)
        self.betTitleLabel.sizeToFit()
        self.betTitleLabel.center = CGPoint(
            x: containerView.frame.width * kSixth * 3,
            y: containerView.frame.height * kThird * 2)
        self.betTitleLabel.textAlignment = NSTextAlignment.Center
        containerView.addSubview(self.betTitleLabel)
        
        self.winnderPaidTitleLabel = UILabel()
        self.winnderPaidTitleLabel.text = "Winner Paid"
        self.winnderPaidTitleLabel.textColor = UIColor.blackColor()
        self.winnderPaidTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 16)
        self.winnderPaidTitleLabel.sizeToFit()
        self.winnderPaidTitleLabel.center = CGPoint(
            x: containerView.frame.width * kSixth * 5,
            y: containerView.frame.height * kThird * 2)
        self.winnderPaidTitleLabel.textAlignment = NSTextAlignment.Center
        containerView.addSubview(self.winnderPaidTitleLabel)
        
    }
    
    func setupFourthContainer(containerView: UIView) {
        self.resetButton = UIButton()
        self.resetButton.setTitle("Reset", forState: .Normal)
        self.resetButton.backgroundColor = .darkGrayColor()
        self.resetButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        self.resetButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 16)
        self.resetButton.sizeToFit()
        self.resetButton.center = CGPoint(
            x: containerView.frame.width * kEight,
            y: containerView.frame.height * kHalf)
        self.resetButton.addTarget(self, action: "resetButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.resetButton)
        
        self.betOneButton = UIButton()
        self.betOneButton.setTitle("Bet One", forState: .Normal)
        self.betOneButton.backgroundColor = .greenColor()
        self.betOneButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        self.betOneButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 16)
        self.betOneButton.sizeToFit()
        self.betOneButton.center = CGPoint(
            x: containerView.frame.width * kEight * 3,
            y: containerView.frame.height * kHalf)
        self.betOneButton.addTarget(self, action: "betOneButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.betOneButton)
        
        self.betMaxButton = UIButton()
        self.betMaxButton.setTitle("Bet Max", forState: .Normal)
        self.betMaxButton.backgroundColor = .redColor()
        self.betMaxButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        self.betMaxButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 16)
        self.betMaxButton.sizeToFit()
        self.betMaxButton.center = CGPoint(
            x: containerView.frame.width * kEight * 5,
            y: containerView.frame.height * kHalf)
        self.betMaxButton.addTarget(self, action: "betMaxButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.betMaxButton)
        
        self.spinButton = UIButton()
        self.spinButton.setTitle("Spin", forState: .Normal)
        self.spinButton.backgroundColor = .greenColor()
        self.spinButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        self.spinButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 16)
        self.spinButton.sizeToFit()
        self.spinButton.center = CGPoint(
            x: containerView.frame.width * kEight * 7,
            y: containerView.frame.height * kHalf)
        self.spinButton.addTarget(self, action: "spinButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.spinButton)
        
        
    }
    
    func removeSubviews(containerView: UIView) {
        for view in containerView.subviews {
            view.removeFromSuperview()
        }
    }
    
    func hardReset() {
        self.credits = 50
        self.currentBet = 0
        self.winnings = 0
        allCards.removeAll(keepCapacity: true)
        setupSecondContainer(self.secondContainer)
        self.updateMainView()
    }
    
    func updateMainView() {
        self.creditsLabel.text = "\(self.credits)"
        self.betLabel.text = "\(self.currentBet)"
        self.winnerPaidLabel.text = "\(self.winnings)"
    }
    
    func showAlertWithText(header: String = "Warning", message: String) {
        
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    
    
    
    
}
