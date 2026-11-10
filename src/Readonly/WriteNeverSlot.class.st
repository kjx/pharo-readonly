"
k := KjxClass new.
m := MddClass new.

k b: 32.

k primitiveChangeClassTo: m.

k assert: (32 == k b).

k b.

k b: 23.
"
Class {
	#name : 'WriteNeverSlot',
	#superclass : 'IndexedSlot',
	#category : 'Readonly-Slots',
	#package : 'Readonly',
	#tag : 'Slots'
}

{ #category : 'meta-object-protocol' }
WriteNeverSlot >> write: aValue to: anObject [
	<reflection: 'Object Modification - State modification'>
	self error: 'only one assignment allowed'
]
