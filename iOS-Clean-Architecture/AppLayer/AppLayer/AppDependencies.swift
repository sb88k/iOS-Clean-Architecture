//
//  AppDependencies.swift
//  AppLayer
//
//  Created by Sun Bin Kim on 11.03.20.
//  Copyright © 2020 Sun Bin Kim. All rights reserved.
//

import DataLayer
import DomainLayer
import Foundation

protocol AppDependenciesComposition: AppDelegateDependencies {}

final class AppDependencies: AppDependenciesComposition {
    static let shared = AppDependencies()
    
    lazy var dataProvider: DataProviderProtocol = DataProvider()
    
    lazy var validationProvider: ValidationProviderProtocol = ValidationProvider()
    
    var dataFetchUseCase: FetchUseCase {
        DataFetchInteractor(dataProvider: dataProvider, validationProvider: validationProvider)
    }
}
