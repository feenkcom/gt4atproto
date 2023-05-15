Class {
	#name : #GtApModelEntity,
	#superclass : #Object,
	#instVars : [
		'rawData',
		'targetUrl',
		'loginData',
		'client'
	],
	#category : #'Gt4AtProto-UI'
}

{ #category : #accessing }
GtApModelEntity class >> atpFile [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtApModelEntity class >> atpRecordName [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtApModelEntity class >> atpSchema [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtApModelEntity class >> findForRequest: aRequest [
	| typeName |
	typeName := aRequest at: '$type' ifAbsent: [ ^ aRequest ].
	self
		allSubclassesDo: [ :aModelEntityClass | 
			aModelEntityClass atpRecordName = typeName
				ifTrue: [ ^ aModelEntityClass fromRequest: aRequest ] ].
	^ aRequest
]

{ #category : #accessing }
GtApModelEntity class >> fromRawData: aDictionary [
	^ self new 
		rawData: aDictionary
]

{ #category : #accessing }
GtApModelEntity class >> methodId [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtApModelEntity >> client [
	^ client
]

{ #category : #accessing }
GtApModelEntity >> client: anObject [
	client := anObject.
	self onClientChanged
]

{ #category : #accessing }
GtApModelEntity >> gtFileNameFor: aView [
	<gtView>
	^ aView textEditor
		title: 'Schema file';
		priority: 52;
		text: [ self class atpFile ];
		actionButtonIcon: BrGlamorousVectorIcons note
			tooltip: 'Browse schema file'
			action: [ :aButton | 
				aButton phlow
					spawnObject: 'atproto' asFileReference / 'lexicons' / self class atpFile ]
]

{ #category : #accessing }
GtApModelEntity >> gtRawDataFor: aView [
	<gtView>
	^ aView columnedTree
		title: 'Raw data';
		priority: 40;
		items: [ rawData associations ];
		column: 'Property' text: #key;
		column: 'Value' text: #value;
		children: [ :each | 
			each value isDictionary
				ifTrue: [ each value associations ]
				ifFalse: [ (each value isArray and: [ each value allSatisfy: #isDictionary ])
						ifTrue: [ each value collectWithIndex: [ :x :i | i -> x ] ]
						ifFalse: [ #() ] ] ];
		send: #value
]

{ #category : #accessing }
GtApModelEntity >> gtSchemaFor: aView [
	<gtView>
	^ aView forward
		title: 'Schema';
		priority: 51;
		object: [ GtJson forJsonString: self class atpSchema ];
		view: #gtJsonStringFor:;
		actionButtonIcon: BrGlamorousVectorIcons note
			tooltip: 'Browse schema file'
			action: [ :aButton | 
				aButton phlow
					spawnObject: 'atproto' asFileReference / 'lexicons' / self class atpFile ]
]

{ #category : #accessing }
GtApModelEntity >> initialize [
	client := GtApClient new
]

{ #category : #accessing }
GtApModelEntity >> loginData [
	^ loginData
]

{ #category : #accessing }
GtApModelEntity >> loginData: anObject [
	loginData := anObject
]

{ #category : #accessing }
GtApModelEntity >> onClientChanged [
	"can be overriden by subclasses to react to client changes"
]

{ #category : #accessing }
GtApModelEntity >> rawData: aDictionary [ 
	rawData := aDictionary
]

{ #category : #accessing }
GtApModelEntity >> targetUrl [
	^ targetUrl
]

{ #category : #accessing }
GtApModelEntity >> targetUrl: anObject [
	targetUrl := anObject
]
