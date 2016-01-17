//
//  GameScene.swift
//  MicroMelee
//
//  Created by Christian Gage Bachik on 1/16/16.
//  Copyright (c) 2016 MG. All rights reserved.
//

import SpriteKit

class MeleeScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        for i in 1...400 {
            let floatI = CGFloat(i)
            let sprite = SKSpriteNode()
            sprite.xScale = (size.height*0.96)/20
            sprite.yScale = (size.height*0.96)/20
            sprite.color = .blackColor()
            let xPos = sprite.xScale*((floatI%20)-1)
            let yPos = sprite.yScale*((floatI-1)/20)
            sprite.position = CGPoint(x: xPos, y: yPos)
            addChild(sprite)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
