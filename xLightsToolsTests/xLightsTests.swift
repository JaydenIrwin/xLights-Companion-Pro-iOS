//
//  xLightsTests.swift
//  xLightsToolsTests
//
//  Created by Nicholas Long on 2021-04-25.
//

import XCTest
@testable import xLights_Tools

class xLightsTests: XCTestCase {
    func testPowerCalculatorNormalValues() {
        let powerCalculator = PowerCalculator(lightType: .pixels, pixelVoltage: 12, milliampsPerLight: 60, runningBrightness: 40, powerSupplyWattage: 350, maximumSupplyUsage: 80, numberOfStrings: 16, lightsPerString: 48)
        XCTAssertEqual(powerCalculator.ampsPerString!, 1.15, accuracy: 0.1)
        XCTAssertEqual(powerCalculator.totalAmps!, 18.43, accuracy: 0.1)
        XCTAssertEqual(powerCalculator.wattsPerString!, 13.8, accuracy: 0.1)
        XCTAssertEqual(powerCalculator.totalWattage!, 221.16, accuracy: 0.1)
        XCTAssertEqual(powerCalculator.numberOfPowerSupplies!, 1)
        XCTAssertEqual(powerCalculator.stringsPerPowerSupply!, 20)
    }
    
    func testTreeLightsCalculatorNormalValues() {
        let treeLightsCalculator = TreeLightsCalculator(unitSystem: .metric, autoHeight: true, enteredHeight: nil, topDiameter: 0.30, bottomDiameter: 1.8, circumferenceCovered: 50, numberOfStrings: 16, lightToTopSpacing: 10, bottomToLightSpacing: 3, lightSpacing: 8, lightsPerString: 50)
        XCTAssertEqual(treeLightsCalculator.computedHeight!, 4.03, accuracy: 0.1)
    }
}
