import UIKit
import Lottie

/// A view controller is used to display the animation.
/// It toggles animation on when the view will appear and off when the view will disappear.
public protocol AnimationViewControllable: UIViewController {
    
    /// A view manages an animation.
    var animationView: AnimationView { get }
    
    /// Toggle the available animation on or off.
    func toggle(animation: Bool)
}

/// An object manages an activity animation.
public protocol ActivityAnimationViewControllable {
    
    /// A view controller is used to display the animation.
    /// It toggles animation on when the view will appear and off when the view will disappear.
    var animationViewController: AnimationViewControllable { get }
    
    /// Toggle the available activity animation on or off.
    func toggle(activityAnimation: Bool)
}
