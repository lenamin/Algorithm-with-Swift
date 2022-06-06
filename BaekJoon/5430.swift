//
//  main.swift
//  BackJoon
//
//  Created by Lena on 2022/06/06.
// 5430 AC

import Foundation

var result = ""

var input = Int(readLine()!)! // 테스트케이스

while input > 0 {
    let p = readLine()! // 수행할 함수
    let n = Int(readLine()!)! // 배열의 개수
    let array = readLine()!.dropFirst().dropLast().split(separator: ",").map{ Int(String($0))!}
    // 배열의 대괄호 지운다
    
    var front = 0
    var end = n-1
    var isReverse = false // 뒤집기
    var isError = false // 에러
    
    for command in p {
        switch String(command) {
        case "R":
            swap(&front, &end)
            isReverse.toggle()
        case "D": // 버리는 경우
            if !isReverse && front <= end {
                front += 1
            } else if isReverse && front >= end { // front가 더 큰 경우
                front -= 1
            } else {
                isError = true
                break
            }
        default:
            break
        }
    }
    
    if isError {
        result.write("error\n")
    } else {
        result.write("[")
        while (!isReverse && front <= end) || (isReverse && front >= end) {
            result.write("\(array[front])")
            if front != end { result.write(",")}
            
            front += isReverse ? -1 : 1
        }
        
        result.write("]\n")
    }
    input -= 1
}

print(result)
