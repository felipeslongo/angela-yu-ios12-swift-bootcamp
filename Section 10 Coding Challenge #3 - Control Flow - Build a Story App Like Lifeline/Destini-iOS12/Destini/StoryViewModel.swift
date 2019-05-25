//
//  StoryViewModel.swift
//  Destini
//
//  Created by Felipe de Souza Longo on 25/05/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

public class StoryViewModel{

    // Our strings
    fileprivate static let story1 = "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: \"Need a ride, boy?\"."
    fileprivate static let answer1a = "I\'ll hop in. Thanks for the help!"
    fileprivate static let answer1b = "Better ask him if he\'s a murderer first."
    
    fileprivate static let story2 = "He nods slowly, unphased by the question."
    fileprivate static let answer2a = "At least he\'s honest. I\'ll climb in."
    fileprivate static let answer2b = "Wait, I know how to change a tire."
    
    fileprivate static let story3 = "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box."
    fileprivate static let answer3a = "I love Elton John! Hand him the cassette tape."
    fileprivate static let answer3b = "It\'s him or me! You take the knife and stab him."
    
    fileprivate static let story4 = "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?"
    fileprivate static let story5 = "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in."
    fileprivate static let story6 = "You bond with the murderer while crooning verses of \"Can you feel the love tonight\". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: \"Try the pier.\""
    
    let description : String!
    let firstAnswer : String!
    let firstAnswerStory: StoryViewModel?
    let secondAnswer : String!
    let secondAnswerStory: StoryViewModel?
    
    let type: StoryType!
    var isEnd: Bool{
        get {
            return type == .end
        }
    }
    
    fileprivate init(description: String!, firstAnswer: String!, secondAnswer: String!, firstAnswerStory: StoryViewModel!, secondAnswerStory: StoryViewModel!, type: StoryType!) {
        self.description = description
        self.firstAnswer = firstAnswer
        self.firstAnswerStory = firstAnswerStory
        self.secondAnswer = secondAnswer
        self.secondAnswerStory = secondAnswerStory
        self.type = type
    }
    
    fileprivate init(description: String!) {
        self.description = description
        self.firstAnswer = ""
        self.firstAnswerStory = nil
        self.secondAnswer = ""
        self.secondAnswerStory = nil
        self.type = .end
    }
    
    public static func MakeStories() -> StoryViewModel{
        
        let story4ViewModel = StoryViewModel(description: story4)
        let story5ViewModel = StoryViewModel(description: story5)
        let story6ViewModel = StoryViewModel(description: story6)

        let story3ViewModel = StoryViewModel(description: story3, firstAnswer: answer3a, secondAnswer: answer3b, firstAnswerStory: story6ViewModel, secondAnswerStory: story5ViewModel, type: .middle)
        let story2ViewModel = StoryViewModel(description: story2, firstAnswer: answer2a, secondAnswer: answer2b, firstAnswerStory: story3ViewModel, secondAnswerStory: story4ViewModel, type: .middle)
        
        /*
        return [
            StoryViewModel(description: story1, firstAnswer: answer1a, secondAnswer: answer1b, firstAnswerStory: story3ViewModel, secondAnswerStory: story2ViewModel, type: .intro),
            story2ViewModel,
            story3ViewModel,
            story4ViewModel,
            story5ViewModel,
            story6ViewModel,
        ]
         */
        
        return StoryViewModel(description: story1, firstAnswer: answer1a, secondAnswer: answer1b, firstAnswerStory: story3ViewModel, secondAnswerStory: story2ViewModel, type: .intro)
    }
    
    public func chooseFirstAnswer() -> StoryViewModel!{
        return firstAnswerStory
    }
    
    public func chooseSecondAnswer() -> StoryViewModel!{
        return secondAnswerStory
    }
    
    public enum StoryType{
        case intro
        case middle
        case end
    }
}
