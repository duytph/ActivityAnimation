import XCTest
@testable import ActivityAnimation

final class ActivityAnimationPresentable_UIViewController_Tests: XCTestCase {
    
    final class FakeActivityAnimationViewControllable: UIViewController, ActivityAnimationViewControllable {

        var invokedAnimationViewControllerGetter = false
        var invokedAnimationViewControllerGetterCount = 0
        var stubbedAnimationViewController: AnimationViewControllable!

        var animationViewController: AnimationViewControllable {
            invokedAnimationViewControllerGetter = true
            invokedAnimationViewControllerGetterCount += 1
            return stubbedAnimationViewController
        }
    }
    
    var animationViewController: SpyAnimationViewControllable!
    var sut: FakeActivityAnimationViewControllable!
    
    override func setUpWithError() throws {
        animationViewController = SpyAnimationViewControllable()
        sut = FakeActivityAnimationViewControllable()
        sut.stubbedAnimationViewController = animationViewController
    }
    
    override func tearDownWithError() throws {
        animationViewController = nil
        sut = nil
    }
    
    // MARK: - Toggle Activity Animation
    
    func testToggleActivityAnimation_whenTogglingOn_andAnimationViewControllerParentIsSome_itTogglesAnimation() throws {
        let otherViewController = UIViewController()
        otherViewController.addChild(animationViewController)
        
        XCTAssertNotEqual(animationViewController.parent, sut)
        
        sut.toggle(activityAnimation: true)
        
        XCTAssertNotEqual(animationViewController.parent, sut)
        XCTAssertFalse(animationViewController.invokedDidMove)
        XCTAssertFalse(animationViewController.view.isDescendant(of: sut.view))
        
        XCTAssertTrue(animationViewController.invokedToggle)
        XCTAssertFalse(animationViewController.view.isDescendant(of: sut.view))
    }
    
    func testToggleActivityAnimation_whenTogglingOn_andAnimationViewControllerParentIsNone_itAddAnimationViewControllerAsChild_thenTogglesAnimation() throws {
        XCTAssertNil(animationViewController.parent)
        
        sut.toggle(activityAnimation: true)
        
        XCTAssertEqual(animationViewController.parent, sut)
        XCTAssertTrue(animationViewController.invokedDidMove)
        XCTAssertTrue(animationViewController.view.isDescendant(of: sut.view))
        
        XCTAssertTrue(animationViewController.invokedToggle)
        XCTAssertEqual(animationViewController.invokedToggleParameters?.animation, true)
    }
    
    func testToggleActivityAnimation_whenTogglingOff_andAnimationViewControllerParentIsItself_itRemoveAnimationViewController_thenTogglesAnimation() throws {
        sut.addChild(animationViewController)
        
        XCTAssertEqual(animationViewController.parent, sut)
        
        sut.toggle(activityAnimation: false)
        
        XCTAssertTrue(animationViewController.invokedWillMove)
        XCTAssertNil(animationViewController.invokedWillMoveParameters?.parent)
        XCTAssertTrue(animationViewController.invokedRemoveFromParent)
        XCTAssertFalse(animationViewController.view.isDescendant(of: sut.view))
        
        XCTAssertTrue(animationViewController.invokedToggle)
        XCTAssertEqual(animationViewController.invokedToggleParameters?.animation, false)
    }
    
    func testToggleActivityAnimation_whenTogglingOff_andAnimationViewControllerParentIsOther_itTogglesAnimation() throws {
        XCTAssertNil(animationViewController.parent)
        
        sut.toggle(activityAnimation: false)
        
        XCTAssertFalse(animationViewController.invokedWillMove)
        XCTAssertFalse(animationViewController.invokedRemoveFromParent)
        XCTAssertFalse(animationViewController.view.isDescendant(of: sut.view))
        
        XCTAssertTrue(animationViewController.invokedToggle)
        XCTAssertEqual(animationViewController.invokedToggleParameters?.animation, false)
    }
}
