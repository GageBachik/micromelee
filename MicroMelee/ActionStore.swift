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

class Monster: SKSpriteNode {
    let hp: Int
    let atk: Int
    let vis: Int
    let range: Int
    
    init(hp: Int, atk: Int, vis: Int, range: Int) {
        self.hp = hp
        self.atk = atk
        self.vis = vis
        self.range = range
        
        super.init(texture: nil, color: UIColor.clearColor(), size: CGSizeMake(0, 0))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class Spell: SKSpriteNode {
    let hp: Int
    
    init(hp: Int) {
        self.hp = hp
        
        super.init(texture: nil, color: UIColor.clearColor(), size: CGSizeMake(0, 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class Structure: SKSpriteNode {
    let hp: Int
    
    init(hp: Int) {
        self.hp = hp
        
        super.init(texture: nil, color: UIColor.clearColor(), size: CGSizeMake(0, 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


func PlebAction (size: CGSize, position: CGPoint) -> Monster {
    print("Played Pleb.")
    let sprite = Monster(hp: 15, atk: 2, vis: 8, range: 1)
    sprite.size = size
    sprite.position = position
    sprite.anchorPoint = CGPoint(x: 0, y: 0)
    sprite.color = .blackColor()
    sprite.name = "Pleb"
    return sprite
}

func RangerAction (size: CGSize, position: CGPoint) -> Monster {
    print("Played Ranger.")
    let sprite = Monster(hp: 10, atk: 3, vis: 8, range: 6)
    sprite.size = size
    sprite.position = position
    sprite.anchorPoint = CGPoint(x: 0, y: 0)
    sprite.color = .whiteColor()
    sprite.name = "Ranger"
    return sprite
}

func FighterAction (size: CGSize, position: CGPoint) -> Monster {
    print("Played Fighter.")
    let sprite = Monster(hp: 30, atk: 5, vis: 6, range: 1)
    sprite.size = size
    sprite.position = position
    sprite.anchorPoint = CGPoint(x: 0, y: 0)
    sprite.color = .blueColor()
    sprite.name = "Fighter"
    return sprite
}

func BossManAction (size: CGSize, position: CGPoint) -> Monster {
    print("Played BossMan.")
    let sprite = Monster(hp: 60, atk: 12, vis: 4, range: 3)
    sprite.size = size
    sprite.position = position
    sprite.anchorPoint = CGPoint(x: 0, y: 0)
    sprite.color = .yellowColor()
    sprite.name = "BossMan"
    return sprite
}

func RallyAction (size: CGSize, position: CGPoint) -> Spell {
    print("Played Rally.")
    let sprite = Spell(hp: 10)
    sprite.size = size
    sprite.position = position
    sprite.anchorPoint = CGPoint(x: 0, y: 0)
    sprite.color = .orangeColor()
    sprite.name = "Rally"
    return sprite
}

func ShieldAction (size: CGSize, position: CGPoint) -> Spell {
    print("Played Shield.")
    let sprite = Spell(hp: 20)
    sprite.size = size
    sprite.position = position
    sprite.anchorPoint = CGPoint(x: 0, y: 0)
    sprite.color = .orangeColor()
    sprite.name = "Shield"
    return sprite
}

func BombAction (size: CGSize, position: CGPoint) -> Spell {
    print("Played Bomb.")
    let sprite = Spell(hp: 30)
    sprite.size = size
    sprite.position = position
    sprite.anchorPoint = CGPoint(x: 0, y: 0)
    sprite.color = .orangeColor()
    sprite.name = "Bomb"
    return sprite
}

func DecoyAction (size: CGSize, position: CGPoint) -> Structure {
    print("Played Decoy.")
    let sprite = Structure(hp: 40)
    sprite.size = size
    sprite.position = position
    sprite.anchorPoint = CGPoint(x: 0, y: 0)
    sprite.color = .brownColor()
    sprite.name = "Decoy"
    return sprite
}

func TurretAction (size: CGSize, position: CGPoint) -> Structure {
    print("Played Turret.")
    let sprite = Structure(hp: 60)
    sprite.size = size
    sprite.position = position
    sprite.anchorPoint = CGPoint(x: 0, y: 0)
    sprite.color = .brownColor()
    sprite.name = "Turret"
    return sprite
}

func PlebFactoryAction (size: CGSize, position: CGPoint) -> Structure {
    print("Played Pleb Factory.")
    let sprite = Structure(hp: 120)
    sprite.size = size
    sprite.position = position
    sprite.anchorPoint = CGPoint(x: 0, y: 0)
    sprite.color = .brownColor()
    sprite.name = "PlebFactory"
    return sprite
}