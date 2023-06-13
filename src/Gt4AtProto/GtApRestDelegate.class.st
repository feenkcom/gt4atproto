Class {
	#name : #GtApRestDelegate,
	#superclass : #ZnJSONRestServerDelegate,
	#instVars : [
		'configuration'
	],
	#category : #'Gt4AtProto-Server'
}

{ #category : #accessing }
GtApRestDelegate >> configuration [
	^ configuration
]

{ #category : #accessing }
GtApRestDelegate >> configuration: aServerConfiguration [
	configuration := aServerConfiguration
]

{ #category : #accessing }
GtApRestDelegate >> database [
	^ self configuration database
]

{ #category : #accessing }
GtApRestDelegate >> gtViewRestEndpointsFor: aView [
	<gtView>
	| httpMethods |
	httpMethods := #(GET HEAD POST PUT DELETE CONNECT OPTIONS TRACE PATCH).
	^ aView columnedList
		title: 'Endpoints';
		items: [ self uriSpace rootClass withAllSubclasses reject: #isAbstract ];
		column: 'Class' text: #name;
		column: 'Order' text: #order;
		column: 'Pattern'
			text: [ :aClass | String streamContents: [ :s | aClass pattern asStringOn: s delimiter: '/' ] ];
		column: 'Methods'
			text: [ :rowObject :rowIndex :columnIndex | 
				| aComputedItem |
				aComputedItem := [ :aClass | 
					httpMethods
						select: [ :anHttpMethod | aClass canUnderstand: anHttpMethod asLowercase asSymbol ] ]
						phlowValue: rowObject
						withEnoughArguments: {rowObject.
								rowIndex.
								columnIndex}.
				[ :methodsList | String streamContents: [ :s | methodsList asStringOn: s delimiter: ' ' ] ]
					phlowValue: aComputedItem
					withEnoughArguments: {aComputedItem.
							rowIndex.
							columnIndex} ];
		sendTool: [ :aClass | GtClassCoderTool forClass: aClass ]
]

{ #category : #accessing }
GtApRestDelegate >> initialize [
	super initialize.
	self uriSpace: ZnCallHierarchyRestUriSpace new.
	self uriSpace rootClass: GtApRestCall.
]
