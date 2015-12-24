//
//  PendulumViewController.swift
//  DynamicAnimator
//
//  Created by qihaijun on 12/24/15.
//  Copyright © 2015 VictorChee. All rights reserved.
//

import UIKit

class PendulumViewController: UIViewController {
    @IBOutlet weak var attachmentView: UIView!
    @IBOutlet weak var itemView: UIView!
    
    var animator: UIDynamicAnimator!
    var pendulumBehavior: PendulumBehavior!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        // Do any additional setup after loading the view.
        animator = UIDynamicAnimator(referenceView: view)
        
        let pendulumAttachmentPoint = attachmentView.center
        pendulumBehavior = PendulumBehavior(item: itemView, suspendedFromPoint: pendulumAttachmentPoint)
        animator.addBehavior(pendulumBehavior)
    }

    @IBAction func pan(sender: UIPanGestureRecognizer) {
        let point = sender.locationInView(view)
        let velocity = sender.velocityInView(view)
        if sender.state == .Began {
            pendulumBehavior.beginDraggingWeightAtPoint(point)
        } else if sender.state == .Ended {
            pendulumBehavior.endDraggingWeightWithVelocity(velocity)
        } else if sender.state == .Cancelled {
            sender.enabled = true
            pendulumBehavior.endDraggingWeightWithVelocity(velocity)
        } else if !CGRectContainsPoint(itemView.bounds, point) {
            sender.enabled = false // cancel
        } else {
            pendulumBehavior.dragWeightToPoint(point)
        }
    }
}
