//
//  ContentView.swift
//  swiftFlashCardApp
//
//  Created by Emilio on 6/2/22.
//

import SwiftUI



struct ContentView: View {
   
   // Variables
   @State var tempNum: String = ""
   @State var practiceNum: String = ""
   @State var operand: String = game.getOperand()
   @State var generatedNum: String = ""
   @State var answer: String = ""
   @State var correct: String = ""
   @State var correctAnswer: String = ""
   @State var operands: [String] = ["X", "/", "+", "-"]
   @State var selectionIndex: Int = 0
   
   var body: some View {
      Spacer()
      Text("The Flashcard App").font(.largeTitle)
      Spacer()
      Picker(selection: $selectionIndex,
             label: Text("Select Operand"),
             content: {
         Text("X").tag(0)
         Text("/").tag(1)
         Text("+").tag(2)
         Text("-").tag(3)
      }).pickerStyle(SegmentedPickerStyle())
      HStack {
            Button(action: {
            game.setOperand(operandType: operands[selectionIndex])
            operand = game.getOperand()
         }){
            Text("Set Operand")
         }
      }
      HStack{
         TextField("Practice number", text: $tempNum).textFieldStyle(RoundedBorderTextFieldStyle()).font(.headline)
         Button(action: {
            practiceNum = tempNum
            game.setPracticeNum(newNum: tempNum)
            game.generateNewProblem()
            generatedNum = game.getGeneratedNum()
         }) {
            Text("Set")
         }
      }.padding(20)
      HStack {
         Text(practiceNum).bold()
         Text(operand).bold()
         Text(generatedNum).bold()
         Text("=")
         TextField("Submit Answer Here", text: $answer).onSubmit {
            if game.isCorrect(input: answer)
            {
               correct = "Correct"
               correctAnswer = ""
               game.generateNewProblem()
               generatedNum = game.getGeneratedNum()
               answer = ""
            }
            else {
               correct = "Incorrect"
            }
         }.textFieldStyle(RoundedBorderTextFieldStyle()).font(.callout)
      }.padding(20)
      VStack {
         Text(correct)
         VStack {
            Button(action: {
               correctAnswer = game.getAnswer()
            }) {
               Text("Show Correct Answer").bold().padding(10)
            }
            Text(correctAnswer)
         }.padding(20)
      }
   }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
