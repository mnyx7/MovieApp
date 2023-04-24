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
        NetworkManager.shared.request(model: People.self,
                                      url: NetworkHelper.shared.URLconfig(path: "person/popular")) { people, error in
            if let error = error {
                print("")
            } else if let people = people {
                self.items = people.results ?? []
               self.successCallBack?()
            }
        }
    }
}
