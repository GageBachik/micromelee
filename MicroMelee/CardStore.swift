//
//  CardStore.swift
//  MicroMelee
//
//  Created by Mikael Carpenter on 1/16/16.
//  Copyright © 2016 MG. All rights reserved.
//

import Foundation
import SpriteKit

class Card: SKSpriteNode {
    let id: Int
    let effect: String
    let cost: Int
    let action: () -> ()
    
    init(id: Int, effect: String, cost: Int, action: () -> ()) {
        self.id = id
        self.effect = effect
        self.cost = cost
        self.action = action
        super.init(texture: nil, color: .clearColor(), size: CGSizeMake(0, 0))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

func generateCard(cardId: Int, cardSize: CGSize, cardPosition: CGPoint) -> Card{
//    if cardId <= CardCollection.count - 1 {
//        
//    } else {
//        return SKSpriteNode()
//    }
    
    let card = CardCollection[cardId]
    card.size = cardSize
    card.color = UIColor(
        red: CGFloat(cardId*cardId),
        green: CGFloat(cardId*cardId),
        blue: CGFloat(cardId*cardId),
        alpha: 1
    )
    card.anchorPoint = CGPoint(x: 0, y: 0)
    card.position = cardPosition
    return card
}

var CardCollection: Array<Card> = [
    Pleb,
    Ranger,
    Fighter,
    BossMan,
    Rally,
    Shield,
    Bomb,
    Decoy,
    Turret,
    PlebFactory
]

// Template for new Cards
//
//let Placeholder = Card(
//    id: ,
//    effect: "",
//    cost: ,
//    action:
//)

let Pleb = Card(
    id: 0,
    effect: "Place a weak plebian warrior.",
    cost: 20,
    action: PlebAction
)

let Ranger = Card(
    id: 1,
    effect: "Place a weak ranged warrior.",
    cost: 25,
    action: RangerAction
)

let Fighter = Card(
    id: 2,
    effect: "Place a hand to hand brawler into battle.",
    cost: 80,
    action: FighterAction
)

let BossMan = Card(
    id: 3,
    effect: "Wreck faces with a heroic Boss Man.",
    cost: 160,
    action: BossManAction
)

let Rally = Card(
    id: 4,
    effect: "Place a rally point to direct your warriors",
    cost: 10,
    action: RallyAction
)

let Shield = Card(
    id: 5,
    effect: "Give a character or structure a small hp shield.",
    cost: 20,
    action: ShieldAction
)

let Bomb = Card(
    id: 6,
    effect: "Deal moderate damage in a small radius.",
    cost: 30,
    action: BombAction
)

let Decoy = Card(
    id: 7,
    effect: "Place a decoy that distracts enemy warriors.",
    cost: 30,
    action: DecoyAction
)

let Turret = Card(
    id: 8,
    effect: "Place a ranged turret to defend a small area",
    cost: 40,
    action: TurretAction
)

let PlebFactory = Card(
    id: 9,
    effect: "A structure that produces 1 Pleb every 5 seconds.",
    cost: 160,
    action: PlebFactoryAction
)