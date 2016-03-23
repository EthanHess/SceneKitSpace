//
//  GameViewController.swift
//  Planets
//
//  Created by Ethan Hess on 3/21/16.
//  Copyright (c) 2016 Ethan Hess. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create a new scene
        let scene = SCNScene()
        
        // create and add a camera to the scene
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)
        
        // place the camera
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 15)
        
        // create and add a light to the scene
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = SCNLightTypeOmni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
        scene.rootNode.addChildNode(lightNode)
        
        // create and add an ambient light to the scene
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = SCNLightTypeAmbient
        ambientLightNode.light!.color = UIColor.darkGrayColor()
        scene.rootNode.addChildNode(ambientLightNode)
        
        // retrieve the SCNView
        let scnView = self.view as! SCNView
        
        // set the scene to the view
        scnView.scene = scene
        
        // allows the user to manipulate the camera
        scnView.allowsCameraControl = true
        
        // show statistics such as fps and timing information
        scnView.showsStatistics = true
        
        // configure the view
        scnView.backgroundColor = Colors.randomOne
        
        var planets = ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune"]
        var rings = [1,2,3,4.2,6,8,10,12]
        var sizes = [0.2, 0.4, 0.5, 0.4, 0.9, 0.7, 0.8, 0.6, 0.8]
        
        var orbits = [1.2, 0.8, 0.5, 0.4, 0.9, 0.7, 0.5, 0.4, 0.3]
        
        for index in 0..<rings.count {
            
            let ring = CGFloat(rings[index])
            let size = sizes[index]
            let planets = planets[index]
            
            let orbit = CGFloat(orbits[index])
            
            let ringGeo = SCNTorus(ringRadius: ring, pipeRadius: 0.03)

            let ringNode = SCNNode(geometry: ringGeo)
            
            scene.rootNode.addChildNode(ringNode)
            
            ringGeo.firstMaterial?.diffuse.contents = Colors.randomTwo
            
            let planetGeo = SCNSphere(radius: CGFloat(size))
            
            let planetNode = SCNNode(geometry: planetGeo)
            planetNode.geometry?.firstMaterial?.diffuse.contents = Colors.randomThree
            
            ringNode.addChildNode(planetNode)
            
            planetNode.position = SCNVector3(Float(ring), 0, 0)
            
            planetGeo.firstMaterial?.diffuse.contents = UIImage(named: planets)
            
//            ringGeo.firstMaterial?.diffuse.contents = UIImage(named: "")
            
            ringNode.runAction(SCNAction.repeatActionForever(SCNAction.rotateByX(0, y: orbit, z: 0, duration: 1)))
            
            if index == 2 {
                
                let moonOrbitNode = SCNNode(geometry: SCNTorus(ringRadius: 0.7, pipeRadius: 0.01))
                
                planetNode.addChildNode(moonOrbitNode)
                moonOrbitNode.runAction(SCNAction.repeatActionForever(SCNAction.rotateByX(0, y: 3.2, z: 0, duration: 1)))
                
                let moonGeo = SCNSphere(radius: CGFloat(0.2))
                moonGeo.firstMaterial?.diffuse.contents = UIColor.whiteColor() //add image eventually
                
                let moonNode = SCNNode(geometry: moonGeo)
                moonOrbitNode.addChildNode(moonNode)
                moonNode.position = SCNVector3(x: 0.7, y: 0, z: 0)
            }
            
        }
        
        // add a tap gesture recognizer
//        let tapGesture = UITapGestureRecognizer(target: self, action: "handleTap:")
//        scnView.addGestureRecognizer(tapGesture)
    }
    
//    func handleTap(gestureRecognize: UIGestureRecognizer) {
//        // retrieve the SCNView
//        let scnView = self.view as! SCNView
//        
//        // check what nodes are tapped
//        let p = gestureRecognize.locationInView(scnView)
//        let hitResults = scnView.hitTest(p, options: nil)
//        // check that we clicked on at least one object
//        if hitResults.count > 0 {
//            // retrieved the first clicked object
//            let result: AnyObject! = hitResults[0]
//            
//            // get its material
//            let material = result.node!.geometry!.firstMaterial!
//            
//            // highlight it
//            SCNTransaction.begin()
//            SCNTransaction.setAnimationDuration(0.5)
//            
//            // on completion - unhighlight
//            SCNTransaction.setCompletionBlock {
//                SCNTransaction.begin()
//                SCNTransaction.setAnimationDuration(0.5)
//                
//                material.emission.contents = UIColor.blackColor()
//                
//                SCNTransaction.commit()
//            }
//            
//            material.emission.contents = UIColor.redColor()
//            
//            SCNTransaction.commit()
//        }
//    }
//    
//    override func shouldAutorotate() -> Bool {
//        return true
//    }
//    
//    override func prefersStatusBarHidden() -> Bool {
//        return true
//    }
//    
//    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
//        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
//            return .AllButUpsideDown
//        } else {
//            return .All
//        }
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

}
