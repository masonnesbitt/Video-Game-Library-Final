//
//  Game.swift
//  Video Game Library FINAL
//
//  Created by Mason Nesbitt on 9/6/18.
//  Copyright © 2018 Mason Nesbitt. All rights reserved.
//

import Foundation

// Game Class that has title as a string as well as the Optional DueDate for checked out games and initialization
class Game {
    
    var title: String
    
    var rating: String
    
    var dueDate: Date?
    
    init(title:String, rating:String) {
        self.title = title
        self.rating = rating
        
    }
}
