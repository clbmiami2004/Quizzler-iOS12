//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank() //Creating an object
    var pickedAnswer: Bool = false
    var questionNumber: Int = 0
    var score: Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 //MARK: - Initializing the first question and showing it on the screen.
        nextQuestion()
        
    }

//MARK: - Checking what button the user pressed by checking the tag. 1=true, 2=false
    
    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        }else if sender.tag == 2 {
            pickedAnswer = false
        }
        checkAnswer()
//Here we are incrementing the number (question) everytime the user answers each one.
        questionNumber += 1
//This line of code will update the question to the next question.
        nextQuestion()
    }
    
    
    func updateUI() {
        
        scoreLabel.text = "Score: \(score)"
      
    }
    

    func nextQuestion() {
        if questionNumber <= 12 {
        questionLabel.text = allQuestions.list[questionNumber].questionText
            updateUI()
        }else {
            let alert = UIAlertController(title: "Awesome!", message: "You've finished all the questions, would you like to start over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler:  { (UIAlertAction) in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
                
        }
}

    
    
    
    func checkAnswer() {
//Holding the answer from the first question.
        let correctAnswer = allQuestions.list[questionNumber].answer
//Now we compare it to the pickedAnswer:
        if correctAnswer == pickedAnswer {
            print("You got it!")
            score += 1
        }else {
            print("Wrong!")
        }
        
    }
    
//MARK: - Method to start over and jump back to the first question.
    func startOver() {
        
        questionNumber = 0
        nextQuestion()
       
    }
    

    
}


//Left off at lesson 326 in the middle of the video.
