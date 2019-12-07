//
//  Tile.swift
//  Care Simulator
//
//  Created by Dylan Irwin on 12/1/19.
//  Copyright © 2019 Dylan Irwin. All rights reserved.
//

import Foundation
import SpriteKit

class Tile {
    var type: Int = 0
    var texture: SKTexture! = nil
    var sprite: SKSpriteNode! = nil
    
    init(type: Int){
        self.type = type
    }
    
    
    //format:   7   0   1
    //          6       2
    //          5   4   3
    func updateTexture(n: [Int]){
    
    }
}
