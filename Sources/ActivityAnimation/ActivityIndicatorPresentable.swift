import UIKit

/// A view controller that is used to display the activity animation.
protocol ActivityAnimationViewControllable: UIViewController {
    
    /// Toggle the loading animation
    func toggle(loadingAnimation: Bool)
}

/// An object that manages a activity animation
protocol ActivityAnimationPresentable {
    
    /// The child view controller that is used to display the activity animation.
    var activityAnimationViewController: ActivityAnimationViewControllable { get }
    
    /// Toggle the loading animation
    func toggle(loadingAnimation: Bool)
}
