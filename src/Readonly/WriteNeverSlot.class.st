"
k := KjxClass new.
m := MddClass new.

k b: 32.

k primitiveChangeClassTo: m.

k assert: (32 == k b).

k b.

k b: 23.

NOTE: The experiment validates that we can change the class of an instance a copy with different slots.
Problem: we got confused with ReadOnly vs WriteBeforeRead, the ReadOnly uses wrapped values, so we should change to do this on a WriteOnce slot.
"
Class {
	#name : 'WriteNeverSlot',
	#superclass : 'IndexedSlot',
	#category : 'Readonly-Slots',
	#package : 'Readonly',
	#tag : 'Slots'
}

{ #category : 'initialization' }
WriteNeverSlot >> initialize: anObject [
	super write: nil -> true to: anObject
]

{ #category : 'testing' }
WriteNeverSlot >> isWritten: anObject [
	^ (super read: anObject) value
]

{ #category : 'meta-object-protocol' }
WriteNeverSlot >> read: anObject [
	<reflection: 'Object Inspection - State inspection'>
	^ (super read: anObject) key
]

{ #category : 'initialization' }
WriteNeverSlot >> wantsInitialization [

	^ true
]

{ #category : 'meta-object-protocol' }
WriteNeverSlot >> write: aValue to: anObject [
	<reflection: 'Object Modification - State modification'>
	^(self isWritten: anObject)
		ifTrue: [ (super read: anObject) key: aValue value: false. aValue ]
		ifFalse: [ self error: 'only one assignment allowed' ]
]
