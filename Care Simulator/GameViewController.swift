//
//  GameViewController.swift
//  Care Simulator
//
//  Created by Dylan Irwin on 12/1/19.
//  Copyright © 2019 Dylan Irwin. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

var tileWidth: CGFloat = 0
var tileHeight: CGFloat = 0
var pixelHeight: CGFloat = 0
var pixelWidth: CGFloat = 0
var displayHeight: CGFloat = 0
var displayWidth: CGFloat = 0

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            //figure out block size
            let displaySize: CGRect = UIScreen.main.bounds

            displayHeight = displaySize.height
            displayWidth = displaySize.width

            tileWidth = min(displayWidth / 11, displayHeight / 7)
            tileHeight = tileWidth
            
            pixelWidth = tileWidth / 16
            pixelHeight = tileHeight / 16
            
            // Load the SKScene from 'GameScene.sks'
            let scene = GameScene(size: CGSize(width: displayWidth, height: displayHeight))
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFill
            
            // Present the scene
            view.presentScene(scene)
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
