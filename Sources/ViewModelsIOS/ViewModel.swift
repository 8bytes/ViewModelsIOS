//
//  ViewModel.swift
//  GetReferdSDK
//
//  Created by Eoin O'Connell on 01/02/2023.
//  Copyright © 2023 GetReferd. All rights reserved.
//

import Foundation

public protocol ViewModel {
    associatedtype ViewModelDelegate: AnyObject & Hashable
    associatedtype Identifier: ViewModelIdentifier
    
    var delegates: Set<ViewModelWeakDelegateReference<ViewModelDelegate>> { get set }
}

public extension ViewModel {
    //Funcs for notifying/adding delegate?
    
    typealias Identifier = DefaultIdentifier
    
    mutating func addDelegate(_ delegate: ViewModelDelegate) {
        delegates.insert(ViewModelWeakDelegateReference(delegate))
    }
    
}

open class ViewModelClass<T: AnyObject & Hashable>: ViewModel {
    public typealias ViewModelDelegate = T
    public typealias Identifier = DefaultIdentifier
    public var delegates: Set<ViewModelWeakDelegateReference<T>> = []
}
