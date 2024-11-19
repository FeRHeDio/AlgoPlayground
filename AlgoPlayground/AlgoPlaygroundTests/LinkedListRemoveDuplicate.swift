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
        var value: Int
        var next: LinkedList?
        
        init(value: Int) {
            self.value = value
        }
        
        func removeDuplicates(_ linkedList: LinkedList) -> LinkedList {
            var currentNode: LinkedList? = linkedList
            
            while currentNode != nil {
                while currentNode?.value == currentNode?.next?.value {
                    currentNode?.next = currentNode?.next?.next
                }
                
                currentNode = currentNode?.next
            }
            
            return linkedList
        }
        
        func printList(_ head: LinkedList?) {
            var currentNode = head
            
            while let node = currentNode {
                print(node.value, terminator: " -> ")
                currentNode = node.next
            }
            
            print("nil")
        }
    }
}



final class LinkedListRemoveDuplicate: XCTestCase {
//    func test_initalWriteRead() {
//        let sut = makeSUT()
//        let orderedLinkedList: LinkedListRemoveDuplicateEngine.LinkedList
//        
//        let nodes = [
//            LinkedListRemoveDuplicateEngine.Node(id: "1", next: "2", value: 1),
//            LinkedListRemoveDuplicateEngine.Node(id: "2", next: "3", value: 1),
//            LinkedListRemoveDuplicateEngine.Node(id: "3", next: "4", value: 6),
//        ]
//        
//        orderedLinkedList = LinkedListRemoveDuplicateEngine.LinkedList(head: 1, nodes: nodes)
//
//        sut.insertList(list: orderedLinkedList)
//        let result = sut.readList()
//        
//        XCTAssertEqual(result!.nodes, orderedLinkedList.nodes)
//        
//    }

    
    
    func test_linkedList_printLinkedList() {
        let node1 = LL(value: 1)
        let node2 = LL(value: 2)
        let node3 = LL(value: 3)
        let node4 = LL(value: 4)
            
        node1.next = node2
        node2.next = node3
        node3.next = node4
        
        let sut = makeSUT(head: node1)
        
        sut.printList(node1)
    }
    
    
    // MARK: - Helpers
    
    typealias LL = LinkedListRemoveDuplicateEngine.LinkedList
    
    private func makeSUT(head: LL) -> LL {
        LL(value: head.value)
    }
}
