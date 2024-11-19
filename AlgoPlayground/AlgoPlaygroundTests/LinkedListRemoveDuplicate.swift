//
//  LinkedListRemoveDuplicate.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 18/11/2024.
//

/*
    ** Prompt **
 
    You're given the head of a Singly Linked List whose nodes are in sorted order with respect to their values.
    Write a function that returns a modified version of the Linked List that doesn't contain any nodes with duplicate values.
 
    The linked list should be modified in place (i.e., you shouldn't create a brand new Linked List), and the modified should still have its
    nodes sorted with respect to their values.
 
    Each `LinkedList` node has an integer `value` as well as a `next` node pointing to the next node in the list or `non/nil` if it's the tail
    of the list.
 
 */


import XCTest

class LinkedListRemoveDuplicateEngine {
    class LinkedList {
        var head: Int
        var nodes: [Node]
        
        init(head: Int, nodes: [Node]) {
            self.head = head
            self.nodes = nodes
        }
    }
    
    class Node {
        var id: String
        var next: String?
        var value: Int
        
        init(id: String, next: String?, value: Int ) {
            self.id = id
            self.next = next
            self.value = value
        }
    }
    
    func findDuplicates(on linkedList: LinkedList) {
        
    }
}

final class LinkedListRemoveDuplicate: XCTestCase {
    func test_initalCase() {
        let sut = makeSUT()
        let orderedLinkedList: LinkedListRemoveDuplicateEngine.LinkedList
        
        let nodes = [
            LinkedListRemoveDuplicateEngine.Node(id: "1", next: "1-2", value: 1),
            LinkedListRemoveDuplicateEngine.Node(id: "1-2", next: nil, value: 1),
        ]
        
        orderedLinkedList = LinkedListRemoveDuplicateEngine.LinkedList(head: 1, nodes: nodes)
        
        sut.findDuplicates(on: orderedLinkedList)
        
    }

    
    // MARK: - Helpers
    
    private func makeSUT() -> LinkedListRemoveDuplicateEngine {
        LinkedListRemoveDuplicateEngine()
    }
}
