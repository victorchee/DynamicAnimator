//
//  AttachmentsViewController.swift
//  DynamicAnimator
//
//  Created by qihaijun on 12/23/15.
//  Copyright © 2015 VictorChee. All rights reserved.
//

import UIKit

class AttachmentViewController: UIViewController {
    @IBOutlet weak var attachmentView: UIView!
    @IBOutlet weak var itemView: UIView!
    @IBOutlet weak var itemAttachmentView: UIView!
    
    var animator: UIDynamicAnimator!
    var attachmentBehavior: UIAttachmentBehavior!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animator = UIDynamicAnimator(referenceView: view)
        
        let collisionBehavior = UICollisionBehavior(items: [itemView])
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        
        let anchor = CGPoint(x: itemView.center.x, y: itemView.center.y - 100)
        let offset = UIOffset(horizontal: -22, vertical: -22)
        attachmentBehavior = UIAttachmentBehavior(item: itemView, offsetFromCenter: offset, attachedToAnchor: anchor)
//        attachmentBehavior.damping = 0.5
//        attachmentBehavior.frequency = 0.5
//        attachmentBehavior.frictionTorque = 0.5
        
        attachmentView.center = attachmentBehavior.anchorPoint
        itemAttachmentView.center = CGPoint(x: 22, y: 22)
        
        animator.addBehavior(collisionBehavior)
        animator.addBehavior(attachmentBehavior)
        
    }
    
    @IBAction func pan(_ sender: UIPanGestureRecognizer) {
        attachmentBehavior.anchorPoint = sender.location(in: view)
        attachmentView.center = attachmentBehavior.anchorPoint
    }
}
