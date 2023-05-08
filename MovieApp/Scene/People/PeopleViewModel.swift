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
    var people: People?
    
    func getPopularPeople() {
        PeopleMockManager.shared.getPeople(page: (people?.page ?? 0) + 1) { people, error in
            if let error = error {
                self.errorCallBack?(error)
            } else if let people = people {
                self.people = people
                self.items.append(contentsOf: people.results ?? [])
                self.successCallBack?()
            }
        }
    }

    func pagination(index: Int) {
        if (index == items.count - 1) && (people?.page ?? 0 <= people?.totalPages ?? 0) {
            getPopularPeople()
        }
    }
    
    func reset() {
        items.removeAll()
        people = nil
//        getPopularPeople()
    }
}
