//
//  PendulumBehavior.swift
//  DynamicAnimator
//
//  Created by qihaijun on 12/24/15.
//  Copyright © 2015 VictorChee. All rights reserved.
//

import UIKit

class PendulumBehavior: UIDynamicBehavior {
    private var draggingBehavior: UIAttachmentBehavior!
    private var pushBehavior: UIPushBehavior!
    
    convenience init(item: UIDynamicItem, suspendedFromPoint point: CGPoint) {
        self.init()
        
        let gravityBehavior = UIGravityBehavior(items: [item])
        let attachmentBehavior = UIAttachmentBehavior(item: item, attachedToAnchor: point)
        
        draggingBehavior = UIAttachmentBehavior(item: item, attachedToAnchor: CGPoint.zero)
        pushBehavior = UIPushBehavior(items: [item], mode: .instantaneous)
        pushBehavior.active = false
        
        addChildBehavior(gravityBehavior)
        addChildBehavior(attachmentBehavior)
        addChildBehavior(pushBehavior)
    }
    
    func beginDraggingWeightAtPoint(point: CGPoint) {
        draggingBehavior.anchorPoint = point
        addChildBehavior(draggingBehavior)
    }
    
    func dragWeightToPoint(point: CGPoint) {
        draggingBehavior.anchorPoint = point
    }
    
    func endDraggingWeightWithVelocity(velocity: CGPoint) {
        var magnitude = sqrt(pow(velocity.x, 2.0) + pow(velocity.y, 2.0))
        let angle = atan2(velocity.y, velocity.x)
        magnitude /= 100.0
        
        pushBehavior.angle = angle
        pushBehavior.magnitude = magnitude
        pushBehavior.active = true
        
        removeChildBehavior(draggingBehavior)
    }
}
