//
//  ValidationProvider.swift
//  DataLayer
//
//  Created by Sun Bin Kim on 11.03.20.
//  Copyright © 2020 Sun Bin Kim. All rights reserved.
//

import DomainLayer
import Foundation

public final class ValidationProvider: ValidationProviderProtocol {
    public init() {}
    
    public func validate(data: Data, completion: @escaping (Result<Bool, Error>) -> Void) {
        completion(.success(true))
    }
}
