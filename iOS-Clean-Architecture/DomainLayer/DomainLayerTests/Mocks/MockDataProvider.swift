//
//  MockUploadUseCase.swift
//  DomainLayerTests
//
//  Created by Sun Bin Kim on 11.03.20.
//  Copyright © 2020 Sun Bin Kim. All rights reserved.
//

import DomainLayer
import Foundation

final class MockDataProvider: DataProviderProtocol {
    private(set) var uploadCalledCount = 0
    func upload(data: Data, completion: @escaping (Result<Void, Error>) -> Void) {
        uploadCalledCount += 1
        completion(.success(()))
    }
    
    private(set) var fetchCalledCount = 0
    func fetch(completion: @escaping (Result<Data, Error>) -> Void) {
        fetchCalledCount += 1
        completion(.success(Data()))
    }
}
