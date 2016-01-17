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
    let type: String
    let effect: String
    let cost: Int
    let action: (size: CGSize, position: CGPoint) -> (SKSpriteNode)
    
    init(id: Int, name: String, type: String, effect: String, cost: Int, action: (size: CGSize, position: CGPoint) -> (SKSpriteNode)) {
        self.id = id
        self.type = type
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
        let copy = Card(id: id, name: name!, type: type, effect: effect, cost: cost, action: action)
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
    type: "monster",
    effect: "Place a weak plebian warrior.",
    cost: 20,
    action: PlebAction
)

let Ranger = Card(
    id: 1,
    name: "Ranger",
    type: "monster",
    effect: "Place a weak ranged warrior.",
    cost: 25,
    action: RangerAction
)

let Fighter = Card(
    id: 2,
    name: "Fighter",
    type: "monster",
    effect: "Place a hand to hand brawler into battle.",
    cost: 80,
    action: FighterAction
)

let BossMan = Card(
    id: 3,
    name: "BossMan",
    type: "monster",
    effect: "Wreck faces with a heroic Boss Man.",
    cost: 160,
    action: BossManAction
)

let Rally = Card(
    id: 4,
    name: "Rally",
    type: "spell",
    effect: "Place a rally point to direct your warriors",
    cost: 10,
    action: RallyAction
)

let Shield = Card(
    id: 5,
    name: "Shield",
    type: "spell",
    effect: "Give a character or structure a small hp shield.",
    cost: 20,
    action: ShieldAction
)

let Bomb = Card(
    id: 6,
    name: "Bomb",
    type: "spell",
    effect: "Deal moderate damage in a small radius.",
    cost: 30,
    action: BombAction
)

let Decoy = Card(
    id: 7,
    name: "Decoy",
    type: "structure",
    effect: "Place a decoy that distracts enemy warriors.",
    cost: 30,
    action: DecoyAction
)

let Turret = Card(
    id: 8,
    name: "Turret",
    type: "structure",
    effect: "Place a ranged turret to defend a small area",
    cost: 40,
    action: TurretAction
)

let PlebFactory = Card(
    id: 9,
    name: "PlebFactory",
    type: "structure",
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
    let cIdFloated = CGFloat(cardId)
    let range = ((((cIdFloated+1 * cIdFloated) / 100) * 255) / 100)
    card.color = UIColor(
        red: range,
        green: range*2,
        blue: range*3,
        alpha: 1
    )
    print("Name: \(card.name!) Color: \(card.color)")
    card.anchorPoint = CGPoint(x: 0, y: 0)
    return card
}

