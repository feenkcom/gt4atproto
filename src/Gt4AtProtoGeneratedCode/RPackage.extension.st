Extension { #name : #RPackage }

{ #category : #'*Gt4AtProtoGeneratedCode' }
RPackage >> gtLexiconsFor: aView [
	<gtPackageView>
	self name = #Gt4AtProtoGeneratedCode ifFalse: [ ^ aView empty ].
	^ aView mondrian
		title: 'Lexicons';
		priority: 1.1;
		tooltip: 'Lexicons references';
		painting: [ :m | 
			m nodes
				stencil: [ :eachClass | 
					BlElement new
						geometry: BlCircleGeometry new;
						background: Color black;
						when: BlClickEvent
							do: [ :e | 
								e consumed: true.
								e target phlow spawnTool: (GtClassCoderTool forClass: eachClass) ];
						size: 5 @ 5 ];
				with: GtApModelEntity allSubclasses.
			m edges
				stencil: [ :eachClass | 
					BlLineElement new
						zIndex: -1;
						border: Color lightGray;
						toHead: (BlArrowheadSimpleArrow new
								border: (BlBorder paint: (Color lightGray alpha: 0.8))) ];
				connectToAll: [ :eachClass | eachClass customReferences ].
			m layout force ];
		actionUpdateButton
]
