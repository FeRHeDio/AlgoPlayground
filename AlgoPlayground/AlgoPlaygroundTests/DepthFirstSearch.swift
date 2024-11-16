//
//  DepthFirstSearch.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 15/11/2024.
//

/*
    ** Prompt **
 
    You're given a `Node` class that has a `name` and an array of optional `children` nodes. When put together, nodes from an acyclic tree-like strcucture.
 
    Implement the `deptFirstSearch` method on the `Node` class, which takes in an array, traverses the tree using the Depth-frist Search approach.
    (Specifically navigatin the tree from left to right), stores all of the node's names in the input array, and returns it.
 
 */

import XCTest

class DepthFirstSearchEngine {
    class Node {
        let name: String
        var children: [Node] // the node
        
        init(name: String) {
            self.name = name
            children = []
        }
        @discardableResult
        func addChild(name: String) -> Node {
            let childNode = Node(name: name)
            children.append(childNode)
            
            return self
        }
        
        func depthFisrtSearch(array: inout [String]) -> [String] {
            array.append(self.name)
            for child in children {
                array = child.depthFisrtSearch(array: &array)
            }
            
            return array
        }
    }
}

final class DepthFirstSearch: XCTestCase {
    func test_DFS_initialCase() {
        let graph = DepthFirstSearchEngine.Node(name: "A")
        
        graph.addChild(name: "B").addChild(name: "C").addChild(name: "D")
        graph.children[0].addChild(name: "E").addChild(name: "F")
        graph.children[2].addChild(name: "G").addChild(name: "H")
        graph.children[0].children[1].addChild(name: "I").addChild(name: "J")
        graph.children[2].children[0].addChild(name: "K")
        
        var arrayToReturn = [String]()
        
        XCTAssertEqual(["A", "B", "E", "F", "I", "J", "C", "D", "G", "K", "H"], graph.depthFisrtSearch(array: &arrayToReturn))
    }
}
