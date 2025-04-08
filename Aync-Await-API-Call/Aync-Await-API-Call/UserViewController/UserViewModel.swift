//
//  UserViewModel.swift
//  Aync-Await-API-Call
//
//  Created by Arvind kumar Singh on 08/04/25.
//

protocol UserViewModelDelegate: AnyObject {
    func relodeTblview()
}

class UserViewModel{
    var delegate: UserViewModelDelegate? = nil
    var usersList: [UserModel] = []{
        didSet{
            delegate?.relodeTblview()
        }
    }
    
    func fetchUser(){
        Task{ @MainActor in
            do {
                let users:[UserModel] = try await APIManager.shared.getAPICall(urlString: AppConstant.baseURL)
                usersList = users
            }catch{
                print("Api error:",error)
            }
        }
    }
}
