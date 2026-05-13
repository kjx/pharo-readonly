"
KentTheBeck hates class comments
"
Class {
	#name : 'KjxClass',
	#superclass : 'Object',
	#instVars : [
		'#a => WriteOnceSlot',
		'#b => WriteBeforeReadSlot'
	],
	#category : 'Readonly-Tests',
	#package : 'Readonly-Tests'
}

{ #category : 'accessing' }
KjxClass >> a [

	^ a
]

{ #category : 'accessing' }
KjxClass >> a: anObject [

	a := anObject
]

{ #category : 'accessing' }
KjxClass >> b [

	^ b
]

{ #category : 'accessing' }
KjxClass >> b: anObject [

	b := anObject
]

{ #category : 'initialization' }
KjxClass >> initialize [
	super initialize.
	self class initializeSlots: self.

]

{ #category : 'hacking' }
KjxClass >> testyMcTestFace [
	"comment stating purpose of instance-side method"
	"KjxClass new testyMcTestFace"


	Transcript show: 'about to read'; cr.
	Transcript show: a; cr; cr.
	Transcript show: 'writing 52'; cr.
	a := 52. 

	Transcript show: 'reading: '; show: a; cr.
   Transcript show: 'writing 25'; cr.
	a := 25.
	

]

{ #category : 'hacking' }
KjxClass >> testyMcTestFace2 [
	"comment stating purpose of instance-side method"

	"KjxClass new testyMcTestFace"

	Transcript
		show: 'about to read';
		cr.
	Transcript
		show: a;
		cr;
		cr.
	Transcript
		show: 'writing 52';
		cr.
	a := 52.

	Transcript
		show: 'reading: ';
		show: a;
		cr.
	Transcript
		show: 'writing 25';
		cr.
	a := 25
]

{ #category : 'hacking' }
KjxClass >> testyMcTestFace3 [

	"comment stating purpose of instance-side method"

	"KjxClass new testyMcTestFace3"

	Transcript
		show: 'writing 52';
		cr.
	b := 52.

	Transcript
		show: 'reading: ';
		show: b;
		cr.
	Transcript
		show: 'writing 25';
		cr.
	b := 25.
		Transcript
		show: 'reading: ';
		show: b;
		cr.
]
