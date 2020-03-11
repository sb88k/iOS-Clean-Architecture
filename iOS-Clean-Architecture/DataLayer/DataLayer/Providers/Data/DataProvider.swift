//
//  DataProvider.swift
//  DataLayer
//
//  Created by Sun Bin Kim on 11.03.20.
//  Copyright © 2020 Sun Bin Kim. All rights reserved.
//

import DomainLayer
import Foundation

public final class DataProvider: DataProviderProtocol {
    private let network: Networkable
    public init(network: Networkable = Network()) {
        self.network = network
    }
    
    public func upload(data: Data, completion: @escaping (Result<Void, Error>) -> Void) {
        network.request()
        completion(.success(()))
    }
    
    public func fetch(completion: @escaping (Result<Data, Error>) -> Void) {
        network.request()
        completion(.success(Data()))
    }
}
