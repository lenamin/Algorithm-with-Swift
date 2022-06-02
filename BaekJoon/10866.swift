//
//  10866.swift
//  BackJoon
//
//  Created by Lena on 2022/06/02.
//

import Foundation

let n = Int(readLine()!)!
var deque: [Int] = []

func push_front(_ x: Int) {
    if deque.isEmpty {
        deque.append(x)
    } else {
        deque.reverse()
        deque.append(x)
        deque.reverse()
        // 그냥 append 함수는 끝에 추가시키니까 뒤집었다가 추가하고 다시 뒤집으면 되겠지
    }
}

func push_back(_ x: Int) {
    deque.append(x)
}

func pop_front() -> Int {
    if deque.isEmpty {
        return -1
    } else {
        return deque.removeFirst()
    }
}

func pop_back() -> Int {
    if deque.isEmpty {
        return -1
    } else {
        return deque.removeLast()
    }
}

func size() -> Int {
    return deque.count
}

func empty() -> Int {
    if deque.isEmpty {
        return 1
    } else {
        return 0
    }
}

func front() -> Int {
    if deque.isEmpty {
        return -1
    } else {
        return deque.first!
    }
}

func back() -> Int {
    if deque.isEmpty {
        return -1
    } else {
        return deque.last!
    }
}


for _ in 0..<n {
    let command = readLine()!.split(separator:" ")
    switch String(command[0]) {
    case "push_front":
        push_front(Int(command[1])!)
    case "push_back":
        push_back(Int(command[1])!)
    case "pop_front":
        print(pop_front())
    case "pop_back":
        print(pop_back())
    case "size":
        print(size())
    case "empty":
        print(empty())
    case "front":
        print(front())
    case "back":
        print(back())
    default:
        break
    }
}
