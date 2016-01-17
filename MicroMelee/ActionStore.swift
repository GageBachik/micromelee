//
//  ActionStore.swift
//  MicroMelee
//
//  Created by Mikael Carpenter on 1/16/16.
//  Copyright © 2016 MG. All rights reserved.
//

import Foundation
import SpriteKit

/* Our game board sprite classes */

class Monster: SKSpriteNode {
    let team: Int
    var hp: Int
    var atk: Int
    var vis: Int
    var range: Int
    
    init(team: Int, hp: Int, atk: Int, vis: Int, range: Int) {
        self.team = team
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
    let team: Int
    var hp: Int
    
    init(team: Int, hp: Int) {
        self.team = team
        self.hp = hp
        
        super.init(texture: nil, color: UIColor.clearColor(), size: CGSizeMake(0, 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class Building: SKSpriteNode {
    let team: Int
    var hp: Int
    
    init(team: Int, hp: Int) {
        self.team = team
        self.hp = hp
        
        super.init(texture: nil, color: UIColor.clearColor(), size: CGSizeMake(0, 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

/* Custom Functions for each card in the game */

func PlebAction (size: CGSize, position: CGPoint) -> Monster {
    print("Played Pleb.")
    let sprite = Monster(team: 0, hp: 15, atk: 2, vis: 8, range: 1)
    sprite.size = size
    sprite.position = position
    sprite.anchorPoint = CGPoint(x: 0, y: 0)
    sprite.color = .blackColor()
    sprite.name = "Pleb"
    return sprite
}

func RangerAction (size: CGSize, position: CGPoint) -> Monster {
    print("Played Ranger.")
    let sprite = Monster(team: 0, hp: 10, atk: 3, vis: 8, range: 6)
    sprite.size = size
    sprite.position = position
    sprite.anchorPoint = CGPoint(x: 0, y: 0)
    sprite.color = .whiteColor()
    sprite.name = "Ranger"
    return sprite
}

func FighterAction (size: CGSize, position: CGPoint) -> Monster {
    print("Played Fighter.")
    let sprite = Monster(team: 0, hp: 30, atk: 5, vis: 6, range: 1)
    sprite.size = size
    sprite.position = position
    sprite.anchorPoint = CGPoint(x: 0, y: 0)
    sprite.color = .blueColor()
    sprite.name = "Fighter"
    return sprite
}

func BossManAction (size: CGSize, position: CGPoint) -> Monster {
    print("Played BossMan.")
    let sprite = Monster(team: 0, hp: 60, atk: 12, vis: 4, range: 3)
    sprite.size = size
    sprite.position = position
    sprite.anchorPoint = CGPoint(x: 0, y: 0)
    sprite.color = .yellowColor()
    sprite.name = "BossMan"
    return sprite
}

func RallyAction (size: CGSize, position: CGPoint) -> Spell {
    print("Played Rally.")
    let sprite = Spell(team: 0, hp: 10)
    sprite.size = size
    sprite.position = position
    sprite.anchorPoint = CGPoint(x: 0, y: 0)
    sprite.color = .orangeColor()
    sprite.name = "Rally"
    return sprite
}

func ShieldAction (size: CGSize, position: CGPoint) -> Spell {
    print("Played Shield.")
    let sprite = Spell(team: 0, hp: 20)
    sprite.size = size
    sprite.position = position
    sprite.anchorPoint = CGPoint(x: 0, y: 0)
    sprite.color = .orangeColor()
    sprite.name = "Shield"
    return sprite
}

func BombAction (size: CGSize, position: CGPoint) -> Spell {
    print("Played Bomb.")
    let sprite = Spell(team: 0, hp: 30)
    sprite.size = size
    sprite.position = position
    sprite.anchorPoint = CGPoint(x: 0, y: 0)
    sprite.color = .orangeColor()
    sprite.name = "Bomb"
    return sprite
}

func DecoyAction (size: CGSize, position: CGPoint) -> Building {
    print("Played Decoy.")
    let sprite = Building(team: 0, hp: 40)
    sprite.size = size
    sprite.position = position
    sprite.anchorPoint = CGPoint(x: 0, y: 0)
    sprite.color = .brownColor()
    sprite.name = "Decoy"
    return sprite
}

func TurretAction (size: CGSize, position: CGPoint) -> Building {
    print("Played Turret.")
    let sprite = Building(team: 0, hp: 60)
    sprite.size = size
    sprite.position = position
    sprite.anchorPoint = CGPoint(x: 0, y: 0)
    sprite.color = .brownColor()
    sprite.name = "Turret"
    return sprite
}

func PlebFactoryAction (size: CGSize, position: CGPoint) -> Building {
    print("Played Pleb Factory.")
    let sprite = Building(team: 0, hp: 120)
    sprite.size = size
    sprite.position = position
    sprite.anchorPoint = CGPoint(x: 0, y: 0)
    sprite.color = .brownColor()
    sprite.name = "PlebFactory"
    return sprite
}