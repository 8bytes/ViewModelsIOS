//
//  ViewModelIdentifier.swift
//  GetReferdSDK
//
//  Created by Eoin O'Connell on 01/02/2023.
//  Copyright © 2023 GetReferd. All rights reserved.
//

import Foundation

public protocol ViewModelIdentifier {
    var identifier: String { get }
}

public struct DefaultIdentifier: ViewModelIdentifier {
    public var identifier: String {
        return "global"
    }
}
