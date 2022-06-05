//
//  game.swift
//  flashCardPrototype
//
//  Created by Emilio on 5/31/22.
//

import Foundation

/**************************************************
 * GAME
 * A class to represent a game of flashcards
 *****************************************************************************/
public class Game {
   
   // Member Variables
   private var practiceNum = 0
   private var operand = ""
   private var generatedNum = 0
   private var answer = 0
   private var numsAlreadyUsed : Set = [0]
   private var currentProblem : [String] = []
   
   // Default constructor
   init() {
      operand = "x" /* Default is multiplication */
   }
      
   /**************************************************
    * GET OPERAND
    *****************************************************************************/
   func getOperand() -> String {
      return operand
   }
   
   /**************************************************
    * GET PRACTICE NUMBER
    *****************************************************************************/
   func getPracticeNum() -> String {
      return "\(practiceNum)"
   }
   
   /**************************************************
    * GET GENERATED NUMBER
    *****************************************************************************/
   func getGeneratedNum() -> String {
      return "\(generatedNum)"
   }
   
   /**************************************************
    * GET ANSWER
    *****************************************************************************/
   func getAnswer() -> String {
      return "\(answer)"
   }
   
   /**************************************************
    * SET OPERAND
    *****************************************************************************/
   func setOperand(operandType type: String) {
      /* TODO: implement a assert or enum here to encapsulate operand type */
      operand = type
   }
   
   /**************************************************
    * SET PRACTICE NUMBER
    *****************************************************************************/
   func setPracticeNum(newNum num: String) {
      practiceNum = Int(num) ?? practiceNum
   }
   
   /**************************************************
    * GENERATE NEW PROBLEM
    *****************************************************************************/
   func generateNewProblem() {
      if numsAlreadyUsed.count == 10
      {
         numsAlreadyUsed = [0]
      }
      if numsAlreadyUsed.contains(generatedNum) {
         generatedNum = Int.random(in: 1...12)
         numsAlreadyUsed.insert(generatedNum)
      }
      
      switch(operand) {
      case "/":
         answer = practiceNum / generatedNum
      case "+":
         answer = practiceNum + generatedNum
      case "-":
         answer = practiceNum - generatedNum
         
      default:
         answer = practiceNum * generatedNum
      }
   }
   
   /**************************************************
    * IS CORRECT
    *****************************************************************************/
   func isCorrect(input: String) -> Bool {
      return input == "\(answer)"
   }
}

