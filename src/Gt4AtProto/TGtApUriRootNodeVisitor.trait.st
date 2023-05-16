Trait {
	#name : #TGtApUriRootNodeVisitor,
	#traits : 'TSmaCCParseNodeVisitor',
	#classTraits : 'TSmaCCParseNodeVisitor classTrait',
	#category : #'Gt4AtProto-URI'
}

{ #category : #generated }
TGtApUriRootNodeVisitor >> visitDid: aDid [
	^ self visitRoot: aDid
]

{ #category : #generated }
TGtApUriRootNodeVisitor >> visitFragment: aFragment [
	^ self visitRoot: aFragment
]

{ #category : #generated }
TGtApUriRootNodeVisitor >> visitNsId: aNsId [
	^ self visitRoot: aNsId
]

{ #category : #generated }
TGtApUriRootNodeVisitor >> visitPath: aPath [
	^ self visitRoot: aPath
]

{ #category : #generated }
TGtApUriRootNodeVisitor >> visitRegName: aRegName [
	^ self visitRoot: aRegName
]

{ #category : #generated }
TGtApUriRootNodeVisitor >> visitRoot: aRoot [
	^ self visitSmaCCParseNode: aRoot
]
