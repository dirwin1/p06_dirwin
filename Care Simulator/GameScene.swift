//
//  GameScene.swift
//  Care Simulator
//
//  Created by Dylan Irwin on 12/1/19.
//  Copyright © 2019 Dylan Irwin. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override init(size: CGSize){
        super.init(size: size)
        
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        let background = SKSpriteNode(imageNamed: "background")
        background.texture?.filteringMode = .nearest
        background.size = CGSize(width: tileWidth * 16, height: tileHeight * 10)
        addChild(background)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
