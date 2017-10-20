//
//  ItemViewController.swift
//  DynamicAnimator
//
//  Created by qihaijun on 12/24/15.
//  Copyright © 2015 VictorChee. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {
    @IBOutlet weak var itemView0: UIView!
    var originalItemView0Center: CGPoint!
    @IBOutlet weak var itemView1: UIView!
    var originalItemView1Center: CGPoint!
    
    var animator: UIDynamicAnimator!
    var itemBehavior0: UIDynamicItemBehavior!
    var itemBehavior1: UIDynamicItemBehavior!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Do any additional setup after loading the view.
        originalItemView0Center = itemView0.center
        originalItemView1Center = itemView1.center
        
        animator = UIDynamicAnimator(referenceView: view)
        
        let gravityBehavior = UIGravityBehavior(items: [itemView0, itemView1])
        let collisionBehavior = UICollisionBehavior(items: [itemView0, itemView1])
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        
        itemBehavior0 = UIDynamicItemBehavior(items: [itemView0])
        itemBehavior1 = UIDynamicItemBehavior(items: [itemView1])
        itemBehavior1.elasticity = 0.5
        
        animator.addBehavior(itemBehavior0)
        animator.addBehavior(itemBehavior1)
        animator.addBehavior(gravityBehavior)
        animator.addBehavior(collisionBehavior)
    }

    @IBAction func redo(_ sender: UIBarButtonItem) {
        itemBehavior0.addLinearVelocity(CGPoint(x: 0, y: -1 * itemBehavior0.linearVelocity(for: itemView0).y), for: itemView0)
        itemView0.center = originalItemView0Center
        animator.updateItem(usingCurrentState: itemView0)
        
        itemBehavior1.addLinearVelocity(CGPoint(x: 0, y: -1 * itemBehavior1.linearVelocity(for: itemView1).y), for: itemView1)
        itemView1.center = originalItemView1Center
        animator.updateItem(usingCurrentState: itemView1)
    }
}
