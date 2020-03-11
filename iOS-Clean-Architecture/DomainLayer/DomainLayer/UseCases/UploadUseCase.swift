//
//  UploadUseCase.swift
//  DomainLayer
//
//  Created by Sun Bin Kim on 11.03.20.
//  Copyright © 2020 Sun Bin Kim. All rights reserved.
//

import Foundation

public protocol UploadUseCase {
    func upload(data: Data, completion: @escaping (Result<Void, Error>) -> Void)
}

