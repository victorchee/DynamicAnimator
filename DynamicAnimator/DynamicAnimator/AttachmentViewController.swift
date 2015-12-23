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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animator = UIDynamicAnimator(referenceView: view)
        
        let collisionBehavior = UICollisionBehavior(items: [itemView])
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collisionBehavior)
        
        let attachmentPoint = UIOffset(horizontal: -25, vertical: -25)
        attachmentBehavior = UIAttachmentBehavior(item: itemView, offsetFromCenter: attachmentPoint, attachedToAnchor: attachmentView.center)
        animator.addBehavior(attachmentBehavior)
        
//        itemAttachmentView.center = CGPoint(x: 25, y: 25)
    }
    
    @IBAction func pan(sender: UIPanGestureRecognizer) {
        attachmentBehavior.anchorPoint = sender.locationInView(view)
        attachmentView.center = attachmentBehavior.anchorPoint
    }
}
