//
//  GameScene.swift
//  YourVitualPet
//
//  Created by Ming on 9/20/15.
//  Copyright (c) 2015 CM. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var hungryLevel = 70
    var happyLevel = 70
    var hungryLabel = SKLabelNode()
    var happyLabel = SKLabelNode()
    
    var pet = SKSpriteNode()
    var bg = SKSpriteNode()
    var makePetIdle = SKAction()
    var petActions = [SKAction]()
    var cat_fun_button = SKSpriteNode()
    var cat_food_button = SKSpriteNode()
    
    var currentAction:Int = 0 //what is the current action?
    
    override func didMoveToView(view: SKView) {
        //set up labels
        hungryLabel.fontName = "Helvetica"
        hungryLabel.fontSize = 30
        hungryLabel.text = "Hungry: \(hungryLevel)"
        hungryLabel.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        self.addChild(hungryLabel)
        
        happyLabel.fontName = "Helvetica"
        happyLabel.fontSize = 30
        happyLabel.text = "Happy: \(happyLevel)"
        happyLabel.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2-30)
        self.addChild(happyLabel)
        
        
        //set up background
        var bgTexture = SKTexture(imageNamed: "img/bg/home.png")
        bg = SKSpriteNode(texture: bgTexture)
        bg.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        bg.size = self.frame.size
        self.addChild(bg)
        
        //Set up idle animation
        var petTexture = SKTexture(imageNamed: "img/cat/idle_side/0.png")
        var petTexture1 = SKTexture(imageNamed: "img/cat/idle_side/1.png")
        var petTexture2 = SKTexture(imageNamed: "img/cat/idle_side/2.png")
        var petTexture3 = SKTexture(imageNamed: "img/cat/idle_side/3.png")
        
        var animation = SKAction.animateWithTextures([petTexture,petTexture1,petTexture2,petTexture3], timePerFrame: 0.5)
        
        //default action
        makePetIdle = SKAction.repeatActionForever(animation)
        petActions.append(makePetIdle)
        
        pet = SKSpriteNode(texture:petTexture, size: CGSizeMake(100, 100))
        pet.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame)/2)
        
        pet.runAction(makePetIdle)
        
        pet.zPosition = 10
        
        self.addChild(pet)
        
        //button set up
        var cat_fun_texture = SKTexture(imageNamed: "img/icons/cat_fun.png")
        cat_fun_button = SKSpriteNode(texture: cat_fun_texture, size: CGSizeMake(70,70))
        cat_fun_button.position = CGPoint(x: CGRectGetMidX(self.frame)+160, y: CGRectGetMidY(self.frame)+70)
        cat_fun_button.zPosition = 11
        self.addChild(cat_fun_button)
        
        var cat_food_texture = SKTexture(imageNamed: "img/icons/cat_food.png")
        cat_food_button = SKSpriteNode(texture: cat_food_texture , size: CGSizeMake(70,70))
        cat_food_button.position = CGPoint(x: CGRectGetMidX(self.frame)-70, y: CGRectGetMidY(self.frame)-210)
        cat_food_button.zPosition = 11
        self.addChild(cat_food_button)
        
        
        
        //set up other actions
        setUpActions()
        
        //decrease hungry level and happy level
        var timer = NSTimer.scheduledTimerWithTimeInterval(3, target:self, selector:Selector("decreaseLevel"), userInfo:nil, repeats: true)
        
    }
    
    func setUpActions(){
        //idle front action
        var petTexture = SKTexture(imageNamed: "img/cat/idle_front/0.png")
        var petTexture1 = SKTexture(imageNamed: "img/cat/idle_front/1.png")
        var petTexture2 = SKTexture(imageNamed: "img/cat/idle_front/2.png")
        var petTexture3 = SKTexture(imageNamed: "img/cat/idle_front/3.png")
    
        var animation = SKAction.animateWithTextures([petTexture,petTexture1,petTexture2,petTexture3], timePerFrame: 0.2)
        var action = SKAction.repeatActionForever(animation)
        
        petActions.append(action)
        
        //back action
        petTexture = SKTexture(imageNamed: "img/cat/back/0.png")
        petTexture1 = SKTexture(imageNamed: "img/cat/back/1.png")
        petTexture2 = SKTexture(imageNamed: "img/cat/back/2.png")
        petTexture3 = SKTexture(imageNamed: "img/cat/back/3.png")
        
        animation = SKAction.animateWithTextures([petTexture,petTexture1,petTexture2,petTexture3], timePerFrame: 0.2)
        action = SKAction.repeatActionForever(animation)
        
        petActions.append(action)
        
        //paw action
        petTexture = SKTexture(imageNamed: "img/cat/paw/0.png")
        petTexture1 = SKTexture(imageNamed: "img/cat/paw/1.png")
        petTexture2 = SKTexture(imageNamed: "img/cat/paw/2.png")
        petTexture3 = SKTexture(imageNamed: "img/cat/paw/3.png")
        
        animation = SKAction.animateWithTextures([petTexture,petTexture1,petTexture2,petTexture3], timePerFrame: 0.5)
        action = SKAction.repeatActionForever(animation)
        
        petActions.append(action)
        
        //sleep action
        petTexture = SKTexture(imageNamed: "img/cat/sleep/0.png")
        petTexture1 = SKTexture(imageNamed: "img/cat/sleep/1.png")
        petTexture2 = SKTexture(imageNamed: "img/cat/sleep/2.png")
        petTexture3 = SKTexture(imageNamed: "img/cat/sleep/3.png")
        
        animation = SKAction.animateWithTextures([petTexture,petTexture1,petTexture2,petTexture3], timePerFrame: 1)
        action = SKAction.repeatActionForever(animation)
        
        petActions.append(action)
        
        //sleep2 action
        petTexture = SKTexture(imageNamed: "img/cat/sleep2/0.png")
        petTexture1 = SKTexture(imageNamed: "img/cat/sleep2/1.png")
        petTexture2 = SKTexture(imageNamed: "img/cat/sleep2/2.png")
        petTexture3 = SKTexture(imageNamed: "img/cat/sleep2/3.png")
        
        animation = SKAction.animateWithTextures([petTexture,petTexture1,petTexture2,petTexture3], timePerFrame: 0.5)
        action = SKAction.repeatActionForever(animation)
        
        petActions.append(action)
        
    }
    
    func decreaseLevel(){
        if(happyLevel > 0){
            happyLevel -= 1
            updateHappyLevel()
        }
        
        if(hungryLevel > 0){
            hungryLevel -= 2
            updateHungryLevel()
        }
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
                    
                    if(happyLevel < 100){
                        happyLevel += 5
                    }
                    updateHappyLevel()
                }
               
            }
            
            if cat_food_button.containsPoint(location){
                if(hungryLevel < 100){
                    hungryLevel += 10
                }
                updateHungryLevel()
                
            }
        }
    }
    
    func updateHungryLevel(){
        if(hungryLevel > 100){
            hungryLevel = 100
            hungryLabel.text = "Hungry: \(hungryLevel)"
        }
        else if(hungryLevel < 0){
            hungryLevel = 0
            hungryLabel.text = "Hungry: \(hungryLevel)"
        }
        else{
            hungryLabel.text = "Hungry: \(hungryLevel)"
        }
    }
    
    func updateHappyLevel(){
        if(happyLevel > 100){
            happyLevel = 100
            happyLabel.text = "Happy: \(happyLevel)"
        }
        else if(happyLevel < 0){
            happyLevel = 0
            happyLabel.text = "Happy: \(happyLevel)"
        }
        else{
            happyLabel.text = "Happy: \(happyLevel)"
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}

