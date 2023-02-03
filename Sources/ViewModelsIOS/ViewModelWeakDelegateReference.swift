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
    
    init (_ reference: T) {
        self.reference = reference
    }
    

    public func hash(into hasher: inout Hasher) {
        hasher.combine(reference)
    }
    
    public static func == (lhs: ViewModelWeakDelegateReference<T>, rhs: ViewModelWeakDelegateReference<T>) -> Bool {
        return lhs.reference == rhs.reference
    }
    
}
