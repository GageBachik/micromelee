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

class MeleeScene: SKScene {
    
    var selectedCard: Card?
    var manaBar = SKSpriteNode()
    var manaLabel = SKLabelNode()
    var deck = [0,0,0,0,9,8,8,1,1,1,1,2,2,3,4,5,6,6,7,7].shuffle()
    var sSize = CGFloat()
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
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
        
        let cardXPos = 2*offset + 30*sSize
        let cSize = sSize*4
        let card0 = generateCard(self.deck.removeFirst(), cardSize: CGSizeMake(cSize, cSize), cardPosition: CGPoint(x: cardXPos, y: offset))
        let card1 = generateCard(self.deck.removeFirst(), cardSize: CGSizeMake(cSize, cSize), cardPosition: CGPoint(x: cardXPos, y: cSize + 2*offset))
        let card2 = generateCard(self.deck.removeFirst(), cardSize: CGSizeMake(cSize, cSize), cardPosition: CGPoint(x: cardXPos, y: 2*cSize + 3*offset))
        let card3 = generateCard(self.deck.removeFirst(), cardSize: CGSizeMake(cSize, cSize), cardPosition: CGPoint(x: cardXPos, y: 3*cSize + 4*offset))
        print("card: \(card0)")
        print("card: \(card1)")
        print("card: \(card2)")
        print("card: \(card3)")
        addChild(card0)
        addChild(card1)
        addChild(card2)
        addChild(card3)
        
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
    
    func drawCard(){
        selectedCard!.removeFromParent()
        if (deck.isEmpty == false){
            let newCardId = deck.removeFirst()
            let newCard = generateCard(newCardId, cardSize: selectedCard!.size, cardPosition: selectedCard!.position)
            addChild(newCard)
        }
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
                        if let cost = selectedCard?.cost {
                            let ppm = self.manaBar.size.height / CGFloat(Float(self.manaLabel.text!)!)
                            let manaCost = CGFloat(cost) * ppm
                            if manaBar.size.height > manaCost {
                                if selectedCard!.type == "monster" {
                                    let monster = selectedCard!.monsterAction!(size: CGSizeMake(sSize, sSize), position: touchedNode.position)
                                    print("monster: \(monster)")
                                    print("hp: \(monster.hp) atk: \(monster.atk)")
                                    manaBar.size.height -= manaCost
                                    let newVal = Int(manaLabel.text!)! - cost
                                    manaLabel.text = "\(newVal)"
                                    addChild(monster)
                                    drawCard()
                                } else if selectedCard!.type == "spell" {
                                    let spell = selectedCard!.action!(size: CGSizeMake(sSize, sSize), position: touchedNode.position)
                                    print("spell: \(spell)")
                                    manaBar.size.height -= manaCost
                                    let newVal = Int(manaLabel.text!)! - cost
                                    manaLabel.text = "\(newVal)"
                                    addChild(spell)
                                    drawCard()
                                }else if selectedCard!.type == "structure" {
                                    let structure = selectedCard!.action!(size: CGSizeMake(sSize, sSize), position: touchedNode.position)
                                    print("structure: \(structure)")
                                    manaBar.size.height -= manaCost
                                    let newVal = Int(manaLabel.text!)! - cost  
                                    manaLabel.text = "\(newVal)"
                                    addChild(structure)
                                    drawCard()
                                }
                            }
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
}
