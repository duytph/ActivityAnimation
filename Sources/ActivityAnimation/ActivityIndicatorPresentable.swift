import UIKit

/// A view controller that is used to display the  animation.
protocol AnimationViewControllable: UIViewController {
    
    /// The name of the animation
    var animationName: String? { get set }
    
    /// Toggle the  animation
    func toggle(animation: Bool)
}

/// An object that manages a activity animation
protocol ActivityAnimationViewControllable {
    
    /// The child view controller that is used to display the activity animation.
    var activityAnimationViewController: AnimationViewControllable { get }
    
    /// Toggle the activity animation
    func toggle(activityAnimation: Bool)
}
