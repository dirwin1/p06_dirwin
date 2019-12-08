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
    private var outerJS : SKSpriteNode!
    private var innerJS : SKSpriteNode!
    
    override init(size: CGSize){
        super.init(size: size)
        
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        let background = SKSpriteNode(imageNamed: "background")
        background.texture?.filteringMode = .nearest
        background.size = CGSize(width: tileWidth * 16, height: tileHeight * 10)
        //addChild(background)
        
        guy = Guy()
        guy.zPosition = 100
        addChild(guy)
        
        cam = SKCameraNode()
        camera = cam
        addChild(cam)
        
        outerJS = SKSpriteNode(imageNamed: "joystick-outer")
        outerJS.texture?.filteringMode = .nearest
        outerJS.size = CGSize(width: 2 * tileWidth, height: 2 * tileHeight)
        outerJS.alpha = 0
        outerJS.position = CGPoint.zero
        outerJS.zPosition = 1000
        cam.addChild(outerJS)
        
        innerJS = SKSpriteNode(imageNamed: "joystick-inner")
        innerJS.texture?.filteringMode = .nearest
        innerJS.size = CGSize(width: tileWidth, height: tileHeight)
        innerJS.alpha = 0
        innerJS.position = CGPoint.zero
        innerJS.zPosition = 1001
        cam.addChild(innerJS)
        
        let level = Level()
        addChild(level)
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
        
        //show the joystick
        outerJS.position = touchLocation
        outerJS.alpha = 0.6
        
        innerJS.position = touchLocation
        innerJS.alpha = 0.75
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: AnyObject! = touches.first
        let touchLocation = touch.location(in: cam)
        
        cam.position = guy.position
        
        //update the joystick
        var offset : CGPoint = CGPoint(x: touchLocation.x - lastTouch.x, y: touchLocation.y - lastTouch.y)
        let length : CGFloat = sqrt(offset.x * offset.x + offset.y * offset.y);
        //check if we are in bounds
        if length > tileWidth {
            //get angle
            offset = CGPoint(x: (offset.x / length) * tileWidth, y: (offset.y / length) * tileHeight)
        }
        innerJS.position = CGPoint(x: lastTouch.x + offset.x, y: lastTouch.y + offset.y)
        
        guy.move(dx: offset.x, dy: offset.y)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guy.move(dx: 0, dy: 0)
        
        //hide the joystick
        outerJS.alpha = 0
        innerJS.alpha = 0
    }
}
