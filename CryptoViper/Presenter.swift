//
//  Presenter.swift
//  CryptoViper
//
//  Created by Yalçın Golayoğlu on 1.01.2022.
//

import Foundation

enum NetworkError : Error{
    case NetworkFailed
    case ParsingFailed
}

protocol AnyPresenter {
    var router:AnyRouter? {get set}
    var interactor : AnyInteractor? {get set}
    var view: AnyView? {get set}
    
    func interactorDidDownloadCrypto(result: Result<[Crypto],Error>)
}

class CryptoPresenter : AnyPresenter{
    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>) {
        switch result {
        case .success(let cryptos):
            view?.update(with: cryptos)
        default:
            view?.update(with: "error")
        }
    }
    
    
    var view: AnyView?
    
    var router: AnyRouter?
    
    
    var interactor: AnyInteractor?{
        didSet {
            interactor?.downloadCryptos()
        }
    }
  
    
    
}
