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


func PlebAction (size: CGSize, position: CGPoint) {
    print("Played Pleb. size:\(size) pos:\(position)")
}

func RangerAction (size: CGSize, position: CGPoint) {
    print("Played Ranger.")
}

func FighterAction (size: CGSize, position: CGPoint) {
    print("Played Fighter.")
}

func BossManAction (size: CGSize, position: CGPoint) {
    print("Played BossMan.")
}

func RallyAction (size: CGSize, position: CGPoint) {
    print("Played Rally.")
}

func ShieldAction (size: CGSize, position: CGPoint) {
    print("Played Shield.")
}

func BombAction (size: CGSize, position: CGPoint) {
    print("Played Bomb.")
}

func DecoyAction (size: CGSize, position: CGPoint) {
    print("Played Decoy.")
}

func TurretAction (size: CGSize, position: CGPoint) {
    print("Played Turret.")
}

func PlebFactoryAction (size: CGSize, position: CGPoint) {
    print("Played Fleb Factory.")
}