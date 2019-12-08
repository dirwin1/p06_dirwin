//
//  Level.swift
//  Care Simulator
//
//  Created by Dylan Irwin on 12/1/19.
//  Copyright © 2019 Dylan Irwin. All rights reserved.
//

import Foundation
import SpriteKit

class Level : SKNode {
    let numRows = 32
    let numCols = 64
    var layout : [[Tile]] = [[]]
    
    //generates a new layout
    override init() {
        super.init()
        //create all of the tiles
        for row in 0..<numRows {
            for col in 0..<numCols {
                let tile = Tile(type: 1)
                tile.position = CGPoint(x: ((-CGFloat(numCols) / 2.0) + CGFloat(col)) * tileWidth, y: ((-CGFloat(numRows) / 2.0) + CGFloat(row)) * tileHeight)
                addChild(tile)
                layout[row].append(tile)
            }
            layout.append([])
        }
        
        //choose which are floors
        var tilesToCreate: Int = 256
        var builderX : Int = numCols/2
        var builderY : Int = numRows/2
        
        while tilesToCreate > 0 {
            //change the current tile to a wall
            if layout[builderY][builderX].type == 1 {
                layout[builderY][builderX].type = 0
                tilesToCreate -= 1
            }
            //move the builder
            let horizontal = Bool.random()
            let negative = Bool.random()
            
            if horizontal{
                var move = 1
                if negative {
                    move *= -1
                }
                if move + builderX >= 0 && move + builderX < numCols {
                    builderX += move
                }
            }
            else{
                var move = 1
                if negative {
                    move *= -1
                }
                if move + builderY >= 0 && move + builderY < numRows {
                    builderY += move
                }
            }
        }
        
        
        //update all of the sprites
        for row in 0..<numRows {
            for col in 0..<numCols {
                var neighbors: [Int] = []
                if row + 1 < numRows {
                    neighbors.append(layout[row + 1][col].type)
                }
                else{
                    neighbors.append(0)
                }
                
                if col + 1 < numCols {
                    if row - 1 >= 0 && layout[row-1][col].type == 1 && layout[row - 1][col + 1].type == 0 {
                        neighbors.append(0)
                    }
                    else{
                        neighbors.append(layout[row][col + 1].type)
                    }
                }
                else{
                    neighbors.append(0)
                }
                
                if row - 1 >= 0 {
                    neighbors.append(layout[row - 1][col].type)
                }
                else{
                    neighbors.append(0)
                }
                
                if col - 1 >= 0{
                    if row - 1 >= 0 && layout[row-1][col].type == 1 && layout[row - 1][col - 1].type == 0 {
                        neighbors.append(0)
                    }
                    else{
                        neighbors.append(layout[row][col-1].type)
                    }
                }
                else{
                    neighbors.append(0)
                }
                
                layout[row][col].updateTexture(n: neighbors)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
