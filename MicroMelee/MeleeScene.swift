//
//  GameScene.swift
//  MicroMelee
//
//  Created by Christian Gage Bachik on 1/16/16.
//  Copyright (c) 2016 MG. All rights reserved.
//

import SpriteKit
import Foundation

extension CollectionType {
    /// Return a copy of `self` with its elements shuffled
    func shuffle() -> [Generator.Element] {
        var list = Array(self)
        list.shuffleInPlace()
        return list
    }
}

extension MutableCollectionType where Index == Int {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffleInPlace() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in 0..<count - 1 {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}

class MeleeScene: SKScene, SKPhysicsContactDelegate {
    
    let baseCategory: UInt32 = 0x1 << 1
    let playerCategory: UInt32 = 0x1 << 2
    let nothingCategory: UInt32 = 0x1 << 3
    /* Global Variables and Deck */
    var selectedCard: Card?
    var manaBar = SKSpriteNode()
    var manaLabel = SKLabelNode()
    var deck = [0,0,0,0,9,8,8,1,1,1,1,2,2,3,4,5,6,6,7,7].shuffle()
    var sSize = CGFloat()
    
    /* Game Functions */
    func drawCard(){
        selectedCard!.removeFromParent()
        if (deck.isEmpty == false){
            let newCardId = deck.removeFirst()
            let newCard = generateCard(newCardId, cardSize: selectedCard!.size, cardPosition: selectedCard!.position)
            addChild(newCard)
        }
    }
    
    override func didMoveToView(view: SKView) {
        
        self.physicsWorld.contactDelegate = self
        
        /* Creates Game Board */
        sSize = floor((size.height*1.00)/20)
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
        
        /* Adds Both Bases */
        let enemyBase = Building(team: 1, hp: 100)
        enemyBase.size = CGSizeMake(sSize*2, sSize*2)
        enemyBase.anchorPoint = CGPoint(x:0, y:0)
        enemyBase.color = .greenColor()
        enemyBase.name = "EnemyBase"
        enemyBase.position = CGPoint(x: offset + 14*sSize, y: size.height - offset - 2*sSize)
        enemyBase.physicsBody = SKPhysicsBody(rectangleOfSize: enemyBase.size, center: CGPointMake((enemyBase.size.width/2), (enemyBase.size.height/2)))
        if let physics = enemyBase.physicsBody {
            physics.affectedByGravity = false
            physics.allowsRotation = false
            physics.dynamic = true
            physics.pinned = true
            physics.linearDamping = 0.75
            physics.angularDamping = 0.75
            physics.categoryBitMask = baseCategory
            physics.contactTestBitMask = playerCategory
            physics.collisionBitMask = playerCategory
            
        }
        addChild(enemyBase)
        
        let myBase = Building(team: 0, hp: 100)
        myBase.size = CGSizeMake(sSize*2, sSize*2)
        myBase.anchorPoint = CGPoint(x:0, y:0)
        myBase.color = .purpleColor()
        myBase.name = "MyBase"
        myBase.position = CGPoint(x: offset + 14*sSize, y: offset)
        myBase.physicsBody = SKPhysicsBody(rectangleOfSize: myBase.size, center: CGPointMake((myBase.size.width/2), (myBase.size.height/2)))
        if let physics = myBase.physicsBody {
            physics.affectedByGravity = false
            physics.allowsRotation = false
            physics.dynamic = false
            physics.linearDamping = 0.75
            physics.angularDamping = 0.75
        }
        addChild(myBase)
        
        /* Generates the first four cards of your deck */
        let cardXPos = 2*offset + 30*sSize
        let cSize = sSize*4
        let card0 = generateCard(self.deck.removeFirst(), cardSize: CGSizeMake(cSize, cSize), cardPosition: CGPoint(x: cardXPos, y: offset))
        let card1 = generateCard(self.deck.removeFirst(), cardSize: CGSizeMake(cSize, cSize), cardPosition: CGPoint(x: cardXPos, y: cSize + 2*offset))
        let card2 = generateCard(self.deck.removeFirst(), cardSize: CGSizeMake(cSize, cSize), cardPosition: CGPoint(x: cardXPos, y: 2*cSize + 3*offset))
        let card3 = generateCard(self.deck.removeFirst(), cardSize: CGSizeMake(cSize, cSize), cardPosition: CGPoint(x: cardXPos, y: 3*cSize + 4*offset))
        addChild(card0)
        addChild(card1)
        addChild(card2)
        addChild(card3)
        
        /* Creates the Mana components */
        let maxManaHeight = size.height - offset*2
        manaBar.size = CGSizeMake(offset*2, maxManaHeight/10)
        manaBar.color = .blueColor()
        manaBar.anchorPoint = CGPoint(x: 0, y: 0)
        manaBar.name = "Mana Bar"
        manaBar.position = CGPoint(x: sSize*34 + offset*4, y: offset)
        addChild(manaBar)
        
        let totalMana = (manaBar.size.height/maxManaHeight) * 1000
        manaLabel.text = String(Int(totalMana))
        manaLabel.fontColor = .blackColor()
        manaLabel.verticalAlignmentMode = .Top
        manaLabel.horizontalAlignmentMode = .Left
        manaLabel.position = CGPoint(x: cardXPos, y: size.height - offset)
        addChild(manaLabel)
        
        /* Updates Mana over time */
        let manaTimer = SKAction.waitForDuration(1)
        let manaSizeChange = SKAction.runBlock {
            if self.manaBar.size.height < maxManaHeight {
                
                if let mana = Int(self.manaLabel.text!) {
                    if mana < 1000{
                        let newMana = mana + 5
                        self.manaLabel.text = "\(newMana)"
                    }
                }
                
                self.manaBar.size = CGSizeMake(offset*2, self.manaBar.size.height + maxManaHeight/200)
                
            }
        }
        manaBar.runAction(SKAction.repeatActionForever(SKAction.sequence([manaTimer, manaSizeChange])))
    }
    
