import UIKit
import Lottie
@testable import ActivityAnimation

final class SpyActivityAnimationViewControllable: UIViewController, ActivityAnimationViewControllable {

    var invokedAnimationViewControllerGetter = false
    var invokedAnimationViewControllerGetterCount = 0
    var stubbedAnimationViewController: AnimationViewControllable!

    var animationViewController: AnimationViewControllable {
        invokedAnimationViewControllerGetter = true
        invokedAnimationViewControllerGetterCount += 1
        return stubbedAnimationViewController
    }

    var invokedToggle = false
    var invokedToggleCount = 0
    var invokedToggleParameters: (activityAnimation: Bool, Void)?
    var invokedToggleParametersList = [(activityAnimation: Bool, Void)]()

    func toggle(activityAnimation: Bool) {
        invokedToggle = true
        invokedToggleCount += 1
        invokedToggleParameters = (activityAnimation, ())
        invokedToggleParametersList.append((activityAnimation, ()))
    }
}

