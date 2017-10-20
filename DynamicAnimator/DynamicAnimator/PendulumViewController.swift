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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Do any additional setup after loading the view.
        animator = UIDynamicAnimator(referenceView: view)
        
        let pendulumAttachmentPoint = attachmentView.center
        pendulumBehavior = PendulumBehavior(item: itemView, suspendedFromPoint: pendulumAttachmentPoint)
        animator.addBehavior(pendulumBehavior)
    }

    @IBAction func pan(_ sender: UIPanGestureRecognizer) {
        let point = sender.location(in: view)
        let velocity = sender.velocity(in: view)
        if sender.state == .began {
            pendulumBehavior.beginDraggingWeightAtPoint(point: point)
        } else if sender.state == .ended {
            pendulumBehavior.endDraggingWeightWithVelocity(velocity: velocity)
        } else if sender.state == .cancelled {
            sender.isEnabled = true
            pendulumBehavior.endDraggingWeightWithVelocity(velocity: velocity)
        } else if !itemView.bounds.contains(point) {
            sender.isEnabled = false // cancel
        } else {
            pendulumBehavior.dragWeightToPoint(point: point)
        }
    }
}
