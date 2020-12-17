import UIKit
import Lottie

/// A view controller is used to display the animation.
/// It toggles animation on when the view will appear and off when the view will disappear.
open class AnimationViewController: UIViewController, AnimationViewControllable {
    
    // MARK: - Dependencies
    
    open private(set) lazy var animationView: AnimationView = {
        let view = AnimationView(name: "rainbow-loading-spinner", bundle: .module)
        view.contentMode = .scaleAspectFill
        view.loopMode = .loop
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    /// An animation view horizontal center constraint.
    open private(set) lazy var animationViewCenterXAnchor = animationView
        .centerXAnchor
        .constraint(equalTo: view.centerXAnchor)
    
    /// An animation view vertical center constraint.
    open private(set) lazy var animationViewCenterYAnchor = animationView
        .centerYAnchor
        .constraint(equalTo: view.centerYAnchor)
    
    /// An animation view width constraint, default is equal to 30% of the fixed coordinator space width.
    open private(set) lazy var animationViewWidthAnchor = animationView
        .widthAnchor
        .constraint(equalToConstant: UIScreen.main.fixedCoordinateSpace.bounds.width * 0.3)
    
    /// An animation view height constraint, default is equal to 30% of the fixed coordinator space width.
    open private(set) lazy var animationViewHeightAnchor = animationView
        .heightAnchor
        .constraint(equalToConstant: UIScreen.main.fixedCoordinateSpace.bounds.width * 0.3)
    
    // MARK: - Life Cycle
    
    override open func loadView() {
        super.loadView()
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationViewCenterXAnchor,
            animationViewCenterYAnchor,
            animationViewWidthAnchor,
            animationViewHeightAnchor,
        ])
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        toggle(animation: true)
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        toggle(animation: false)
    }
    
    // MARK: - ActivityIndicatorAnimationViewControllable
    
    open func toggle(animation: Bool) {
        if animation {
            animationView.play()
        } else {
            animationView.stop()
        }
    }
}
