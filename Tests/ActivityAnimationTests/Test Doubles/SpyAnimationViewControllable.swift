import UIKit
import Lottie
@testable import ActivityAnimation

protocol Foo {
    
    func addChild(_ childController: UIViewController)
    func removeFromParent()
    func willMove(toParent parent: UIViewController?)
    func didMove(toParent parent: UIViewController?)
}

final class SpyAnimationViewControllable: UIViewController, AnimationViewControllable {

    var invokedAddChild = false
    var invokedAddChildCount = 0
    var invokedAddChildParameters: (childController: UIViewController, Void)?
    var invokedAddChildParametersList = [(childController: UIViewController, Void)]()

    override func addChild(_ childController: UIViewController) {
        invokedAddChild = true
        invokedAddChildCount += 1
        invokedAddChildParameters = (childController, ())
        invokedAddChildParametersList.append((childController, ()))
    }

    var invokedRemoveFromParent = false
    var invokedRemoveFromParentCount = 0

    override func removeFromParent() {
        invokedRemoveFromParent = true
        invokedRemoveFromParentCount += 1
    }

    var invokedWillMove = false
    var invokedWillMoveCount = 0
    var invokedWillMoveParameters: (parent: UIViewController?, Void)?
    var invokedWillMoveParametersList = [(parent: UIViewController?, Void)]()

    override func willMove(toParent parent: UIViewController?) {
        invokedWillMove = true
        invokedWillMoveCount += 1
        invokedWillMoveParameters = (parent, ())
        invokedWillMoveParametersList.append((parent, ()))
    }

    var invokedDidMove = false
    var invokedDidMoveCount = 0
    var invokedDidMoveParameters: (parent: UIViewController?, Void)?
    var invokedDidMoveParametersList = [(parent: UIViewController?, Void)]()

    override func didMove(toParent parent: UIViewController?) {
        invokedDidMove = true
        invokedDidMoveCount += 1
        invokedDidMoveParameters = (parent, ())
        invokedDidMoveParametersList.append((parent, ()))
    }
    
    var invokedAnimationViewGetter = false
    var invokedAnimationViewGetterCount = 0
    var stubbedAnimationView: AnimationView!

    var animationView: AnimationView {
        invokedAnimationViewGetter = true
        invokedAnimationViewGetterCount += 1
        return stubbedAnimationView
    }

    var invokedToggle = false
    var invokedToggleCount = 0
    var invokedToggleParameters: (animation: Bool, Void)?
    var invokedToggleParametersList = [(animation: Bool, Void)]()

    func toggle(animation: Bool) {
        invokedToggle = true
        invokedToggleCount += 1
        invokedToggleParameters = (animation, ())
        invokedToggleParametersList.append((animation, ()))
    }
}
