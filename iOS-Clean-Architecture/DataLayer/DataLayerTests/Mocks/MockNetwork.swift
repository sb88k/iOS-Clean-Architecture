//
//  MockNetwork.swift
//  DataLayerTests
//
//  Created by Sun Bin Kim on 11.03.20.
//  Copyright © 2020 Sun Bin Kim. All rights reserved.
//

@testable import DataLayer
import Foundation

final class MockNetwork: Networkable {
    private(set) var requestCalledCount = 0
    func request() {
        requestCalledCount += 1
    }
}
