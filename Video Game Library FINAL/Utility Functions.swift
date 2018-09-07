//
//  Utility Functions.swift
//  Video Game Library FINAL
//
//  Created by Mason Nesbitt on 9/6/18.
//  Copyright © 2018 Mason Nesbitt. All rights reserved.
//

import Foundation

//Function to get input from User as well as re-format input.
func getInput() -> String {
    var input: String? = nil
    
    repeat {
        let line = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if line != "" {
            input = line
        } else {
            print("Invalid input")
        }
    } while input == nil
    
    return input!
}

//Grabs Index of an Element in the Array for use based on input
func getIndex(maxIndex: Int) -> Int {
    var validInput: Int? = nil
    
    repeat {
        var userInput = Int(readLine()!)
        
        
        while userInput == nil {
            print("Invalid input. Please enter a usable index.")
            userInput = Int(readLine()!)
        }
        
        if userInput! < maxIndex && userInput! >= 0 {
            validInput = userInput
        } else {
            print("Please enter a valid index.")
        }
    } while validInput == nil
    
    return validInput!
}

//Assignes element to game and also prints the association listing for use by the user.
extension Array where Element == Game {
    func printElements() {
        for (index, game) in self.enumerated() {
            print("\(index). \(game.title)")
        }
    }
}
