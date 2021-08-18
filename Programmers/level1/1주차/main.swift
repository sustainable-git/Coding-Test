//
//  main.swift
//  SwiftTest
//
//  Created by shin jae ung on 2021/08/13.
//

import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    let totalCost = price * count * (count + 1) / 2
    return money >= totalCost ? 0 : Int64(totalCost - money)
}
