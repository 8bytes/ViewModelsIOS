//
//  ViewModelScope.swift
//  GetReferdSDK
//
//  Created by Eoin O'Connell on 01/02/2023.
//  Copyright © 2023 GetReferd. All rights reserved.
//

import Foundation

//Idealy each app creates an Enum of Scopes - i.e logged In, userId, etc.
public protocol ViewModelScope {
    var scopeKey: String { get } 
}
