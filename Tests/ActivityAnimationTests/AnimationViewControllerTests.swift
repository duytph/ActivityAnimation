import XCTest
import Lottie
@testable import ActivityAnimation

final class AnimationViewControllerTests: XCTestCase {
    
    var sut: AnimationViewController!
    
    override func setUpWithError() throws {
        sut = AnimationViewController()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    // MARK: - Animation View
    
    func testAnimationView() throws {
        XCTAssertNotNil(sut.animationView.animation)
        XCTAssertFalse(sut.animationView.translatesAutoresizingMaskIntoConstraints)
    }
    
    // MARK: -
    
    func testLoadView_itConfiguresLayout() throws {
        XCTAssertTrue(sut.animationView.isDescendant(of: sut.view))
        XCTAssertTrue(sut.animationViewCenterXAnchor.isActive)
        XCTAssertTrue(sut.animationViewCenterYAnchor.isActive)
        XCTAssertTrue(sut.animationViewWidthAnchor.isActive)
        XCTAssertTrue(sut.animationViewHeightAnchor.isActive)
    }
    
    func testViewWillAppear_andAnimationIsNone_itDoesNothing() throws {
        sut.animationView.animation = nil
        sut.viewWillAppear(false)
        
        XCTAssertFalse(sut.animationView.isAnimationQueued)
    }
    
    func testViewWillAppear_andAnimationIsSome_itTogglesAnimationOn() throws {
        XCTAssertNotNil(sut.animationView.animation)
        
        sut.viewWillAppear(false)
        
        XCTAssertTrue(sut.animationView.isAnimationQueued)
    }
    
    func testViewWillDisappear_itToggleAnimationOff() throws {
        sut.viewWillDisappear(false)
        
        XCTAssertFalse(sut.animationView.isAnimationQueued)
    }
}
