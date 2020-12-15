import UIKit

extension ActivityAnimationViewControllable where Self: UIViewController {
    
    public func toggle(activityAnimation: Bool) {
        if activityAnimation, animationViewController.parent == nil {
            addChild(animationViewController)
            view.addSubview(animationViewController.view)
            animationViewController.view.frame = view.bounds
            animationViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            animationViewController.didMove(toParent: self)
        } else if !activityAnimation, animationViewController.parent === self {
            animationViewController.willMove(toParent: nil)
            animationViewController.view.removeFromSuperview()
            animationViewController.removeFromParent()
        }
        
        animationViewController.toggle(animation: activityAnimation)
    }
}
