//
//  StoryViewModel.swift
//  Destini
//
//  Created by Felipe de Souza Longo on 25/05/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

public class StoryViewModel{

    let description : String!
    let firstAnswer : String!
    let secondAnswer : String!
    
    init(description: String!, firstAnswer: String!, secondAnswer: String!) {
        self.description = description
        self.firstAnswer = firstAnswer
        self.secondAnswer = secondAnswer
    }
    
    public static func MakeStories(){
        
    }
}
