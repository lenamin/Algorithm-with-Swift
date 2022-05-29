//
//  main.swift
//  BackJoon
//
//  Created by Lena on 2022/05/27.
//

import Foundation

var leftside = Array(readLine()!) // 커서를 기준으로 왼쪽의 문자들
var rightside = [Character]() // 커서를 기준으로 오른쪽의 문자들
var n = Int(readLine()!)!

for _ in 0..<n {
    let command = readLine()!
    switch command {
    case "L": // L이면 커서를 왼쪽으로 한 칸 옮김
        if !leftside.isEmpty {
            rightside.append(leftside.removeLast())
        }
        
    case "D": // 커서를 오른쪽으로 한 칸 옮김
        if !rightside.isEmpty {
            leftside.append(rightside.removeLast())
        }
        
    case "B": // 삭제
        if !leftside.isEmpty {
            leftside.removeLast()
        }
        
    default: // P인 경우 command의 마지막 요소를 givenWord에 추가한다
        leftside.append(command.last!)
    }
}

print(String(leftside + rightside.reversed()))




