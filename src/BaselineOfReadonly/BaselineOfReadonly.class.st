Class {
	#name : 'BaselineOfReadonly',
	#superclass : 'Object',
	#category : 'BaselineOfReadonly',
	#package : 'BaselineOfReadonly'
}

{ #category : 'baselines' }
BaselineOfReadonly >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec package: #Readonly with: [  ].
		spec package: #'Readonly-Tests' with: [ spec requires: #('Readonly') ]].

	spec 
		group: 'tests' with: #('Readonly-Tests');
		group: 'default' with: #( 'Readonly' 'tests' ) 
]
