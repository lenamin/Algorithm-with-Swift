//
//  main.swift
//  BackJoon
//
//  Created by Lena on 2022/06/07.
// 1926 그림 BFS DFS

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0] // 세로 (행)
let m = input[1] // 가로 (열)

var rectangle = [[Int]]() // 2차원 배열 선언 (도화지에서의 그림의 각 위치)

for _ in 0..<n {
    rectangle.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}
// 그림을 입력받는다

var pictureWidth = 0 // 각 그림의 면적
var max = 0 // 그림의 최대 크기
var count = 0 // 그림의 개수 카운트

func dfs(_ x: Int, _ y: Int) {
    if x < 0 || x >= n ||
        y < 0 || y >= m || rectangle[x][y] != 1 { return }
    // 가로세로가 음수이거나, 주어진 가로세로보다 크거나, 해당 자리가 1이 아니면 (그림이 없으면) return
    // >=에서 =이 없으면 오류가 난다. 이 부분 아직 이해가 안감
    
    rectangle[x][y] = 0 // 이미 체크했으므로 0으로 변경해준다
    pictureWidth += 1 // 그림의 너비를 1 늘린다
    
    // 왼,오,위,아래 모두 확인해서 그림의 크기를 파악한다
    dfs(x+1, y)
    dfs(x-1, y)
    dfs(x, y+1)
    dfs(x, y-1)
    
}

if n > 0 {
    for i in 0..<n {
        for j in 0..<m {
            if rectangle[i][j] == 1 { // 해당 위치에 그림이 있는 경우
                pictureWidth = 0 // 일단 width는 0에서 시작
                dfs(i, j)
                count += 1 // 그림 카운트 증가
                if max < pictureWidth { max = pictureWidth }
            }
        }
    }
}

print(count)
print(max)
