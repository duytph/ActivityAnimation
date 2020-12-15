import UIKit

extension ActivityAnimationViewControllable where Self: UIViewController {
    
    func toggle(activityAnimation: Bool) {
        if activityAnimation {
            guard activityAnimationViewController.parent == nil else {
                return activityAnimationViewController.toggle(animation: activityAnimation)
            }
            
            addChild(activityAnimationViewController)
            view.addSubview(activityAnimationViewController.view)
            activityAnimationViewController.view.frame = view.bounds
            activityAnimationViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            activityAnimationViewController.didMove(toParent: self)
        } else {
            guard activityAnimationViewController.parent === self else {
                return activityAnimationViewController.toggle(animation: activityAnimation)
            }
            
            activityAnimationViewController.willMove(toParent: nil)
            activityAnimationViewController.view.removeFromSuperview()
            activityAnimationViewController.removeFromParent()
        }
    }
}
