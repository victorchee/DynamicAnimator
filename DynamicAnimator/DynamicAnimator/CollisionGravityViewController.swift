//
//  CollisionGravityViewController.swift
//  DynamicAnimator
//
//  Created by qihaijun on 12/23/15.
//  Copyright © 2015 VictorChee. All rights reserved.
//

import UIKit

class CollisionGravityViewController: UIViewController {
    @IBOutlet weak var itemView: UIView!
    var animator: UIDynamicAnimator!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        animator = UIDynamicAnimator(referenceView: view)
        
        let gravityBeahvior = UIGravityBehavior(items: [itemView])
        animator.addBehavior(gravityBeahvior)
        
        let collisionBehavior = UICollisionBehavior(items: [itemView])
        collisionBehavior.setTranslatesReferenceBoundsIntoBoundaryWithInsets(UIEdgeInsets(top: 44, left: 44, bottom: 44, right: 44))
        collisionBehavior.collisionDelegate = self
        animator.addBehavior(collisionBehavior)
    }
}

extension CollisionGravityViewController: UICollisionBehaviorDelegate {
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, atPoint p: CGPoint) {
        guard let view = item as? UIView else {
            return
        }
        view.backgroundColor = UIColor.lightGrayColor()
    }
    
    func collisionBehavior(behavior: UICollisionBehavior, endedContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?) {
        guard let view = item as? UIView else {
            return
        }
        view.backgroundColor = UIColor.darkGrayColor()
    }
}