    func spawnMonster(mon:SKSpriteNode){
        let enemyBase = self.childNodeWithName("EnemyBase") as! SKSpriteNode
        let xTarget = enemyBase.position.x + ((enemyBase.size.width - mon.size.width)/2)
        let yTarget = enemyBase.position.y - mon.size.height
        let moveBottomLeft = SKAction.moveTo(CGPoint(x: xTarget, y: yTarget), duration:5.0)
        mon.runAction(moveBottomLeft)
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        for touch in touches{
            let positionInScene = touch.locationInNode(self)
            let touchedNode = self.nodeAtPoint(positionInScene)
            if let sprite = touchedNode as? Card {
                selectedCard = sprite
            }
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches{
            let positionInScene = touch.locationInNode(self)
            let touchedNode = self.nodeAtPoint(positionInScene)
            if let name = touchedNode.name {
                if name.rangeOfString("sprite") != nil {
                    let id = name.substringFromIndex(name.startIndex.advancedBy(6))
                    if Int(id) <= 299 {
                        
                        /* Calls the card function when played on the board */
                        if let cost = selectedCard?.cost {
                            let ppm = self.manaBar.size.height / CGFloat(Float(self.manaLabel.text!)!)
                            let manaCost = CGFloat(cost) * ppm
                            if manaBar.size.height > manaCost {
                                if selectedCard!.type == "monster" {
                                    let monster = selectedCard!.monsterAction!(size: CGSizeMake(sSize, sSize), position: touchedNode.position)
                                    print("hp: \(monster.hp) atk: \(monster.atk)")
                                    manaBar.size.height -= manaCost
                                    let newVal = Int(manaLabel.text!)! - cost
                                    manaLabel.text = "\(newVal)"
                                    let body1 = SKPhysicsBody(rectangleOfSize: monster.size, center: CGPointMake((monster.size.width/2), (monster.size.height/2)))
                                    let vision = CGSize(width: monster.size.width*2, height: monster.size.height*2)
                                    let body2 = SKPhysicsBody(rectangleOfSize: vision, center: CGPointMake((monster.size.width/2), (monster.size.height/2)))
                                    body2.categoryBitMask = playerCategory
                                    body2.contactTestBitMask = baseCategory
                                    body2.collisionBitMask = baseCategory
                                    monster.physicsBody = SKPhysicsBody(bodies: [body1, body2])
                                    if let physics = monster.physicsBody {
                                        physics.affectedByGravity = false
                                        physics.allowsRotation = true
                                        physics.dynamic = true
                                        physics.usesPreciseCollisionDetection = true
                                        physics.linearDamping = 0.75
                                        physics.angularDamping = 0.75
                                    }
                                    addChild(monster)
                                    spawnMonster(monster)
                                    drawCard()
                                } else if selectedCard!.type == "spell" {
                                    let spell = selectedCard!.spellAction!(size: CGSizeMake(sSize, sSize), position: touchedNode.position)
                                    print("hp: \(spell.hp)")
                                    manaBar.size.height -= manaCost
                                    let newVal = Int(manaLabel.text!)! - cost
                                    manaLabel.text = "\(newVal)"
                                    addChild(spell)
                                    drawCard()
                                }else if selectedCard!.type == "structure" {
                                    let structure = selectedCard!.structureAction!(size: CGSizeMake(sSize, sSize), position: touchedNode.position)
                                    print("hp: \(structure.hp)")
                                    manaBar.size.height -= manaCost
                                    let newVal = Int(manaLabel.text!)! - cost  
                                    manaLabel.text = "\(newVal)"
                                    structure.physicsBody = SKPhysicsBody(rectangleOfSize: structure.size, center: CGPointMake((structure.size.width/2), (structure.size.height/2)))
                                    if let physics = structure.physicsBody {
                                        physics.affectedByGravity = false
                                        physics.allowsRotation = false
                                        physics.dynamic = true
                                        physics.linearDamping = 0.75
                                        physics.angularDamping = 0.75
                                    }
                                    addChild(structure)
                                    drawCard()
                                }
                            }
                        }
                        
                    }
                }else {
                    /* Deals damage to sprites on click */
                    if let monster = touchedNode as? Monster {
                        if monster.hp > 5 {
                            monster.hp -= 5
                            print("New Monster HP: \(monster.hp)")
                        } else {
                            monster.removeFromParent()
                            print("\(monster.name) destroyed.")
                        }
                    }else if let spell = touchedNode as? Spell {
                        if spell.hp > 5 {
                            spell.hp -= 5
                            print("New Spell HP: \(spell.hp)")
                        } else {
                            spell.removeFromParent()
                            print("\(spell.name) destroyed.")
                        }
                    }else if let building = touchedNode as? Building {
                        if building.hp > 5 {
                            building.hp -= 5
                            print("New Building HP: \(building.hp)")
                        } else {
                            building.removeFromParent()
                            print("\(building.name) destroyed.")
                        }
                    }
                }
            }
        }
        selectedCard = nil
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        print("Contact: \(contact)")
    }
}
