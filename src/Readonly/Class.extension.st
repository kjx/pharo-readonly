Extension { #name : 'Class' }

{ #category : '*Readonly' }
Class >> copyForReadOnly [
	"Answer a copy of the receiver to be used for the readOnly experiment.
	You should not use this class for anything else, it is invalid."

	| newClass |
	newClass := self class copy new
		            "basicSuperclass: superclass;"
						methodDict: self methodDict copy;
		            setFormat: format;
		            setName: 'Shadow_', name;
		            classPool: classPool copy;
		            sharedPools: sharedPools copy;
						protocols: protocols copy;
		            basicTag: packageTag.
	Class instSize + 1 to: self class instSize do: [ :offset | newClass instVarAt: offset put: (self instVarAt: offset) ].
	newClass classLayout: (layout copy host: newClass).
	^ newClass
]
