//
//  ViewController.swift
//  DynamicAnimator
//
//  Created by qihaijun on 11/9/15.
//  Copyright © 2015 VictorChee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var itemView0: UIView!
    
    var dynamicAnimator: UIDynamicAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dynamicAnimator = UIDynamicAnimator(referenceView: view) // Reference view 作为物理引擎的坐标系统
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let dynamicItems: [UIDynamicItem] = [itemView0]
        
        // 重力行为
        let gravityBehavior = UIGravityBehavior(items: dynamicItems)
        gravityBehavior.gravityDirection = CGVector(dx: 0, dy: 1.0)
        
        dynamicAnimator.addBehavior(gravityBehavior)
        
        // 碰撞行为
        let collisionBehavior = UICollisionBehavior(items: dynamicItems)
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        collisionBehavior.collisionMode = .Everything
        
        dynamicAnimator.addBehavior(collisionBehavior)
        
        // 附着行为
        let attachmentBehavior = UIAttachmentBehavior(item: itemView0, attachedToAnchor: itemView0.center)
        attachmentBehavior.length = 50.0
        attachmentBehavior.damping = 0.5
        attachmentBehavior.frequency = 1.0
        
        dynamicAnimator.addBehavior(attachmentBehavior)
        
        // 物体行为
        let dynamicItemBehavior = UIDynamicItemBehavior(items: dynamicItems)
        dynamicItemBehavior.elasticity = 0.5
        dynamicItemBehavior.allowsRotation = true
        dynamicItemBehavior.addAngularVelocity(1.0, forItem: itemView0)
        
        dynamicAnimator.addBehavior(dynamicItemBehavior)
        
        // 推动行为
        let pushBehavior = UIPushBehavior(items: dynamicItems, mode: .Instantaneous)
        pushBehavior.pushDirection = CGVector(dx: 1.0, dy: 0)
        
        dynamicAnimator.addBehavior(pushBehavior)
        
        // 捕捉行为
        let snapBehavior = UISnapBehavior(item: itemView0, snapToPoint: view.center)
        snapBehavior.damping = 0.5
        
        dynamicAnimator.addBehavior(snapBehavior)
        
        // 场行为
        let noiseFiledBehavior = UIFieldBehavior.noiseFieldWithSmoothness(1.0, animationSpeed: 0.5)
        noiseFiledBehavior.addItem(itemView0)
        noiseFiledBehavior.strength = 0.5
        
        dynamicAnimator.addBehavior(noiseFiledBehavior)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

