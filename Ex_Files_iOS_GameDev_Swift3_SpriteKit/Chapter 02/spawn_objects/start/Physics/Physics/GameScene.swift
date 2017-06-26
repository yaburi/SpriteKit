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
    var player:SKSpriteNode?
    var fireRate:TimeInterval = 0.5
    var timeSinceFire:TimeInterval = 0
    var lastTime:TimeInterval = 0
    
    override func didMove(to view: SKView) {
        player = self.childNode(withName: "player") as? SKSpriteNode
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
        checkLaser(currentTime - lastTime)
        lastTime = currentTime
    }
    
    func checkLaser(_ frameRate:TimeInterval) {
        // add time to timer
        timeSinceFire += frameRate
        
        // return if it hasn't been enough time to fire laser
        if timeSinceFire < fireRate {
            return
        }
        
        //spawn laser
        spawnLaser()
        
        // reset timer
        timeSinceFire = 0
    }
    
    func spawnLaser() {
        let laserColor:UIColor = UIColor(displayP3Red: 41.0 / 255.0, green: 184.0 / 255.0, blue: 242.0 / 255.0, alpha: 1.0)
        let laser = SKSpriteNode(color: laserColor, size: CGSize(width: 7, height: 21))
        laser.position = player!.position
        self.addChild(laser)
        
        laser.physicsBody = SKPhysicsBody(rectangleOf: laser.size)
        laser.physicsBody?.isDynamic = true
        laser.physicsBody?.allowsRotation = true
        laser.physicsBody?.affectedByGravity = true
        laser.physicsBody?.friction = 0.2
        laser.physicsBody?.restitution = 0.2
        laser.physicsBody?.angularDamping = 0.2
        laser.physicsBody?.mass = 0.006
        laser.physicsBody?.linearDamping = 0
        laser.physicsBody?.velocity = CGVector(dx: 0, dy: 500)
    }
}
