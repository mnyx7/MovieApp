//
//  ActorMoviesViewModel.swift
//  MovieApp
//
//  Created by Minaya Yagubova on 25.04.23.
//

import Foundation

class ActorMoviesViewModel {
    
    var successCallBack: (()->())?
    var errorCallBack: ((String)->())?
    var id: Int?
    
    var items = [Cast]()
    
    func getKnownFor() {
        PeopleManager.shared.getKnownFor(id: id ?? 0) { data, error in
            if let error = error {
                print("Error")
            } else if let data = data {
                self.items = data.cast ?? []
                self.successCallBack?()                
            }
        }
        
    }
}
