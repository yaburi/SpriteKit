//
//  GameScene.swift
//  Basics
//
//  Created by Nathan Zhen on 26/6/17.
//  Copyright © 2017 Nathan Zhen. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    
    override func didMove(to view: SKView) {
        // Spaceship sprite (default)
        let myShip:SKSpriteNode = self.childNode(withName: "ship") as! SKSpriteNode
        
        myShip.xScale = 0.25
        myShip.yScale = 0.25
        
        // Custom sprite
        let player:SKSpriteNode = SKSpriteNode(imageNamed: "player_frame1")
        player.position = CGPoint(x: 100, y: 100)
        self.addChild(player)
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
       
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
