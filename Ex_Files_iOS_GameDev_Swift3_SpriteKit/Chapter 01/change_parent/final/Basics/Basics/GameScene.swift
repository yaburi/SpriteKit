//
//  GameScene.swift
//  Basics
//
//  Created by Todd Perkins on 11/8/16.
//  Copyright © 2016 Todd Perkins. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        let player:SKSpriteNode = self.childNode(withName: "player") as! SKSpriteNode
        let player2:SKSpriteNode = self.childNode(withName: "player2") as! SKSpriteNode
        let drone:SKSpriteNode = player.childNode(withName: "drone") as! SKSpriteNode
        
        drone.move(toParent: player2)
        drone.position = CGPoint(x: -45, y: -45)
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
