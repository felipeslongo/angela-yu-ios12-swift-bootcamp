//
//  ViewController.swift
//  Destini
//
//  Created by Philipp Muellauer on 01/09/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!         // Has TAG = 1
    @IBOutlet weak var bottomButton: UIButton!      // Has TAG = 2
    @IBOutlet weak var storyTextView: UILabel!
    
    // TODO Step 5: Initialise instance variables here
    var currentStory: StoryViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupIntroStory()
        // TODO Step 3: Set the text for the storyTextView, topButton, bottomButton, and to T1_Story, T1_Ans1, and T1_Ans2
    }

    
    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
        if(currentStory.isEnd){
           return
        }
        
        // TODO Step 4: Write an IF-Statement to update the views
        if(sender.tag == 1){
            currentStory = currentStory.chooseFirstAnswer()
        }
        
        if(sender.tag == 2){
            currentStory = currentStory.chooseSecondAnswer()
        }
        
        setStory(story: currentStory)
        // TODO Step 6: Modify the IF-Statement to complete the story
    }
    
    fileprivate func setupIntroStory() {
        currentStory = StoryViewModel.MakeStories()
        setStory(story: currentStory)
    }
    
    fileprivate func setStory(story: StoryViewModel){
        storyTextView.text = story.description
        
        topButton.isHidden = story.isEnd
        bottomButton.isHidden = story.isEnd
        if(story.isEnd){
            return
        }
        
        topButton.setTitle(story.firstAnswer, for: .normal)
        bottomButton.setTitle(story.secondAnswer, for: .normal)
    }
}

