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
    var linkedList: LinkedList?
    
    init(linkedList: LinkedList? = nil) {
        self.linkedList = linkedList
    }
    
    class LinkedList {
        var head: Int
        var nodes: [Node]
        
        init(head: Int, nodes: [Node]) {
            self.head = head
            self.nodes = nodes
        }
    }
    
    class Node: Equatable {
        static func == (lhs: LinkedListRemoveDuplicateEngine.Node, rhs: LinkedListRemoveDuplicateEngine.Node) -> Bool {
            lhs.id == rhs.id
        }
        
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
        
        // when find a duplicate
        // currentNode = head
        // temp = currentNode.next.next
        // currentNode.next = temp
    }
    
    func readList() -> LinkedList? {
        if let linkedList {
            return linkedList
        }
        return nil
    }
    
    func insertList(list: LinkedList) {
        linkedList = list
    }
}

final class LinkedListRemoveDuplicate: XCTestCase {
    func test_initalWriteRead() {
        let sut = makeSUT()
        let orderedLinkedList: LinkedListRemoveDuplicateEngine.LinkedList
        
        let nodes = [
            LinkedListRemoveDuplicateEngine.Node(id: "1", next: "2", value: 1),
            LinkedListRemoveDuplicateEngine.Node(id: "2", next: "3", value: 1),
            LinkedListRemoveDuplicateEngine.Node(id: "3", next: "4", value: 6),
        ]
        
        orderedLinkedList = LinkedListRemoveDuplicateEngine.LinkedList(head: 1, nodes: nodes)

        sut.insertList(list: orderedLinkedList)
        let result = sut.readList()
        
        XCTAssertEqual(result!.nodes, orderedLinkedList.nodes)
        
    }

    
    // MARK: - Helpers
    
    private func makeSUT() -> LinkedListRemoveDuplicateEngine {
        LinkedListRemoveDuplicateEngine()
    }
}
