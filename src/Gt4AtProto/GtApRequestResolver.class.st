Class {
	#name : #GtApRequestResolver,
	#superclass : #Object,
	#category : #'Gt4AtProto-XRPC'
}

{ #category : #accessing }
GtApRequestResolver class >> from: aDictionary andRequest: aRequest [
	aRequest
		keysAndValuesDo: [ :aKey :aValue | 
			aDictionary
				at: aKey
				ifPresent: [ :aTransformer | aRequest at: aKey put: (aTransformer value: aValue) ] ].
	^ aRequest
]
