//
//  CollisionGravitySpringViewController.swift
//  DynamicAnimator
//
//  Created by qihaijun on 12/24/15.
//  Copyright © 2015 VictorChee. All rights reserved.
//

import UIKit

class CollisionGravitySpringViewController: UIViewController {
    @IBOutlet weak var attachmentView: UIView!
    @IBOutlet weak var itemView: UIView!
    @IBOutlet weak var itemAttachmentView: UIView!
    
    var animator: UIDynamicAnimator!
    var attachmentBehavior: UIAttachmentBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        animator = UIDynamicAnimator(referenceView: view)
        
        let gravityBehavior = UIGravityBehavior(items: [itemView])
        
        let collisionBehavior = UICollisionBehavior(items: [itemView])
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        
        let anchorPoint = CGPoint(x: itemView.center.x, y: itemView.center.y - 100)
        attachmentBehavior = UIAttachmentBehavior(item: itemView, attachedToAnchor: anchorPoint)
        attachmentBehavior.frequency = 1
        attachmentBehavior.damping = 0.1
        
        attachmentView.center = attachmentBehavior.anchorPoint
        itemAttachmentView.center = CGPoint(x: 44, y: 44)
        
        animator.addBehavior(attachmentBehavior)
        animator.addBehavior(collisionBehavior)
        animator.addBehavior(gravityBehavior)
    }

    @IBAction func pan(_ sender: UIPanGestureRecognizer) {
        attachmentBehavior.anchorPoint = sender.location(in: view)
        attachmentView.center = attachmentBehavior.anchorPoint
    }
}
