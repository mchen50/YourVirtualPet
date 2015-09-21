//
//  GameScene.swift
//  YourVitualPet
//
//  Created by Ming on 9/20/15.
//  Copyright (c) 2015 CM. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var pet = SKSpriteNode()
    var bg = SKSpriteNode()
    var makePetIdle = SKAction()
    var petActions = [SKAction]()
    var cat_fun_button = SKSpriteNode()
    
    var currentAction:Int = 0 //what is the current action?
    
    override func didMoveToView(view: SKView) {
        
        var bgTextture = SKTexture(imageNamed: "img/bg/home.png")
        bg = SKSpriteNode(texture: bgTextture)
        bg.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        bg.size.height = self.frame.height
        self.addChild(bg)
        
        //Set up idle animation
        var petTextture = SKTexture(imageNamed: "img/cat/idle_side/0.png")
        var petTextture1 = SKTexture(imageNamed: "img/cat/idle_side/1.png")
        var petTextture2 = SKTexture(imageNamed: "img/cat/idle_side/2.png")
        var petTextture3 = SKTexture(imageNamed: "img/cat/idle_side/3.png")
        
        var animation = SKAction.animateWithTextures([petTextture,petTextture1,petTextture2,petTextture3], timePerFrame: 0.5)
        
        //default action
        makePetIdle = SKAction.repeatActionForever(animation)
        petActions.append(makePetIdle)
        
        pet = SKSpriteNode(texture:petTextture, size: CGSizeMake(100, 100))
        pet.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame)/2)
        
        pet.runAction(makePetIdle)
        
        pet.zPosition = 10
        
        self.addChild(pet)
        
        //button set up
        var cat_fun_texture = SKTexture(imageNamed: "img/icons/cat_fun.png")
        cat_fun_button = SKSpriteNode(texture: cat_fun_texture, size: CGSizeMake(70,70))
        cat_fun_button.position = CGPoint(x: CGRectGetMidX(self.frame)-70*2, y: CGRectGetMidY(self.frame)/2-70*2)
        cat_fun_button.zPosition = 11
        self.addChild(cat_fun_button)
        
        
        
        //set up other actions
        setUpActions()
        
    }
    
    func setUpActions(){
        //idle front action
        var petTextture = SKTexture(imageNamed: "img/cat/idle_front/0.png")
        var petTextture1 = SKTexture(imageNamed: "img/cat/idle_front/1.png")
        var petTextture2 = SKTexture(imageNamed: "img/cat/idle_front/2.png")
        var petTextture3 = SKTexture(imageNamed: "img/cat/idle_front/3.png")
        
        var animation = SKAction.animateWithTextures([petTextture,petTextture1,petTextture2,petTextture3], timePerFrame: 0.2)
        var action = SKAction.repeatActionForever(animation)
        
        petActions.append(action)
        
        //back action
        petTextture = SKTexture(imageNamed: "img/cat/back/0.png")
        petTextture1 = SKTexture(imageNamed: "img/cat/back/1.png")
        petTextture2 = SKTexture(imageNamed: "img/cat/back/2.png")
        petTextture3 = SKTexture(imageNamed: "img/cat/back/3.png")
        
        animation = SKAction.animateWithTextures([petTextture,petTextture1,petTextture2,petTextture3], timePerFrame: 0.2)
        action = SKAction.repeatActionForever(animation)
        
        petActions.append(action)
        
        //paw action
        petTextture = SKTexture(imageNamed: "img/cat/paw/0.png")
        petTextture1 = SKTexture(imageNamed: "img/cat/paw/1.png")
        petTextture2 = SKTexture(imageNamed: "img/cat/paw/2.png")
        petTextture3 = SKTexture(imageNamed: "img/cat/paw/3.png")
        
        animation = SKAction.animateWithTextures([petTextture,petTextture1,petTextture2,petTextture3], timePerFrame: 0.5)
        action = SKAction.repeatActionForever(animation)
        
        petActions.append(action)
        
        //sleep action
        petTextture = SKTexture(imageNamed: "img/cat/sleep/0.png")
        petTextture1 = SKTexture(imageNamed: "img/cat/sleep/1.png")
        petTextture2 = SKTexture(imageNamed: "img/cat/sleep/2.png")
        petTextture3 = SKTexture(imageNamed: "img/cat/sleep/3.png")
        
        animation = SKAction.animateWithTextures([petTextture,petTextture1,petTextture2,petTextture3], timePerFrame: 1)
        action = SKAction.repeatActionForever(animation)
        
        petActions.append(action)
        
        //sleep2 action
        petTextture = SKTexture(imageNamed: "img/cat/sleep2/0.png")
        petTextture1 = SKTexture(imageNamed: "img/cat/sleep2/1.png")
        petTextture2 = SKTexture(imageNamed: "img/cat/sleep2/2.png")
        petTextture3 = SKTexture(imageNamed: "img/cat/sleep2/3.png")
        
        animation = SKAction.animateWithTextures([petTextture,petTextture1,petTextture2,petTextture3], timePerFrame: 0.8)
        action = SKAction.repeatActionForever(animation)
        
        petActions.append(action)
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            var randomAction = 0
            if cat_fun_button.containsPoint(location){
                if petActions.count > 0 {
                    do {
                        randomAction = Int(arc4random_uniform(UInt32(petActions.count)))
                    }while randomAction == currentAction
                    
                    currentAction = randomAction
                    
                    pet.runAction(petActions[randomAction])
                }
               
            }
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}

