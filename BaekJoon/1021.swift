//
//  main.swift
//  BackJoon
//
//  Created by Lena on 2022/06/02.
// 1021 회전하는 큐 (덱 연습문제)

import Foundation

var input = readLine()!.split(separator: " ").map{Int(String($0))!}

let n = input[0] // 큐의 크기
let m = input[1] // 뽑아내려는 수의 개수

var targetNumbers = Array(readLine()!.split(separator: " ").map{Int(String($0))!})
// 뽑아내려는 숫자들

var deque = Array(1...n)
var min = 0

func rotate(_ direction: Int) {
    if direction == -1 {
        let firstNumber = deque.removeFirst()
        deque.append(firstNumber)
    } else {
        let lastNumber = deque.removeLast()
        deque.reverse()
        deque.append(lastNumber)
        deque.reverse() // 첫 번째 인덱스에 삽입한다
    }
}

func find() {
    let target = targetNumbers[0]
    let targetIndex = deque.firstIndex(of: target)!
    if target == deque[0] {
        targetNumbers.removeFirst()
        deque.removeFirst()
    } else if targetIndex > deque.count / 2 {
        rotate(1)
        min += 1
    } else {
        rotate(-1)
        min += 1
    }
}

while(!targetNumbers.isEmpty) {
    find()
}

print(min)
