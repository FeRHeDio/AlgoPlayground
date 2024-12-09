//
//  LinkedListRemoveDuplicate.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 18/11/2024.
//

/*
    ** Prompt **
 
    You're given the head of a Singly Linked List whose nodes are in sorted order with respect to their values.
    Write a function that returns a modified version of the Linked List that doesn't contain any nodes with 
    duplicate values.
 
    The linked list should be modified in place (i.e., you shouldn't create a brand new Linked List), and the 
    modified should still have its
    nodes sorted with respect to their values.
 
    Each `LinkedList` node has an integer `value` as well as a `next` node pointing to the next node in the list or 
    `non/nil` if it's the tail
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
    func test_linkedList_removeDuplicatesReturnCleanedList() {
        let linkedList = createLinkedList(from: [1, 3, 3, 5, 5, 9])
        let sut = makeSUT(head: linkedList)
        let result = sut.removeDuplicates(linkedList)
        let expectedValues = [1, 3, 5, 9]
        
        let resultValues = linkedListToArray(result)
        
        XCTAssertEqual(resultValues, expectedValues)
    }
    
    func test_linkedList_removeDuplicatesDoesntModify() {
        let linkedList = createLinkedList(from: [1, 3, 5, 9])
        let sut = makeSUT(head: linkedList)
        let result = sut.removeDuplicates(linkedList)
        let expectedValues = [1, 3, 5, 9]
        
        let resultValues = linkedListToArray(result)
        
        XCTAssertEqual(resultValues, expectedValues)
    }
    
    // MARK: - Helpers
    
    typealias LinkedList = LinkedListRemoveDuplicateEngine.LinkedList
    
    private func makeSUT(head: LinkedList) -> LinkedList {
        LinkedList(value: head.value)
    }
    
    private func createLinkedList(from values: [Int]) -> LinkedList {
        guard !values.isEmpty else {
            fatalError("Cannot create a linked list with no values")
        }
        
        let head = LinkedList(value: values[0])
        var current = head
        
        for value in values.dropFirst() {
            let newNode = LinkedList(value: value)
            current.next = newNode
            current = newNode
        }
        
        return head
    }
    
    private func linkedListToArray(_ head: LinkedList?) -> [Int] {
        var array: [Int] = []
        var current = head
        
        while let node = current {
            array.append(node.value)
            current = node.next
        }
        
        return array
    }
}
