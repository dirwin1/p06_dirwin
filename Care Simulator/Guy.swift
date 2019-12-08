//
//  Guy.swift
//  Care Simulator
//
//  Created by Dylan Irwin on 12/1/19.
//  Copyright © 2019 Dylan Irwin. All rights reserved.
//

import Foundation
import SpriteKit

class Guy : SKSpriteNode {
    var idleFrames: [SKTexture] = []
    var runFrames: [SKTexture] = []
    
    var movementSpeed: CGFloat = 5
    var moving: Bool = false
    
    init(){
        for i in 1...4 {
            let tex = SKTexture(imageNamed: "guy-idle\(i)")
            tex.filteringMode = .nearest
            idleFrames.append(tex)
        }
        
        for i in 1...6 {
            let tex = SKTexture(imageNamed: "guy-walk\(i)")
            tex.filteringMode = .nearest
            runFrames.append(tex)
        }
        
        super.init(texture: idleFrames[0], color: UIColor.white, size: CGSize(width: tileWidth * 2, height: tileHeight * 2))
        
        run(SKAction.repeatForever(SKAction.animate(with: idleFrames, timePerFrame: 0.08)), withKey: "idle")
        
        physicsBody = SKPhysicsBody(texture: idleFrames[0], size:  CGSize(width: tileWidth * 2, height: tileHeight * 2))
        physicsBody?.affectedByGravity = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func move(dx: CGFloat, dy: CGFloat){
        if dx == 0 && dy == 0 && moving == true{
            //idle anim
            moving = false
            removeAllActions()
            run(SKAction.repeatForever(SKAction.animate(with: idleFrames, timePerFrame: 0.08)), withKey: "idle")
        }
        else if moving == false{
            //run anim
            moving = true
            removeAllActions()
            run(SKAction.repeatForever(SKAction.animate(with: runFrames, timePerFrame: 0.08)), withKey: "walk")
        }
        
        if dx < 0 {
            xScale = -1
        }
        else{
            xScale = 1
        }
        
        physicsBody?.velocity = CGVector(dx: dx * movementSpeed, dy: dy * movementSpeed)
    }
}
