Class {
	#name : #PBObject,
	#superclass : #Object,
	#instVars : [
		'pythonVariable'
	],
	#category : #'PythonBridge-Core'
}

{ #category : #initialization }
PBObject >> application [
	^ self applicationClass uniqueInstance
]

{ #category : #initialization }
PBObject >> applicationClass [
	self class == PBObject ifTrue: [ ^ PBApplication ].
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
PBObject >> basicCreateObject [
	self basicCreateObjectArgs: #()
]

{ #category : #'as yet unclassified' }
PBObject >> basicCreateObjectArgs: posArgs [
	self basicCreateObjectArgs: posArgs nameArgs: Dictionary new
]

{ #category : #'as yet unclassified' }
PBObject >> basicCreateObjectArgs: posArgs nameArgs: nameArgs [
	| varName |
	varName := self newPythonVar.
	self application commandFactory << (
		varName <- (self pythonClass callWith: posArgs with: nameArgs)).
	pythonVariable := varName
]

{ #category : #'as yet unclassified' }
PBObject >> createObject [
	self subclassResponsibility
]

{ #category : #'instance creation' }
PBObject >> newPythonVar [
	^ ('pb' , UUID new asString36) asP3GIdentifier
]

{ #category : #'as yet unclassified' }
PBObject >> pythonClass [
	self subclassResponsibility
]

{ #category : #accessing }
PBObject >> pythonVariable [
	^ pythonVariable
]