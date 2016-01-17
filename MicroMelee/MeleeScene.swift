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
        print("size: \(size.height), \(size.width)")
        for i in 0...399 {
            print("loop number: \(i)")
            let sprite = SKSpriteNode()
            let sSize = floor((size.height*0.96)/20)
            sprite.size = CGSizeMake(sSize, sSize)
            sprite.color = .blackColor()
            let xPos = Int(sSize)*((i%20))
            let yPos = Int(sSize)*((i)/20)
            sprite.position = CGPoint(x: xPos, y: yPos)
            print("position: \(sprite.size)")
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
