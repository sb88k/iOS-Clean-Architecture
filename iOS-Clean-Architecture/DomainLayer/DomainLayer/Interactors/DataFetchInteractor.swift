//
//  DataFetchInteractor.swift
//  DomainLayer
//
//  Created by Sun Bin Kim on 11.03.20.
//  Copyright © 2020 Sun Bin Kim. All rights reserved.
//

import Foundation

public enum DataFetchInteractorError: Error {
    case invalidData
}

public final class DataFetchInteractor: FetchUseCase {
    private let dataProvider: DataProviderProtocol
    private let validationProvider: ValidationProviderProtocol
    public init(
        dataProvider: DataProviderProtocol,
        validationProvider: ValidationProviderProtocol
    ) {
        self.dataProvider = dataProvider
        self.validationProvider = validationProvider
    }
    
    
    public func fetch(completion: @escaping (Result<Data, Error>) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            let dispatchGroup = DispatchGroup()
            var error: Error?
            
            var data: Data!
            var succeeded: Bool!
            
            dispatchGroup.enter()
            self.dataProvider.fetch { result in
                switch result {
                case .success(let _data):
                    data = _data
                case .failure(let _error):
                    error = _error
                }
                dispatchGroup.leave()
            }
            
            dispatchGroup.wait()
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            dispatchGroup.enter()
            self.validationProvider.validate(data: data) { result in
                switch result {
                case .success(let _succeeded):
                    succeeded = _succeeded
                case .failure(let _error):
                    error = _error
                }
                dispatchGroup.leave()
            }
            
            dispatchGroup.notify(queue: .main) {
                guard succeeded else {
                    completion(.failure(DataUploadInteractorError.invalidData))
                    return
                }
                
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                completion(.success(data))
            }
        }
    }
}

