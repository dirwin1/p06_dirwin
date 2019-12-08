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
    private var guy : Guy!
    private var lastTouch: CGPoint = CGPoint.zero
    private var cam : SKCameraNode!
    
    override init(size: CGSize){
        super.init(size: size)
        
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        let background = SKSpriteNode(imageNamed: "background")
        background.texture?.filteringMode = .nearest
        background.size = CGSize(width: tileWidth * 16, height: tileHeight * 10)
        addChild(background)
        
        guy = Guy()
        addChild(guy)
        
        cam = SKCameraNode()
        camera = cam
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        cam.position = guy.position
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: AnyObject! = touches.first
        let touchLocation = touch.location(in: cam)
        
        lastTouch = touchLocation
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: AnyObject! = touches.first
        let touchLocation = touch.location(in: cam)
        
        guy.move(dx: lastTouch.x - touchLocation.x, dy: lastTouch.y - touchLocation.y)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guy.move(dx: 0, dy: 0)
    }
}
