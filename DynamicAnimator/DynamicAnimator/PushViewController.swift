//
//  InstantaneousPushViewController.swift
//  DynamicAnimator
//
//  Created by qihaijun on 12/24/15.
//  Copyright © 2015 VictorChee. All rights reserved.
//

import UIKit

class PushViewController: UIViewController {
    @IBOutlet weak var itemView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var animator: UIDynamicAnimator!
    var pushBehavior: UIPushBehavior?

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        // Do any additional setup after loading the view.
        animator = UIDynamicAnimator(referenceView: view)
        
        let collisionBehavior = UICollisionBehavior(items: [itemView])
        collisionBehavior.setTranslatesReferenceBoundsIntoBoundaryWithInsets(UIEdgeInsets(top: topLayoutGuide.length, left: 0, bottom: segmentedControl.bounds.height, right: 0))
        animator.addBehavior(collisionBehavior)
        
        segmentedControl.sendActionsForControlEvents(.ValueChanged)
    }

    @IBAction func changeMode(sender: UISegmentedControl) {
        let mode = sender.selectedSegmentIndex == 0 ? UIPushBehaviorMode.Instantaneous : .Continuous
        if let push = pushBehavior {
            push.active = false
            animator.removeBehavior(push)
        }
        pushBehavior = UIPushBehavior(items: [itemView], mode: mode)
        pushBehavior?.angle = 0
        pushBehavior?.magnitude = 0
        animator.addBehavior(pushBehavior!)
    }
    
    @IBAction func tap(sender: UITapGestureRecognizer) {
        guard let push = pushBehavior else {
            return
        }
        
        let point = sender.locationInView(view)
        let center = CGPoint(x: CGRectGetMidX(view.bounds), y: CGRectGetMidY(view.bounds))
        
        var distance = sqrt(pow(point.x - center.x, 2) + pow(point.y - center.y, 2))
        let angle = atan2(point.y - center.y, point.x - center.x)
        distance = min(distance, 100)
        
        push.magnitude = distance / 100
        push.angle = angle
        if push.mode == .Instantaneous {
            push.active = true
        }
    }
}
