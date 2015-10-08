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


var count = 0   //counter

var total = 0   //running total

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
            total = Int(firstVar)! + Int(secondVar)!
        } else if nextInput == "-" {
            secondVar = String(input())
            total = Int(firstVar)! - Int(secondVar)!
        } else if nextInput == "*" {
            secondVar = String(input())
            total = Int(firstVar)! * Int(secondVar)!
        } else if nextInput == "/" {
            secondVar = String(input())
            total = Int(firstVar)! / Int(secondVar)!
        }
        print("Result: \(total)")
    
    case "fact":
        total = Int(firstVar)!
        for var index = Int(firstVar)! - 1; index > 0; index-- {
            total = total * index
        }
        print("Result: \(total)")
    default:
        while isStillTyping{
            if nextInput == "avg" {
                for value in arrayNums {
                    total += Int(value)!
                }
                total = total/count
                print("Results: \(total)")
                break
            }
            if nextInput == "count" {
                print("Results: \(count)")
                break
            }
            
            arrayNums.append(nextInput)
            count++
            nextInput = input()
            
        }
        break
}


