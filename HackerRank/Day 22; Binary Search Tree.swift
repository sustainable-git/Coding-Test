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

    func getHeight(root: Node?) -> Int {
        var maxHeight: Int = 0
        
        func bf(node: Node, count: Int) {
            if count > maxHeight { maxHeight = count }
            if let leftNode = node.left {
                bf(node: leftNode, count: count + 1)
            }
            if let rightNode = node.right {
                bf(node: rightNode, count: count + 1)
            }
        }
        bf(node: root!, count: 0)
        
        return maxHeight
    } // End of getHeight function


} // End of Tree class

var root: Node?
let tree = Tree()

let t = Int(readLine()!)!

for _ in 0..<t {
    root = tree.insert(root: root, data: Int(readLine()!)!)
}

print(tree.getHeight(root: root))
