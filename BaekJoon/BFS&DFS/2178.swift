//
//  Created by Lena on 2022/06/08.
// 2178 미로

import Foundation

class Dequeue<T> { // 덱을 만들자
    var enqueue: [T]
    var dequeue: [T] = []
    
    var count: Int {
        return enqueue.count + dequeue.count
    }
    
    var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }
    
    init(_ queue: [T]) {
        enqueue = queue
    }
    
    func pushLast(_ x: T) {
        enqueue.append(x)
    }
    
    func pushFirst(_ x: T) {
        dequeue.append(x)
    }
    
    func popLast() -> T? {
        if enqueue.isEmpty {
            enqueue = dequeue.reversed()
            dequeue.removeAll()
        }
        return enqueue.popLast()
    }
    
    func popFirst() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }
}

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var maze: [[Int]] = []

for _ in 0..<n {
    let input = readLine()!.map{Int(String($0))!}
    maze.append(input)
}

let dx = [1, -1, 0, 0] // 가로
let dy = [0, 0, 1, -1] // 세로
var visited = Array(repeating: Array(repeating: false, count: m), count: n)

// 유효한 좌표인지 체크한다
func binaryCheck(_ x: Int, _ y: Int) -> Bool {
    return (x >= 0 && x <= n-1) && (y >= 0 && y <= m-1)
}

func bfs(_ x: Int, _ y: Int) -> Int {
    visited[x][y] = true // 시작위치를 방문하자
    let queue = Dequeue([(x, y, 1)]) // 행, 열, distance
    
    while !queue.isEmpty {
        let (x, y, distance) = queue.popFirst()! // 첫 번째 요소를 꺼낸다
        
        if x == n-1 && y == m-1 { // 끝까지 도달했으면 distance를 반환
            return distance
        }
        
        for i in 0..<4 {
            let nextX = x + dx[i] // 다음 방문할 좌표
            let nextY = y + dy[i]
            let nextDistance = distance + 1 // 이동할 수 있으니까 거리 증가
            
            // 유효한 좌표 && 방문한 적이 없고 && 다음좌표 값이 1이면 (갈 수 있으면)
            if binaryCheck(nextX, nextY) && !visited[nextX][nextY] && maze[nextX][nextY] == 1{
                visited[nextX][nextY] = true
                queue.pushLast((nextX, nextY, nextDistance))
                //큐의 끝에 방문할 좌표 및 거리를 push 한다
            }
        }
    } // 큐가 빌 때 까지 반복한다
    return 1
}

print(bfs(0, 0))
