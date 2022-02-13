import Foundation

final class SinglyLinkedListNode {
    var data: Int
    var next: SinglyLinkedListNode?

    public init(nodeData: Int) {
        self.data = nodeData
    }
}

final class SinglyLinkedList {
    var head: SinglyLinkedListNode?
    var tail: SinglyLinkedListNode?

    public init() {}

    public func insertNode(nodeData: Int) {
        self.insertNode(node: SinglyLinkedListNode(nodeData: nodeData))
    }

    private func insertNode(node: SinglyLinkedListNode) {
        if let tail = tail {
            tail.next = node
        } else {
            head = node
        }

        tail = node
    }
}

func printSinglyLinkedList(head: SinglyLinkedListNode?, sep: String, fileHandle: FileHandle) {
    var node = head

    while node != nil {
        fileHandle.write(String(node!.data).data(using: .utf8)!)

        node = node!.next

        if node != nil {
            fileHandle.write(sep.data(using: .utf8)!)
        }
    }
}

/*
 * Complete the 'reverse' function below.
 *
 * The function is expected to return an INTEGER_SINGLY_LINKED_LIST.
 * The function accepts INTEGER_SINGLY_LINKED_LIST llist as parameter.
 */


func reverse(llist: SinglyLinkedListNode?) -> SinglyLinkedListNode? {
    var node = llist
    var arr: [Int] = []
    var nodeArr: [SinglyLinkedListNode] = []
    
    while node != nil {
        arr.append(node!.data)
        node = node?.next
    }
    
    while arr.count > 0 {
        let data = arr.popLast()!
        let newNode = SinglyLinkedListNode(nodeData: data)
        nodeArr.append(newNode)
    }
    
    for index in 0..<nodeArr.count - 1 {
        nodeArr[index].next = nodeArr[index + 1]
    }
    
    return nodeArr.first ?? nil
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let tests = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for testsItr in 1...tests {
    guard let llistCount = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

    let llist = SinglyLinkedList()

    for _ in 1...llistCount {
        guard let llistItem = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
        else { fatalError("Bad input") }
        llist.insertNode(nodeData: llistItem)
    }

    let llist1 = reverse(llist: llist.head!)

    printSinglyLinkedList(head: llist1, sep: " ", fileHandle: fileHandle)
    fileHandle.write("\n".data(using: .utf8)!)
}
