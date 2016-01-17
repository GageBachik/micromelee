//
//  ActionStore.swift
//  MicroMelee
//
//  Created by Mikael Carpenter on 1/16/16.
//  Copyright © 2016 MG. All rights reserved.
//

import Foundation
import SpriteKit

//let monster = SKSpriteNode()
//monster.size = CGSizeMake(20, 20)
//monster.color = .blackColor()
//monster.anchorPoint = CGPoint(x: 0,y: 0)
//monster.name = "NiggaMon"
//monster.position = touchedNode.position
//let cost = 20*ppm
//if manaBar.size.height > cost {
//    addChild(monster)
//    manaBar.size.height -= cost
//    let newVal = Int(manaLabel.text!)! - 20
//    manaLabel.text = "\(newVal)"
//    drawCard()
//}


func PlebAction (size: CGSize, position: CGPoint) -> SKSpriteNode {
    print("Played Pleb. size:\(size) pos:\(position)")
    return SKSpriteNode()
}

func RangerAction (size: CGSize, position: CGPoint) -> SKSpriteNode {
    print("Played Ranger.")
    return SKSpriteNode()
}

func FighterAction (size: CGSize, position: CGPoint) -> SKSpriteNode {
    print("Played Fighter.")
    return SKSpriteNode()
}

func BossManAction (size: CGSize, position: CGPoint) -> SKSpriteNode {
    print("Played BossMan.")
    return SKSpriteNode()
}

func RallyAction (size: CGSize, position: CGPoint) -> SKSpriteNode {
    print("Played Rally.")
    return SKSpriteNode()
}

func ShieldAction (size: CGSize, position: CGPoint) -> SKSpriteNode {
    print("Played Shield.")
    return SKSpriteNode()
}

func BombAction (size: CGSize, position: CGPoint) -> SKSpriteNode {
    print("Played Bomb.")
    return SKSpriteNode()
}

func DecoyAction (size: CGSize, position: CGPoint) -> SKSpriteNode {
    print("Played Decoy.")
    return SKSpriteNode()
}

func TurretAction (size: CGSize, position: CGPoint) -> SKSpriteNode {
    print("Played Turret.")
    return SKSpriteNode()
}

func PlebFactoryAction (size: CGSize, position: CGPoint) -> SKSpriteNode {
    print("Played Fleb Factory.")
    return SKSpriteNode()
}