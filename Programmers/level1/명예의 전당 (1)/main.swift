import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    var minHeap = Heap<Int>(<)
    var minScores: [Int] = []
    for value in score {
        defer { minScores.append(minHeap.root()!) }
        if minHeap.count < k {
            minHeap.push(value)
        } else {
            minHeap.push(value)
            _ = minHeap.popRoot()
        }
    }
    return minScores
}

struct Heap<Element> {
    private var elements: [Element]
    private let priorityFunction: (Element, Element) -> Bool
    
    init(_ function: @escaping (Element, Element) -> Bool) {
        self.elements = []
        self.priorityFunction = function
    }
    
    init(withInitialElements elements: [Element],_ function: @escaping (Element, Element) -> Bool) {
        var heap = Heap(function)
        elements.forEach {
            heap.push($0)
        }
        self.elements = heap.elements
        self.priorityFunction = function
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        return elements.count
    }
    
    func root() -> Element? {
        return elements.first
    }
    
    private func isRoot(_ index: Int) -> Bool {
        return index == 0
    }
    
    private func leftChildIndex(of index: Int) -> Int {
        return (index * 2) + 1
    }
    
    private func rightChildIndex(of index: Int) -> Int {
        return (index * 2) + 2
    }
    
    private func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    private func isHigherPriority(at index: Int, than indexToBeCompared: Int) -> Bool {
        return priorityFunction(elements[index], elements[indexToBeCompared])
    }
    
    private func higherPriorityIndex(betweenParentIndex parentIndex: Int, andChildIndex childIndex: Int) -> Int {
        guard childIndex < count, isHigherPriority(at: childIndex, than: parentIndex) else { return parentIndex }
        return childIndex
    }
    
    private func highestPriorityIndex(for parentIndex: Int) -> Int {
        return higherPriorityIndex(
            betweenParentIndex: higherPriorityIndex(
                betweenParentIndex: parentIndex,
                andChildIndex: leftChildIndex(of: parentIndex)
            ), andChildIndex: rightChildIndex(of: parentIndex)
        )
    }
    
    private mutating func upHeap(at index: Int) {
        let parent = parentIndex(of: index)
        guard !isRoot(index), isHigherPriority(at: index, than: parent) else { return }
        elements.swapAt(index, parent)
        upHeap(at: parent)
    }
    
    mutating func push(_ element: Element) {
        elements.append(element)
        upHeap(at: count - 1)
    }
    
    private mutating func downHeap(at index: Int) {
        let childIndex = highestPriorityIndex(for: index)
        guard index != childIndex else { return }
        elements.swapAt(index, childIndex)
        downHeap(at: childIndex)
    }
    
    mutating func popRoot() -> Element? {
        guard !isEmpty else { return nil }
        elements.swapAt(0, count - 1)
        let root = elements.removeLast()
        downHeap(at: 0)
        return root
    }
}
