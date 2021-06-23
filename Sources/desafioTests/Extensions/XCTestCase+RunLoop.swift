//
//  XCTestCase+RunLoop.swift
//  desafioTests
//
//  Created by rafael zilao on 22/06/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import XCTest

extension XCTestCase {
    /// Asks Run Loop's to execute
    ///
    /// “That’s because some of UIKit’s actions aren’t immediate but add an event to the run loop.
    /// The run loop is a UIKit mechanism for handling events like mouse and keyboard input.
    /// UIKit also uses it for other things. Pushing onto a navigation controller is one example.”
    /// Excerpt From: Jon Reid. “iOS Unit Testing by Example.”
    ///
    /// The ```executeRunLoop``` method asks the run loop to execute until ```Date()```, which is the
    /// current time and you won't need to wait for them.
    func executeRunLoop() {
        RunLoop.main.run(until: Date())
    }
}
