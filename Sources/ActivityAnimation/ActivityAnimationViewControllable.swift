import UIKit
import Lottie

/// A view controller that is used to display the  animation.
/// It toggles animation on when view will appear and it toggles animation off when view will disappear.
public protocol AnimationViewControllable: UIViewController {
    
    /// The name of the animation
    var animationView: AnimationView { get }
    
    /// Toggle the  animation
    func toggle(animation: Bool)
}

/// An object that manages an activity animation
public protocol ActivityAnimationViewControllable {
    
    /// A child view controller that is used to display the  animation.
    /// It toggles animation on when view will appear and it toggles animation off when view will disappear.
    var animationViewController: AnimationViewControllable { get }
    
    /// Toggle the activity animation
    func toggle(activityAnimation: Bool)
}
