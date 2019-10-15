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
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 //MARK: - Initializing the first question and showing it on the screen.
        let firstQuestion = allQuestions.list[0]
        questionLabel.text = firstQuestion.questionText
        
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
    }
    
    
    func updateUI() {
      
    }
    

    func nextQuestion() {
        
    }
    
    
    func checkAnswer() {
//Holding the answer from the first question.
        let correctAnswer = allQuestions.list[0].answer
//Now we compare it to the pickedAnswer:
        if correctAnswer == pickedAnswer {
            print("You got it!")
        }else {
            print("Wrong!")
        }
        
    }
    
    
    func startOver() {
       
    }
    

    
}
