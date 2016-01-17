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
        
        let card = SKSpriteNode()
        let cSize = sSize*4
        card.size = CGSizeMake(cSize, cSize)
        card.color = .blackColor()
        card.anchorPoint = CGPoint(x: 0,y: 0)
        card.name = "Nigga"
        card.position = CGPoint(x: size.width - cSize - 7, y: size.height - cSize - 7)
        addChild(card)
        
        let card2 = SKSpriteNode()
        card2.size = CGSizeMake(cSize, cSize)
        card2.color = .blueColor()
        card2.anchorPoint = CGPoint(x: 0,y: 0)
        card2.name = "Blue"
        card2.position = CGPoint(x: size.width - cSize - 7, y: size.height - (card.size.height + 5) - cSize - 7)
        addChild(card2)
        
        let card3 = SKSpriteNode()
        card3.size = CGSizeMake(cSize, cSize)
        card3.color = .greenColor()
        card3.anchorPoint = CGPoint(x: 0,y: 0)
        card3.name = "Green"
        card3.position = CGPoint(x: size.width - cSize - 7, y: size.height - (card.size.height*2 + 10) - cSize - 7)
        addChild(card3)
        
        let card4 = SKSpriteNode()
        card4.size = CGSizeMake(cSize, cSize)
        card4.color = .yellowColor()
        card4.anchorPoint = CGPoint(x: 0,y: 0)
        card4.name = "Yellow"
        card4.position = CGPoint(x: size.width - cSize - 7, y: size.height - (card.size.height*3 + 15) - cSize - 7)
        addChild(card4)
        
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
                            addChild(monster)
                        }else if selectedCard == "Blue" {
                            let monster = SKSpriteNode()
                            monster.size = CGSizeMake(20, 20)
                            monster.color = .blueColor()
                            monster.anchorPoint = CGPoint(x: 0,y: 0)
                            monster.name = "BlueMon"
                            monster.position = touchedNode.position
                            addChild(monster)
                        }else if selectedCard == "Green" {
                            let monster = SKSpriteNode()
                            monster.size = CGSizeMake(20, 20)
                            monster.color = .greenColor()
                            monster.anchorPoint = CGPoint(x: 0,y: 0)
                            monster.name = "GreenMon"
                            monster.position = touchedNode.position
                            addChild(monster)
                        }else if selectedCard == "Yellow" {
                            let monster = SKSpriteNode()
                            monster.size = CGSizeMake(20, 20)
                            monster.color = .yellowColor()
                            monster.anchorPoint = CGPoint(x: 0,y: 0)
                            monster.name = "YellowMon"
                            monster.position = touchedNode.position
                            addChild(monster)
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
