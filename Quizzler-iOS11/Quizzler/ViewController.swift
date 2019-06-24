//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    //    initialize the new question bank object
    let questionBank = QuestionBank()
    var pickedAnswer: Bool = false
    var questionNumber = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1{
            pickedAnswer = true
        }else{
            pickedAnswer = false
        }
        
        checkAnswer(pressedAnswer: pickedAnswer)
        questionNumber=questionNumber+1
        nextQuestion()
        
    }
    
    
    func updateUI() {
        
    }
    

    func nextQuestion() {
        if(questionNumber<questionBank.list.count){
            let Question = questionBank.list[questionNumber]
            questionLabel.text = Question.questionText
        }else {
            let alert = UIAlertController(title:"awesome", message:"you have finished the question, do you want to start over", preferredStyle: .alert)
            let restartAction=UIAlertAction(title:"Restart", style:. default, handler: {(UIAlertAction) in
                self.startOver()
            })
        
        
        alert.addAction(restartAction)
        present(alert, animated: true,completion: nil)
        }
        
    }
    
    
    
    func checkAnswer(pressedAnswer : Bool) {
        let firstQuestionAnswer = questionBank.list[questionNumber].answer
        if pressedAnswer == firstQuestionAnswer{
            print(" yes this is the true answer")
        }else{
            print("this is the wrong answer")
            
        }
        
    }
    
    
    func startOver() {
       questionNumber=0
       nextQuestion()
    }
    

    
}
