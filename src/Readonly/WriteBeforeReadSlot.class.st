"
A slot what crashes if read before written.

#name => WriteBeforeReadSlot

"
Class {
	#name : 'WriteBeforeReadSlot',
	#superclass : 'IndexedSlot',
	#category : 'Readonly-Slots',
	#package : 'Readonly',
	#tag : 'Slots'
}

{ #category : 'initialization' }
WriteBeforeReadSlot >> initialize: anObject [

	self write: #KjxSentinalForWriteBeforeReadSlot to: anObject
]

{ #category : 'initialization' }
WriteBeforeReadSlot >> isCooked: anObject [

	^(super read: anObject) ~= #KjxSentinalForWriteBeforeReadSlot 
]

{ #category : 'optimization' }
WriteBeforeReadSlot >> optimizeFor: anObject [

	"optimize this object by switching to a shadow version of the class"
	
	"shadow classes are store in the property dict of the class"
	
	anObject primitiveChangeClassTo: anObject class getShadowClass basicNew.
]

{ #category : 'meta-object-protocol' }
WriteBeforeReadSlot >> read: anObject [
	"crash if value hasn't yet been written"

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

{ #category : 'meta-object-protocol' }
WriteBeforeReadSlot >> write: aValue to: anObject [

	| contents |
	contents := super read: anObject.
	
	" write is forbidden if already initialized"
	 #KjxSentinalForWriteBeforeReadSlot == contents
		 	ifFalse: [ self error: 'you cannot write twice' ]
		   ifTrue:  [ super write: aValue to: anObject. ].

	"here we need to check if the class is already cooked, if yes, we can create the shadow"
	
	(self definingClass isCooked: anObject) ifTrue: [ self optimizeFor: anObject ].

	^contents
]
