//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Felipe de Souza Longo on 19/12/18.
//  Copyright © 2018 Felipe de Souza Longo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var ballAnswers = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    
    @IBOutlet weak var ball: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        generateAnswer()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        generateAnswer()
    }

    @IBAction func asked(_ sender: Any) {
        generateAnswer()
    }
    
    func generateAnswer(){
        ball.image = UIImage(named: ballAnswers[Int.random(in: 0 ... 4)])
    }
    
}

