//
//  Level.swift
//  Care Simulator
//
//  Created by Dylan Irwin on 12/1/19.
//  Copyright © 2019 Dylan Irwin. All rights reserved.
//

import Foundation
import SpriteKit

class Level {
    let numRows = 10
    let numCols = 16
    var layout : [[Tile]] = [[]]
    
    //generates a new layout
    init() {
        //create all of the tiles
        for row in 0..<numRows {
            for col in 0..<numCols {
                let tile = Tile(type: 0)
                layout[row].append(tile)
            }
            layout.append([])
        }
        
        //choose which are walls
        
        //update all of the sprites
    }
    
    //creates the level from a bitmap
    init(layout: [[Int]]){
        
    }
}
