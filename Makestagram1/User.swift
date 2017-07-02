//
//  User.swift
//  Makestagram1
//
//  Created by Pallak Singh on 26/06/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot

class User: NSObject
{
    let uid: String
    let username: String
    var isFollowed = false
    
    init(uid: String, username: String) {
        self.uid = uid
        self.username = username
        super.init()
    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
        let username = dict["username"] as? String
        else {
            return nil
        }
        
        self.uid = snapshot.key
        self.username = username
        super.init()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        guard let uid = aDecoder.decodeObject(forKey: Constants.UserDefaults.username) as? String,
        let username = aDecoder.decodeObject(forKey: Constants.UserDefaults.username) as? String
            else { return nil }
        
        self.uid = uid
        self.username = username
        
        super.init()
    }
    
    private static var _current: User? //static variable for current user. private so can't be accessed outside class
    static var current: User {         //making a getter for the private variable
        guard let currentUser = _current else { //check if _current is nil. if nil app will crash with fatal error
            fatalError("error: current user doesn't exist")
        }
        
        return currentUser   //if current is not nil, it is returned to the user
    }
    static func setCurrent(_ user: User, writeToUserDefaults: Bool = false) { //custom setter for the current user, boolean option to whether we want to write to user defaults with the default value set to false
        if writeToUserDefaults{  //we check if the write to user defaults is true, we write the user object to userDefaults
            let data = NSKeyedArchiver.archivedData(withRootObject: user) 
            UserDefaults.standard.set(data, forKey: Constants.UserDefaults.currentUser)
        }
        _current = user
    }
    

}

extension User: NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(uid, forKey: Constants.UserDefaults.uid)
        aCoder.encode(username, forKey: Constants.UserDefaults.username)
    }
}
