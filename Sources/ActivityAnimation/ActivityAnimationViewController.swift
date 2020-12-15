import UIKit
import Lottie

/// A view controller that is used to display the  animation.
final class AnimationViewController: UIViewController, AnimationViewControllable {
    
    var animationName: String? = "rainbow-loading-spinner" {
        didSet {
            guard animationName != oldValue else { return }
            let animation = animationName.flatMap { Animation.named($0) }
            animationView.animation = animation
        }
    }
    
    // MARK: - Dependencies
    
    /// A view used to performs the animation.
    private(set) lazy var animationView: AnimationView = {
        let animation = animationName.flatMap { Animation.named($0) }
        let view = AnimationView(animation: animation)
        view.contentMode = .center
        view.loopMode = .loop
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    /// Animation view horizontal center constraint.
    private(set) lazy var animationViewCenterXAnchor = animationView
        .centerXAnchor
        .constraint(equalTo: view.centerXAnchor)
    
    /// Animation view vertical center constraint.
    private(set) lazy var animationViewCenterYAnchor = animationView
        .centerYAnchor
        .constraint(equalTo: view.centerYAnchor)
    
    /// Animation view width constraint.
    private(set) lazy var animationViewWidthAnchor = animationView
        .widthAnchor
        .constraint(equalTo: view.widthAnchor)
    
    /// Animation view width constraint.
    private(set) lazy var animationViewHeightAnchor = animationView
        .heightAnchor
        .constraint(equalTo: view.heightAnchor)
    
    // MARK: - Life Cycle
    
    override func loadView() {
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        toggle(animation: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        toggle(animation: false)
    }
    
    // MARK: - ActivityIndicatorAnimationViewControllable
    
    func toggle(animation: Bool) {
        if animation {
            animationView.play()
        } else {
            animationView.stop()
        }
    }
}
