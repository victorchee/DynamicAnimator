//
//  SnapViewController.swift
//  DynamicAnimator
//
//  Created by qihaijun on 12/24/15.
//  Copyright © 2015 VictorChee. All rights reserved.
//

import UIKit

class SnapViewController: UIViewController {
    @IBOutlet weak var itemView: UIView!
    
    var animator: UIDynamicAnimator!
    var snapBehavior: UISnapBehavior?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        animator = UIDynamicAnimator(referenceView: view)
    }

    @IBAction func tap(sender: UITapGestureRecognizer) {
        let point = sender.locationInView(view)
        
        if let snap = snapBehavior {
            animator.removeBehavior(snap)
        }
        
        snapBehavior = UISnapBehavior(item: itemView, snapToPoint: point)
        animator.addBehavior(snapBehavior!)
    }
}
