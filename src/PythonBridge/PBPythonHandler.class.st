Class {
	#name : #PBPythonHandler,
	#superclass : #PBHandler,
	#instVars : [
		'process'
	],
	#category : #'PythonBridge-Core'
}

{ #category : #accessing }
PBPythonHandler >> errorMessage [
	^ process errorMessage
]

{ #category : #initialization }
PBPythonHandler >> initializeHandler [
	super initializeHandler.
	process := PBPlatform current process: self application
]

{ #category : #testing }
PBPythonHandler >> isRunning [
	^ process isRunning
]

{ #category : #accessing }
PBPythonHandler >> platform [
	^ PBPlatform current
]

{ #category : #testing }
PBPythonHandler >> start [
	self platform ensureEnvironmentForApp: self application.
	^ process start
]

{ #category : #testing }
PBPythonHandler >> stop [
	^ process stop
]
