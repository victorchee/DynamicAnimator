//
//  CustomViewController.swift
//  DynamicAnimator
//
//  Created by qihaijun on 12/24/15.
//  Copyright © 2015 VictorChee. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    
    var buttonBounds: CGRect!
    var animator: UIDynamicAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        buttonBounds = button.bounds
    }
    
    @IBAction func buttonTapped(sender: UIButton) {
        sender.bounds = buttonBounds
        
        animator = UIDynamicAnimator(referenceView: view)
        
        let buttonBoundsDynamicItem = PositiontoBoundsMapping(target: sender)
        
        let attachmentBehavior = UIAttachmentBehavior(item: buttonBoundsDynamicItem, attachedToAnchor: buttonBoundsDynamicItem.center)
        attachmentBehavior.frequency = 2
        attachmentBehavior.damping = 0.3
        animator.addBehavior(attachmentBehavior)
        
        let pushBehavior = UIPushBehavior(items: [buttonBoundsDynamicItem], mode: .Instantaneous)
        pushBehavior.angle = CGFloat(M_PI_4)
        pushBehavior.magnitude = 2
        animator.addBehavior(pushBehavior)
    }
}
