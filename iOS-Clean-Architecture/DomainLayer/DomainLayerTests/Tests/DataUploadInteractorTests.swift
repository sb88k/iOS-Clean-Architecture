//
//  DataUploadInteractorTests.swift
//  DomainLayerTests
//
//  Created by Sun Bin Kim on 11.03.20.
//  Copyright © 2020 Sun Bin Kim. All rights reserved.
//

@testable import DomainLayer
import XCTest

final class DataUploadInteractorTests: XCTestCase {
    private var interactor: DataUploadInteractor!
    private var mockDataProvider: MockDataProvider!
    private var mockValidationProvider: MockValidationProvider!

    override func setUp() {
        super.setUp()
        
        mockDataProvider = MockDataProvider()
        mockValidationProvider = MockValidationProvider()
        interactor = DataUploadInteractor(dataProvider: mockDataProvider, validationProvider: mockValidationProvider)
    }

    override func tearDown() {
        interactor = nil
        mockValidationProvider = nil
        mockDataProvider = nil
        
        super.tearDown()
    }

    func testUpload__shouldValidateAndUpload() {
        let expect = expectation(description: #function)
        
        var result: Result<Void, Error>!
        interactor.upload(data: Data()) { _result in
            result = _result
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 0.1)
        XCTAssertNoThrow(try result.get())
        XCTAssertEqual(mockValidationProvider.validateCalledCount, 1)
        XCTAssertEqual(mockDataProvider.uploadCalledCount, 1)
    }

}
