Class {
	#name : 'ReadonlyTest',
	#superclass : 'TestCase',
	#category : 'Readonly-Tests',
	#package : 'Readonly-Tests'
}

{ #category : 'tests' }
ReadonlyTest >> testChangeClass [
	| k m |
	k := KjxClass new.
	m := MddClass new.

	k b: 32.

	k primitiveChangeClassTo: m.

	k assert: (32 == k b).
	
	"writing is not possible"
	self should: [k b: 23] raise: Error.
]

{ #category : 'tests' }
ReadonlyTest >> testIsCooked [
	| instance |
	"if there are none, it is true"
	self assert: (Point isCooked: 5@5).
	
	
	instance := KjxClass new.
	self deny: (KjxClass isCooked: instance).
	
	instance b: 5.
	self assert: (KjxClass isCooked: instance).
]

{ #category : 'tests' }
ReadonlyTest >> testWriteBeforeRead [
	| instance |
	instance := KjxClass new.

	"we can not read b as it is undefined"
	self should: [ instance b ] raise: Error.
	
	instance b: 1.
	
	"assignment changes class to the optimzed version, for now hard coded MddClass"
	self assert: instance class == MddClass.
	
	self assert: instance b equals: 1.
]

{ #category : 'tests' }
ReadonlyTest >> testWriteBeforeRead2 [
	"A second write works as expected"
	| instance |
	instance := KjxClass new.

	"we can not read b as it is undefined"
	self should: [ instance b ] raise: Error.
	
	instance b: 1.
	self assert: instance b equals: 1.
	
	"second write not! ok"
	self should: [instance b: 2] raise: Error.
	
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
