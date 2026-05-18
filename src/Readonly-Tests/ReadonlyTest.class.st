Class {
	#name : 'ReadonlyTest',
	#superclass : 'TestCase',
	#category : 'Readonly-Tests',
	#package : 'Readonly-Tests'
}

{ #category : 'tests' }
ReadonlyTest >> testWriteBeforeRead [
	| instance |
	instance := KjxClass new.

	"we can not read b as it is undefined"
	self should: [ instance b ] raise: Error.
	
	instance b: 1.
	
	self assert: instance b equals: 1.
]

{ #category : 'tests' }
ReadonlyTest >> testWriteOnce [
	| instance |
	instance := KjxClass new.

	"we can write a once"
	instance a: 1.
	self assert: instance a equals: 1.
	"second raises error"
	self should: [ instance a: 2 ] raise: Error
]
