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
    
    init(id: Int, name: String, effect: String, cost: Int, action: () -> ()) {
        self.id = id
        self.effect = effect
        self.cost = cost
        self.action = action
        super.init(texture: nil, color: UIColor.clearColor(), size: CGSizeMake(0, 0))
        self.name = name
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func copyWithZone(zone: NSZone) -> AnyObject {
        let copy = Card(id: id, name: name!, effect: effect, cost: cost, action: action)
        return copy
    }
}

// Template for new Cards
//
//let Placeholder = Card(
//    id: ,
//    name: "",
//    effect: "",
//    cost: ,self.name = name
//    action:
//)

let Pleb = Card(
    id: 0,
    name: "Pleb",
    effect: "Place a weak plebian warrior.",
    cost: 20,
    action: PlebAction
)

let Ranger = Card(
    id: 1,
    name: "Ranger",
    effect: "Place a weak ranged warrior.",
    cost: 25,
    action: RangerAction
)

let Fighter = Card(
    id: 2,
    name: "Fighter",
    effect: "Place a hand to hand brawler into battle.",
    cost: 80,
    action: FighterAction
)

let BossMan = Card(
    id: 3,
    name: "BossMan",
    effect: "Wreck faces with a heroic Boss Man.",
    cost: 160,
    action: BossManAction
)

let Rally = Card(
    id: 4,
    name: "Rally",
    effect: "Place a rally point to direct your warriors",
    cost: 10,
    action: RallyAction
)

let Shield = Card(
    id: 5,
    name: "Shield",
    effect: "Give a character or structure a small hp shield.",
    cost: 20,
    action: ShieldAction
)

let Bomb = Card(
    id: 6,
    name: "Bomb",
    effect: "Deal moderate damage in a small radius.",
    cost: 30,
    action: BombAction
)

let Decoy = Card(
    id: 7,
    name: "Decoy",
    effect: "Place a decoy that distracts enemy warriors.",
    cost: 30,
    action: DecoyAction
)

let Turret = Card(
    id: 8,
    name: "Turret",
    effect: "Place a ranged turret to defend a small area",
    cost: 40,
    action: TurretAction
)

let PlebFactory = Card(
    id: 9,
    name: "PlebFactory",
    effect: "A structure that produces 1 Pleb every 5 seconds.",
    cost: 160,
    action: PlebFactoryAction
)

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

func generateCard(cardId: Int, cardSize: CGSize, cardPosition: CGPoint) -> Card {
    let card = CardCollection[cardId].copy() as! Card
    card.size = cardSize
    card.position = cardPosition
//    card.color = UIColor(
//        red: CGFloat((cardId + 5) * cardId),
//        green: CGFloat((cardId + 5) * cardId),
//        blue: CGFloat((cardId + 5) * cardId),
//        alpha: 1
//    )
    card.color = .whiteColor()
    card.anchorPoint = CGPoint(x: 0, y: 0)
    return card
}

