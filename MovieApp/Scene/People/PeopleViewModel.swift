//
//  PeopleViewModel.swift
//  MovieApp
//
//  Created by Minaya Yagubova on 22.04.23.
//

import Foundation

class PeopleViewModel {    
    var successCallBack: (()->())?
    var errorCallBack: ((String)->())?
    
    var items = [PeopleResult]()
    
    func getPopularPeople() {
        PeopleMockManager.shared.getPeople { people, error in
            if let error = error {
                self.errorCallBack?(error)
            } else if let people = people {
                self.items = people.results ?? []
                self.successCallBack?()
            }
        }
    }
}
