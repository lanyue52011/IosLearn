//
//  ViewController.swift
//  Ball
//
//  Created by 周登峰 on 9/1/16.
//  Copyright © 2016 tab. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    private let updateInterval=1.0/60
    private let motionManager=CMMotionManager()
    private let queue=NSOperationQueue()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        motionManager.deviceMotionUpdateInterval=updateInterval
        motionManager.startDeviceMotionUpdatesToQueue(queue, withHandler: {
            (motionDate:CMDeviceMotion?,error:NSError?)->Void in
            let ballView=self.view as! BallView
            ballView.acceleration=(motionDate?.gravity)!
            dispatch_async(dispatch_get_main_queue(), {
                ballView.update()
            })

        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

