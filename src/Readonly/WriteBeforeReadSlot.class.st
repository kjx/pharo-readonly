"
A slot what crashes if read before written.

#name => WriteBeforeReadSlot

"
Class {
	#name : 'WriteBeforeReadSlot',
	#superclass : 'AbstractInitializedSlot',
	#category : 'Readonly-Slots',
	#package : 'Readonly',
	#tag : 'Slots'
}

{ #category : 'initialization' }
WriteBeforeReadSlot >> initialize: anObject [

	self write: #KjxSentinalForWriteBeforeReadSlot   to: anObject
]

{ #category : 'meta-object-protocol' }
WriteBeforeReadSlot >> read: anObject [
	"crash if value hasn't yet been written"

	<reflection: 'Object Inspection - State inspection'>
	| contents |
	contents := super read: anObject.
	^ #KjxSentinalForWriteBeforeReadSlot == contents
		  ifTrue: [ self error: 'you cannot read an uninitialied slot, sorry (not sorry)' ]
		  ifFalse: [ contents ]
]

{ #category : 'meta-object-protocol' }
WriteBeforeReadSlot >> wantsInitialization [
	^ true
]
