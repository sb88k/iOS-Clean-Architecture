//
//  DataFetchInteractorTests.swift
//  DomainLayerTests
//
//  Created by Sun Bin Kim on 11.03.20.
//  Copyright © 2020 Sun Bin Kim. All rights reserved.
//

@testable import DomainLayer
import XCTest

final class DataFetchInteractorTests: XCTestCase {
    private var interactor: DataFetchInteractor!
    private var mockDataProvider: MockDataProvider!
    private var mockValidationProvider: MockValidationProvider!

    override func setUp() {
        super.setUp()
        
        mockDataProvider = MockDataProvider()
        mockValidationProvider = MockValidationProvider()
        interactor = DataFetchInteractor(dataProvider: mockDataProvider, validationProvider: mockValidationProvider)
    }

    override func tearDown() {
        interactor = nil
        mockValidationProvider = nil
        mockDataProvider = nil
        
        super.tearDown()
    }

    func testFetch__shouldFetchAndValidate() {
        let expect = expectation(description: #function)
        
        var result: Result<Data, Error>!
        interactor.fetch { _result in
            result = _result
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 0.1)
        XCTAssertNoThrow(try result.get())
        XCTAssertEqual(mockDataProvider.fetchCalledCount, 1)
        XCTAssertEqual(mockValidationProvider.validateCalledCount, 1)
    }

}
