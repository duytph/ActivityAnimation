import UIKit
import Lottie

/// A view controller that is used to display the activity animation.
final class ActivityAnimationViewController: UIViewController, ActivityAnimationViewControllable {
    
    // MARK: - Dependencies
    
    /// A view is used to animate activity.
    private(set) lazy var animationView: AnimationView = {
        let view = AnimationView(name: "rainbow-loading-spinner")
        view.contentMode = .scaleAspectFit
        view.loopMode = .loop
        view.frame.size = CGSize(width: 150, height: 150)
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
        .constraint(equalToConstant: animationView.bounds.width)
    
    /// Animation view width constraint.
    private(set) lazy var animationViewHeightAnchor = animationView
        .heightAnchor
        .constraint(equalToConstant: animationView.bounds.height)
    
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
        
        toggle(loadingAnimation: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        toggle(loadingAnimation: false)
    }
    
    // MARK: - ActivityIndicatorAnimationViewControllable
    
    func toggle(loadingAnimation: Bool) {
        if loadingAnimation {
            animationView.play()
        } else {
            animationView.stop()
        }
    }
}
