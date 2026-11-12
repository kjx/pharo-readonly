Extension { #name : 'ClassDescription' }

{ #category : '*Readonly' }
ClassDescription >> getShadowClass [
	"return the shadowclass, if none, create it"
	
	^self propertyAt: #readOnlyShadow ifAbsent: [ self error: 'not yet implemented' ] 
]

{ #category : '*Readonly' }
ClassDescription >> isCooked: anObject [
	^ self allSlots allSatisfy: [ :slot | slot isCooked: anObject ]
]
