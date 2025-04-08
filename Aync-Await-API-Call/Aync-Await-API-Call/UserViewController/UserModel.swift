//
//  UserModel.swift
//  Aync-Await-API-Call
//
//  Created by Arvind kumar Singh on 08/04/25.
//


class UserModel: Codable {
    var id: Int?
    var name: String?
    var username: String?
    var email: String?
    var phone: String?
    var website: String?
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try? container.decode(Int.self, forKey: .id)
        self.name = try? container.decode(String.self, forKey: .name)
        self.username = try? container.decode(String.self, forKey: .username)
        self.email = try? container.decode(String.self, forKey: .email)
        self.phone = try? container.decode(String.self, forKey: .phone)
        self.website = try? container.decode(String.self, forKey: .website)
    }

}
