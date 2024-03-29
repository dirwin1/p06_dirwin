//
//  Tile.swift
//  Care Simulator
//
//  Created by Dylan Irwin on 12/1/19.
//  Copyright © 2019 Dylan Irwin. All rights reserved.
//

import Foundation
import SpriteKit

class Tile : SKSpriteNode {
    var type: Int = 0
    var sprite: SKSpriteNode! = nil
    var decor: SKSpriteNode! = nil
    
    init(type: Int){
        self.type = type
        var tex : SKTexture = SKTexture()
        if type == 0 {
            tex = SKTexture(imageNamed: "tile-floor")
        }
        else if type == 1{
            tex = SKTexture(imageNamed: "tile-wall")
        }
        tex.filteringMode = .nearest
        
        super.init(texture: tex, color: UIColor.white, size: CGSize(width: tileWidth, height: tileHeight))
        
        decor = SKSpriteNode(imageNamed: "decor-2")
        decor.texture?.filteringMode = .nearest
        decor.size = CGSize(width: tileWidth, height: tileHeight)
        addChild(decor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //format:       1
    //          8       2
    //              4
    func updateTexture(n: [Int]){
        if type == 1{
            var index: Int = 0
            index += n[0]
            index += n[1] * 2
            index += n[2] * 4
            index += n[3] * 8
            
            let tex = SKTexture(imageNamed: "tile-\(index)")
            tex.filteringMode = .nearest
            texture = tex
            
            //decor
            let rand: Int = Int.random(in: 0...100)
            if rand < 25 {
                decor = SKSpriteNode(imageNamed: "decor-1")
                decor.texture!.filteringMode = .nearest
            }
            else{
                decor.alpha = 0
            }
        }
        else{
            let tex = SKTexture(imageNamed: "tile-floor")
            tex.filteringMode = .nearest
            texture = tex
            
            //decor
            let rand: Int = Int.random(in: 0...100)
            if rand < 25 {
                decor = SKSpriteNode(imageNamed: "decor-1")
                decor.texture!.filteringMode = .nearest
            }
            else{
                decor.alpha = 0
            }
        }
    }
    
    func updateSprite(){
        if type == 0 {
            let tex = SKTexture(imageNamed: "tile-floor")
            tex.filteringMode = .nearest
            texture = tex
        }
        else if type == 1{
            let tex = SKTexture(imageNamed: "tile-wall")
            tex.filteringMode = .nearest
            texture = tex
        }
    }
}
