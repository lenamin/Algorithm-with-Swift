//
//  main.swift
//  BackJoon
//
//  Created by Lena on 2022/06/08.
// 7576 토마토 BFS

import Foundation

class Queue<T> {
    var enqueue: [T]
    var dequeue: [T] = []
    
    var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }
    var count: Int {
        return enqueue.count + dequeue.count
    }
    
    init(_ queue: [T]) {
        self.enqueue = queue
    }
    
    func push(_ n: T) {
        enqueue.append(n)
    }
    
    func pop() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }
}

func tomato() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let m = input[0]
    let n = input[1]
    
    var box: [[Int]] = []
    
    for _ in 0..<n {
        box.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    }
    
    let queue: Queue = Queue([])
    var result = -1
    let dx = [0, 0, -1, 1]
    let dy = [1, -1, 0, 0]
    
    for i in 0..<n {
        for j in 0..<m {
            if box[i][j] == 1 {
                queue.push([i, j])
            }
        }
    }
    
    while !queue.isEmpty {
        result += 1
        for _ in 0..<queue.count {
            guard let position = queue.pop() as? [Int] else { fatalError() }
            for i in 0..<dx.count {
                let row = position[0] + dy[i]
                let col = position[1] + dx[i]
                if row < 0 || row > n-1 || col < 0 || col > m-1 {
                    continue
                } else {
                    if box[row][col] == 0 {
                        box[row][col] = 1
                        queue.push([row, col])
                    }
                }
            }
        }
    }
    for row in box {
        if row.contains(0) {
            result = -1
        }
    }
    print(result)
}

tomato()
