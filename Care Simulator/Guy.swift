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
    
    var movementSpeed: Int = 10
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
