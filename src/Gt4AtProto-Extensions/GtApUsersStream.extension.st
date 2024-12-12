Extension { #name : #GtApUsersStream }

{ #category : #'*Gt4AtProto-Extensions' }
GtApUsersStream >> gtViewUsersFor: aView [
	<gtView>
	
	^ aView list
		title: 'Users';
		priority: 1;
		items: [ self stream asyncSimilarCopy ];
		itemStencil: [ 
			GtApFeedUserSummaryListContainerElement new ];
		itemDataBinder: [ :aUserElement :aUser | 
			aUserElement user: aUser ].
]
