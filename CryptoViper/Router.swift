//
//  Router.swift
//  CryptoViper
//
//  Created by Yalçın Golayoğlu on 1.01.2022.
//

import Foundation
import UIKit

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter{
    var entry : EntryPoint? {get}
    static func startExecution() -> AnyRouter
}

class CryptoRouter : AnyRouter{
    var entry: EntryPoint?
    
    static func startExecution() -> AnyRouter {
        let router = CryptoRouter()
        var view : AnyView = CryptoViewController()
        var interactor : AnyInteractor = CryptoInteractor()
        var presenter : AnyPresenter = CryptoPresenter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.entry = view as? EntryPoint
        return router
    }
    
    
}
