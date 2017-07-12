//
//  GameScene.swift
//  Physics
//
//  Created by Todd Perkins on 11/9/16.
//  Copyright © 2016 Todd Perkins. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var guy:SKSpriteNode?
    var platform:SKSpriteNode?
    
    override func didMove(to view: SKView) {
        guy = self.childNode(withName: "guy") as? SKSpriteNode
        platform = self.childNode(withName: "platform") as? SKSpriteNode
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        jump()
    }
    
    func jump() {
        guy?.texture = SKTexture(imageNamed: "guy_2")
        guy?.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 200))
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
        platform?.physicsBody?.applyForce(CGVector(dx: -20, dy: 0))
        
    }
}
