// Start of Node class
class Node {
    var data: Int
    var left: Node?
    var right: Node?

    init(d : Int) {
        data  = d
    }
} // End of Node class

// Start of Tree class
class Tree {
    func insert(root: Node?, data: Int) -> Node? {
        if root == nil {
            return Node(d: data)
        }

        if data <= (root?.data)! {
            root?.left = insert(root: root?.left, data: data)
        } else {
            root?.right = insert(root: root?.right, data: data)
        }

        return root
    }

    func levelOrder(root: Node?) -> Void {
        var array: [[Int]] = []
        
        func bf(node: Node, depth: Int) {
            if array.count < depth + 1 {
                array.append([])
            }
            
            array[depth].append(node.data)
            if let leftNode = node.left {
                bf(node: leftNode, depth: depth + 1)
            }
            if let rightNode = node.right {
                bf(node: rightNode, depth: depth + 1)
            }
        }
        bf(node: root!, depth: 0)
        
        array.forEach {
            $0.forEach {
                print($0, terminator: " ")
            }
        }
    } // End of levelOrder function


} // End of Tree class

var root: Node?
let tree = Tree()

let t = Int(readLine()!)!

for _ in 0..<t {
    root = tree.insert(root: root, data: Int(readLine()!)!)
}

tree.levelOrder(root: root)
