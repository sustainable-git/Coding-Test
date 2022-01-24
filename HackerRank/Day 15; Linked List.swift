import Foundation

class Node {
    let data: Int
    var next: Node?

    init(data: Int) {
        self.data = data
    }
}

func insert(head: Node?, data: Int!) -> Node? {
    guard head != nil else { return Node(data: data) }
    
    let newNode = Node(data: data)
    guard head?.next != nil else {
        head?.next = newNode
        return head
    }
    
    var nextNode = head?.next
    while nextNode?.next != nil {
        nextNode = nextNode?.next
    }
    nextNode?.next = newNode
    
    return head
}

func display(head: Node?) {
    var current = head

    while current != nil {
        print(current!.data, terminator: " ")
        current = current!.next
    }
}

var head: Node?
let n: Int = Int(readLine()!)!

for _ in 0..<n {
    let element = Int(readLine()!)!
    head = insert(head: head, data: element)
}

display(head: head)
