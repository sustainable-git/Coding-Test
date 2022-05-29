import Foundation

struct MaxHeap<T: Comparable> {
    var nodes: [T] = []

    private func leftChildIndex(ofIndex index: Int) -> Int? {
        let expectedChildIndex = 2 * index + 1
        guard expectedChildIndex < self.nodes.count else { return nil }
        return expectedChildIndex
    }

    private func rightChildIndex(ofIndex index: Int) -> Int? {
        let expectedChildIndex = 2 * index + 2
        guard expectedChildIndex < self.nodes.count else { return nil }
        return expectedChildIndex
    }

    private func parentIndex(ofIndex index: Int) -> Int? {
        guard index > 0 else { return nil }
        return (index - 1) / 2
    }

    mutating private func heapifyUp() {
        var index = self.nodes.count - 1
        while let parentIndex = self.parentIndex(ofIndex: index),
              self.nodes[parentIndex] < nodes[index] {
            self.nodes.swapAt(parentIndex, index)
            index = parentIndex
        }
    }

    mutating func insert(_ node: T) {
        self.nodes.append(node)
        self.heapifyUp()
    }

    mutating private func heapifyDown() {
        var index = 0
        while let leftChildIndex = self.leftChildIndex(ofIndex: index) {
            let rightChildIndex = self.rightChildIndex(ofIndex: index)
            var biggerChildIndex = leftChildIndex
            if let rightChildIndex = rightChildIndex, self.nodes[rightChildIndex] > self.nodes[leftChildIndex] {
               biggerChildIndex = rightChildIndex
            }
            if self.nodes[index] > self.nodes[biggerChildIndex] {
                break
            } else {
                self.nodes.swapAt(index, biggerChildIndex)
            }
            index = biggerChildIndex
        }
    }

    mutating func pop() -> T? {
        guard !nodes.isEmpty else { return nil }
        self.nodes.swapAt(0, nodes.count - 1)
        let result = nodes.removeLast()
        self.heapifyDown()
        return result
    }
}

var heap = MaxHeap(nodes: [Int]())
let N = Int(readLine()!)!
(0..<N).forEach { _ in
    let x = Int(readLine()!)!
    if x == 0 {
        let result = heap.pop()
        print(result != nil ? result! : 0)
    } else {
        heap.insert(x)
    }
}
