//
//  CheckAndXHUD.swift
//  CheckAndXHUD
//
//  Created by Vincenzo Favara on 14/10/15.
//  Copyright © 2015 Vincenzo Favara. All rights reserved.
//

import UIKit

open class CheckAndXHUD: NSObject {
    fileprivate static let sharedObject = CheckAndXHUD()
    let checkAndXView = CheckAndXView()

    open static func showCheckInView(_ view: UIView) {
        CheckAndXHUD.sharedObject.showInView(view, message: nil, isDone: true)
    }
    
    open static func showXInView(_ view: UIView) {
        CheckAndXHUD.sharedObject.showInView(view, message: nil, isDone: false)
    }
    
    open static func showCheckInView(_ view: UIView, message: String?) {
        CheckAndXHUD.sharedObject.showInView(view, message: message, isDone: true)
    }
    
    open static func showXInView(_ view: UIView, message: String?) {
        CheckAndXHUD.sharedObject.showInView(view, message: message, isDone: false)
    }
    
    open static func showInView(_ view: UIView, isDone: Bool) {
        CheckAndXHUD.sharedObject.showInView(view, message: nil, isDone: isDone)
    }
    
    open static func showInView(_ view: UIView, message: String?, isDone: Bool) {
        CheckAndXHUD.sharedObject.showInView(view, message: message, isDone: isDone)
    }
    
    fileprivate func showInView(_ view: UIView, message: String?, isDone: Bool) {
        // Set size of done view
        let checkAndXViewWidth = min(view.frame.width, view.frame.height) / 2
        var originX: CGFloat, originY: CGFloat
        if (UIDevice.current.systemVersion as NSString).floatValue >= 8.0 {
            originX = (view.frame.width - checkAndXViewWidth) / 2
            originY = (view.frame.height - checkAndXViewWidth) / 2
        } else {
            let isLandscape = UIDevice.current.orientation.isLandscape
            originX = ((isLandscape ? view.frame.height : view.frame.width) - checkAndXViewWidth) / 2
            originY = ((isLandscape ? view.frame.width : view.frame.height) - checkAndXViewWidth) / 2
        }
        let checkAndXViewFrame = CGRect(
            x: originX,
            y: originY,
            width: checkAndXViewWidth,
            height: checkAndXViewWidth)
        self.checkAndXView.layer.cornerRadius = 8
        self.checkAndXView.frame = checkAndXViewFrame

        // Set message
        self.checkAndXView.setMessage(message)
        
        // Set isDone
        self.checkAndXView.setIsDone(isDone)
        
        // Start animation
        self.checkAndXView.alpha = 0
        view.addSubview(self.checkAndXView)
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            self.checkAndXView.alpha = 1
        }, completion: { (result: Bool) -> Void in
            self.checkAndXView.drawCheck({ () -> Void in
                let delayTime = DispatchTime.now() + Double(Int64(0.5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
                DispatchQueue.main.asyncAfter(deadline: delayTime) {
                    UIView.animate(withDuration: 0.2, animations: { () -> Void in
                        self.checkAndXView.alpha = 0
                        }, completion: { (result: Bool) -> Void in
                            self.checkAndXView.removeFromSuperview()
                            self.checkAndXView.clear()
                    }) 
                }
            })
        }) 
    }
}
