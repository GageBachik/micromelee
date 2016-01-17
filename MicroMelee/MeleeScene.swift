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
        card.size = CGSizeMake(sSize*5, sSize*7)
        card.color = .blackColor()
        card.anchorPoint = CGPoint(x: 0,y: 0)
        card.name = "Nigga"
        card.position = CGPoint(x: 560, y: 230)
        addChild(card)
        
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
                if name.rangeOfString("sprite") != nil && selectedCard == "Nigga"{
                    let monster = SKSpriteNode()
                    monster.size = CGSizeMake(20, 20)
                    monster.color = .blackColor()
                    monster.anchorPoint = CGPoint(x: 0,y: 0)
                    monster.name = "NiggaMon"
                    monster.position = touchedNode.position
                    addChild(monster)
                }
            }
        }
        selectedCard = ""
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
