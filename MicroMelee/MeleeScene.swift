//
//  GameScene.swift
//  MicroMelee
//
//  Created by Christian Gage Bachik on 1/16/16.
//  Copyright (c) 2016 MG. All rights reserved.
//

import SpriteKit

class MeleeScene: SKScene {
    
    var selectedCard:String = ""
    var manaBar = SKSpriteNode()
    var manaLabel = SKLabelNode()
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let sSize = floor((size.height*1.00)/20)
        let offset = (size.height-(sSize*20))/2
        for i in 0...599 {
            let sprite = SKSpriteNode()
            sprite.size = CGSizeMake(sSize, sSize)
            sprite.color = .redColor()
            sprite.name = "sprite\(i)"
            sprite.anchorPoint = CGPoint(x:0,y:0)
            let xPos = (Int(sSize)*((i%30)))+Int(offset)
            let yPos = (Int(sSize)*((i)/30))+Int(offset)
            sprite.position = CGPoint(x: xPos, y: yPos)
            addChild(sprite)
        }
        
        let cardXPos = 2*offset + 30*sSize
        
        let card = SKSpriteNode()
        let cSize = sSize*4
        card.size = CGSizeMake(cSize, cSize)
        card.color = .blackColor()
        card.anchorPoint = CGPoint(x: 0,y: 0)
        card.name = "Nigga"
        card.position = CGPoint(x: cardXPos, y: offset)
        addChild(card)
        
        let card2 = SKSpriteNode()
        card2.size = CGSizeMake(cSize, cSize)
        card2.color = .whiteColor()
        card2.anchorPoint = CGPoint(x: 0,y: 0)
        card2.name = "White"
        card2.position = CGPoint(x: cardXPos, y: cSize + 2*offset)
        addChild(card2)
        
        let card3 = SKSpriteNode()
        card3.size = CGSizeMake(cSize, cSize)
        card3.color = .greenColor()
        card3.anchorPoint = CGPoint(x: 0,y: 0)
        card3.name = "Green"
        card3.position = CGPoint(x: cardXPos, y: 2*cSize + 3*offset)
        addChild(card3)
        
        let card4 = SKSpriteNode()
        card4.size = CGSizeMake(cSize, cSize)
        card4.color = .yellowColor()
        card4.anchorPoint = CGPoint(x: 0,y: 0)
        card4.name = "Yellow"
        card4.position = CGPoint(x: cardXPos, y: 3*cSize + 4*offset)
        addChild(card4)
        
        let maxManaHeight = size.height - offset*2
        manaBar.size = CGSizeMake(offset*2, maxManaHeight/10)
        manaBar.color = .blueColor()
        manaBar.anchorPoint = CGPoint(x: 0, y: 0)
        manaBar.name = "Mana Bar"
        manaBar.position = CGPoint(x: sSize*34 + offset*4, y: offset)
        addChild(manaBar)
        
        let totalMana = (manaBar.size.height/maxManaHeight) * 1000
        manaLabel.text = String(Int(totalMana))
        manaLabel.fontColor = .blackColor()
        manaLabel.verticalAlignmentMode = .Top
        manaLabel.horizontalAlignmentMode = .Left
        manaLabel.position = CGPoint(x: cardXPos, y: size.height - offset)
        addChild(manaLabel)
        
        let manaTimer = SKAction.waitForDuration(1)
        let manaSizeChange = SKAction.runBlock {
            if self.manaBar.size.height != maxManaHeight {
                self.manaBar.size = CGSizeMake(offset*2, self.manaBar.size.height + maxManaHeight/200)
                let newTotalMana = (self.manaBar.size.height/maxManaHeight) * 1000
                self.manaLabel.text = String(Int(newTotalMana))
            }
        }
        manaBar.runAction(SKAction.repeatActionForever(SKAction.sequence([manaTimer, manaSizeChange])))
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        for touch in touches{
            let positionInScene = touch.locationInNode(self)
            let touchedNode = self.nodeAtPoint(positionInScene)
            if let name = touchedNode.name {
                print("name:\(name)")
                selectedCard = name
            }
            
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches{
            let positionInScene = touch.locationInNode(self)
            let touchedNode = self.nodeAtPoint(positionInScene)
            print("position:\(touchedNode.position)")
            if let name = touchedNode.name {
                if name.rangeOfString("sprite") != nil {
                    let id = name.substringFromIndex(name.startIndex.advancedBy(6))
                    print("id: \(id)")
                    if Int(id) <= 299 {
                        
                        if selectedCard == "Nigga"{
                            let monster = SKSpriteNode()
                            monster.size = CGSizeMake(20, 20)
                            monster.color = .blackColor()
                            monster.anchorPoint = CGPoint(x: 0,y: 0)
                            monster.name = "NiggaMon"
                            monster.position = touchedNode.position
                            let ppm = manaBar.size.height/CGFloat((manaLabel.text! as NSString).floatValue)
                            let cost = 20*ppm
                            if manaBar.size.height > cost {
                                addChild(monster)
                                manaBar.size.height -= cost
                            }
                        }else if selectedCard == "White" {
                            let monster = SKSpriteNode()
                            monster.size = CGSizeMake(20, 20)
                            monster.color = .whiteColor()
                            monster.anchorPoint = CGPoint(x: 0,y: 0)
                            monster.name = "WhiteMon"
                            monster.position = touchedNode.position
                            let ppm = manaBar.size.height/CGFloat((manaLabel.text! as NSString).floatValue)
                            let cost = 30*ppm
                            if manaBar.size.height > cost {
                                addChild(monster)
                                manaBar.size.height -= cost
                            }
                        }else if selectedCard == "Green" {
                            let monster = SKSpriteNode()
                            monster.size = CGSizeMake(20, 20)
                            monster.color = .greenColor()
                            monster.anchorPoint = CGPoint(x: 0,y: 0)
                            monster.name = "GreenMon"
                            monster.position = touchedNode.position
                            let ppm = manaBar.size.height/CGFloat((manaLabel.text! as NSString).floatValue)
                            let cost = 80*ppm
                            if manaBar.size.height > cost {
                                addChild(monster)
                                manaBar.size.height -= cost
                            }
                        }else if selectedCard == "Yellow" {
                            let monster = SKSpriteNode()
                            monster.size = CGSizeMake(20, 20)
                            monster.color = .yellowColor()
                            monster.anchorPoint = CGPoint(x: 0,y: 0)
                            monster.name = "YellowMon"
                            monster.position = touchedNode.position
                            let ppm = manaBar.size.height/CGFloat((manaLabel.text! as NSString).floatValue)
                            let cost = 200*ppm
                            if manaBar.size.height > cost {
                                addChild(monster)
                                manaBar.size.height -= cost
                            }
                        }
                        
                    }
                }
            }
        }
        selectedCard = ""
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
