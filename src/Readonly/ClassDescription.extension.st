Extension { #name : 'ClassDescription' }

{ #category : '*Readonly' }
ClassDescription >> getShadowClass [
	"return the shadowclass, if none, create it"
	 
	^self propertyAt: #readOnlyShadow ifAbsent: [ 
		| shadowClass |
		shadowClass := self copyForReadOnly.
		"now we need to add superclass"
		
		self superclass == Object 
			ifFalse: [shadowClass basicSuperclass: self superclass getShadowClass]
			ifTrue: [shadowClass basicSuperclass: Object].
		shadowClass compileAllFrom: self.
		"and recompile all methods"	
		
		self error: 'not yet implemented' ] 
]

{ #category : '*Readonly' }
ClassDescription >> isCooked: anObject [
	^ self allSlots allSatisfy: [ :slot | slot isCooked: anObject ]
]
