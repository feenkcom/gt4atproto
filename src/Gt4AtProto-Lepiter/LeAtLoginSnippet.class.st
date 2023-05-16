Class {
	#name : #LeAtLoginSnippet,
	#superclass : #LeSnippet,
	#instVars : [
		'jenkinsUrl'
	],
	#category : #'Gt4AtProto-Lepiter-Model'
}

{ #category : #'api - accessing menu' }
LeAtLoginSnippet class >> contextMenuItemSpecification [
	<leSnippetSpecification>
	^ LeContextMenuItemSpecification new
		snippetClass: self;
		title: 'AT Protocol login'
]

{ #category : #accessing }
LeAtLoginSnippet class >> empty [ 
	^ self new
]

{ #category : #accessing }
LeAtLoginSnippet class >> leJsonV3AttributeMapping [
	^ super leJsonV3AttributeMapping
		yourself 
]

{ #category : #accessing }
LeAtLoginSnippet class >> leJsonV3Name [
	^ 'atprotoLoginSnippet'
]

{ #category : #accessing }
LeAtLoginSnippet class >> leJsonV4AttributeMapping [
	^ super leJsonV4AttributeMapping
		yourself 
]

{ #category : #accessing }
LeAtLoginSnippet class >> leJsonV4Name [
	^ 'atprotoLoginSnippet'
]

{ #category : #accessing }
LeAtLoginSnippet >> asSnippetViewModel [
	<return: #LeSnippetViewModel>
	^ LeApLoginSnippetViewModel new apSnippetModel: self
]

{ #category : #accessing }
LeAtLoginSnippet >> contentAsString [
	<return: #String>
	^ String streamContents: [ :aStream | ]
]
