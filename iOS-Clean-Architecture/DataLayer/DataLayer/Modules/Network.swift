//
//  Network.swift
//  DataLayer
//
//  Created by Sun Bin Kim on 11.03.20.
//  Copyright © 2020 Sun Bin Kim. All rights reserved.
//

import Foundation

public protocol Networkable {
    func request()
}

public final class Network: Networkable {
    public init() {}
    public func request() {}
}
