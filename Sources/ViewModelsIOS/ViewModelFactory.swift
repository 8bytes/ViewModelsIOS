//
//  ViewModelFactory.swift
//  GetReferdSDK
//
//  Created by Eoin O'Connell on 01/02/2023.
//  Copyright © 2023 GetReferd. All rights reserved.
//

import Foundation

public class ViewModelFactory {
    
    static public let shared = ViewModelFactory()
    
    private struct ViewModelStore {
        let scope: ViewModelScope
        let viewModel: any ViewModel
    }
    
    private var viewModelCache: [String: ViewModelStore] = [:]
    
    
    
    //Load from cache or
    /**
     - parameters:
        - scope: Scope to attach to view model
        - delegate: Delegate to add to view model for callbacks
        - initialise: Block used to initialise the ViewModel if none exists
        - uniqueKey: Optional extra uniqie key if you wanted a different view model instance within the same scope - i.e loggedIn scope but sub divided by userId if
     */

    public func getViewModel<T: ViewModel>(scope: ViewModelScope,
                                           delegate: T.ViewModelDelegate?,
                                           initalise: () -> T,
                                           uniqueKey: T.Identifier? = nil) -> T {
        
        
        //ViewModel cache is made up of..
        //"Type"-"ViewModel"-"Scope"
        let vmKey: String = "\(T.self)-\(uniqueKey?.identifier ?? "global")-\(scope.scopeKey)"
        
        var viewModel: T
        if let vm = viewModelCache[vmKey]?.viewModel as? T {
            viewModel = vm
        } else {
            //If no cache call initialise block
            viewModel = initalise()
        }
        
    
        if let delegate = delegate {
            viewModel.addDelegate(delegate)
        }
        
        //Set again due to delegate change
        viewModelCache[vmKey] = ViewModelStore(scope: scope, viewModel: viewModel)
        return viewModel
    }
    
    
    public func dropViewModelsForScopeChange(_ scope: ViewModelScope) {
        //Go through cache and remove all VMs for scope
        
        viewModelCache = viewModelCache.filter({
            return $0.value.scope.scopeKey != scope.scopeKey
        })
        
    }
    
}

