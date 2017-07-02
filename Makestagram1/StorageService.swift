//
//  StorageService.swift
//  Makestagram1
//
//  Created by Pallak Singh on 27/06/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation
import UIKit
import FirebaseStorage

struct StorageService {
    
    static func uploadImage(_ image: UIImage, at reference: StorageReference, completion: @escaping (URL?) -> Void) {
        guard let imageData = UIImageJPEGRepresentation(image, 0.1) else {
            return completion(nil)
    }
        
        reference.putData(imageData, metadata: nil, completion: { (metadata, error) in
            if let error = error {
            assertionFailure(error.localizedDescription)
            
            return completion(nil)
            }
            
    completion(metadata?.downloadURL())
  })
    
}
}
