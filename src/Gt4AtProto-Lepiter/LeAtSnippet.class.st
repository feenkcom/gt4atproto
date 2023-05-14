Class {
	#name : #LeAtSnippet,
	#superclass : #LeSnippet,
	#instVars : [
		'jenkinsUrl'
	],
	#category : #'Gt4AtProto-Lepiter-Model'
}

{ #category : #'api - accessing menu' }
LeAtSnippet class >> contextMenuItemSpecification [
	<leSnippetSpecification>
	^ LeContextMenuItemSpecification new
		snippetClass: self;
		title: 'AT Protocol login'
]

{ #category : #accessing }
LeAtSnippet class >> empty [ 
	^ self new
]

{ #category : #accessing }
LeAtSnippet class >> leJsonV3AttributeMapping [
	^ super leJsonV3AttributeMapping
		yourself 
]

{ #category : #accessing }
LeAtSnippet class >> leJsonV3Name [
	^ 'atprotoLoginSnippet'
]

{ #category : #accessing }
LeAtSnippet class >> leJsonV4AttributeMapping [
	^ super leJsonV4AttributeMapping
		yourself 
]

{ #category : #accessing }
LeAtSnippet class >> leJsonV4Name [
	^ 'atprotoLoginSnippet'
]

{ #category : #accessing }
LeAtSnippet >> asSnippetViewModel [
	<return: #LeSnippetViewModel>
	^ LeApSnippetViewModel new apSnippetModel: self
]

{ #category : #accessing }
LeAtSnippet >> contentAsString [
	<return: #String>
	^ String streamContents: [ :aStream | ]
]
