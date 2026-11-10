"
KentTheBeck hates class comments
"
Class {
	#name : 'MddClass',
	#superclass : 'Object',
	#instVars : [
		'#a => WriteOnceSlot',
		'#b => WriteNeverSlot'
	],
	#category : 'Readonly-Tests',
	#package : 'Readonly-Tests'
}

{ #category : 'accessing' }
MddClass >> a [

	^ a
]

{ #category : 'accessing' }
MddClass >> a: anObject [

	a := anObject
]

{ #category : 'accessing' }
MddClass >> b [

	^ b
]

{ #category : 'accessing' }
MddClass >> b: anObject [

	b := anObject
]

{ #category : 'initialization' }
MddClass >> initialize [
	"The following line is mandatory to support the implementation of ObservableSlot. Do not remove it if you continue to get your class using observable slots."

	self class initializeSlots: self.
	super initialize.
]
