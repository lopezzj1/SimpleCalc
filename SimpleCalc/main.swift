//
//  main.swift
//  SimpleCalc
//
//  Created by Jill Lopez on 10/6/15.
//  Copyright © 2015 Jill Lopez. All rights reserved.
//

import Foundation

func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

print("Welcome to SimplyCalc")

print("Enter any expression separated by returns:")


var count = 0.0   //counter

var total = 0.0   //running total

var arrayNums = [String]()

var firstVar = String(input())  //first input

var secondVar = String(0)   //second input

arrayNums.append(firstVar)

count++

//get next input
var nextInput = String(input())

var isStillTyping = true

switch nextInput {
    case "+", "-", "*", "/":
        if nextInput == "+" {
            secondVar = String(input())
            total = Double(firstVar)! + Double(secondVar)!
        } else if nextInput == "-" {
            secondVar = String(input())
            total = Double(firstVar)! - Double(secondVar)!
        } else if nextInput == "*" {
            secondVar = String(input())
            total = Double(firstVar)! * Double(secondVar)!
        } else if nextInput == "/" {
            secondVar = String(input())
            total = Double(firstVar)! / Double(secondVar)!
        }
        print("Result: \(total)")
    
    case "fact":
        if count > 1 {
            print("Factorial can only have one input")
        }
        total = Double(firstVar)!
        for var index = Double(firstVar)! - 1; index > 0; index-- {
            total = total * index
        }
        print("Result: \(total)")
    
    default:
        while isStillTyping{
            if nextInput == "avg" {
                for value in arrayNums {
                    total += Double(value)!
                }
                total = Double(total/count)
                print("Results: \(total)")
                break
            }
            if nextInput == "count" {
                print("Results: \(count)")
                break
            }
            
            if nextInput == "fact" && count > 1{
                print("Factorials can only have one input.")
                break
            }
            
            arrayNums.append(nextInput)
            count++
            nextInput = input()
            
        }
        break
 }
    



