//
//  DataProviderTests.swift
//  DataLayerTests
//
//  Created by Sun Bin Kim on 11.03.20.
//  Copyright © 2020 Sun Bin Kim. All rights reserved.
//

@testable import DataLayer
import XCTest

final class DataProviderTests: XCTestCase {
    private var provider: DataProvider!
    private var mockNetwork: MockNetwork!

    override func setUp() {
        super.setUp()
        
        mockNetwork = MockNetwork()
        provider = DataProvider(network: mockNetwork)
    }

    override func tearDown() {
        provider = nil
        mockNetwork = nil
        
        super.tearDown()
    }

    func testUpload__shouldTriggerNetworkAndSuccess() {
        let expect = expectation(description: #function)
        
        var result: Result<Void, Error>!
        provider.upload(data: Data()) { _result in
            result = _result
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 0.1)
        XCTAssertNoThrow(try result.get())
        XCTAssertEqual(mockNetwork.requestCalledCount, 1)
    }
    
    func testFetch__shouldTriggerNetworkAndSuccess() {
        let expect = expectation(description: #function)
        
        var result: Result<Data, Error>!
        provider.fetch { _result in
            result = _result
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 0.1)
        XCTAssertNoThrow(try result.get())
        XCTAssertEqual(mockNetwork.requestCalledCount, 1)
    }
}
