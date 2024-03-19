//
//  WeakReference.swift
//  GetReferdSDK
//
//  Created by Eoin O'Connell on 01/02/2023.
//  Copyright © 2023 GetReferd. All rights reserved.
//

import Foundation

public class ViewModelWeakDelegateReference<T: AnyObject & Hashable>: Hashable {
        
    public weak var reference : T?
    public var hash: Int
    
    init (_ reference: T) {
        self.reference = reference
        self.hash = reference.hashValue
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(hash)
    }
    
    public static func == (lhs: ViewModelWeakDelegateReference<T>, rhs: ViewModelWeakDelegateReference<T>) -> Bool {
        return lhs.hash == rhs.hash
    }
    
}
