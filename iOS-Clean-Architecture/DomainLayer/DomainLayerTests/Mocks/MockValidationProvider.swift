//
//  MockValidationUseCase.swift
//  DomainLayerTests
//
//  Created by Sun Bin Kim on 11.03.20.
//  Copyright © 2020 Sun Bin Kim. All rights reserved.
//

import DomainLayer
import Foundation

final class MockValidationProvider: ValidationProviderProtocol {
    private(set) var validateCalledCount = 0
    func validate(data: Data, completion: @escaping (Result<Bool, Error>) -> Void) {
        validateCalledCount += 1
        completion(.success(true))
    }
}
