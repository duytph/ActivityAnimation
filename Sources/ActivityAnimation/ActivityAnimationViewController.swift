import UIKit
import Lottie

/// A view controller that is used to display the  animation. It toggles animation on when view will appear and it toggles animation off when view will disappear.
open class AnimationViewController: UIViewController, AnimationViewControllable {
    
    // MARK: - Dependencies
    
    /// A view used to performs the animation.
    open private(set) lazy var animationView: AnimationView = {
        let view = AnimationView(name: "rainbow-loading-spinner", bundle: .module)
        view.contentMode = .scaleAspectFill
        view.loopMode = .loop
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    /// Animation view horizontal center constraint.
    open private(set) lazy var animationViewCenterXAnchor = animationView
        .centerXAnchor
        .constraint(equalTo: view.centerXAnchor)
    
    /// Animation view vertical center constraint.
    open private(set) lazy var animationViewCenterYAnchor = animationView
        .centerYAnchor
        .constraint(equalTo: view.centerYAnchor)
    
    /// Animation view width constraint, default is equal to 150.
    open private(set) lazy var animationViewWidthAnchor = animationView
        .widthAnchor
        .constraint(equalToConstant: UIScreen.main.fixedCoordinateSpace.bounds.width * 0.3)
    
    /// Animation view width constraint, default is equal to 150.
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
