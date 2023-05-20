Extension { #name : #RPackage }

{ #category : #'*Gt4AtProto-Extensions' }
RPackage >> gtAtpLexiconsFor: aView [
	<gtPackageView>
	<gtView>
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
						aptitude: ((BrGlamorousWithLabelTooltipAptitude new text: eachClass name) + (BrStyleCommonAptitude new
						default: [ :s | s background: Color black ];
						hovered: [ :s | s background: Color blue lighter ];
						pressed: [ :s | s background: Color blue muchLighter ]));
						when: BlClickEvent
							do: [ :e | 
								e consumed: true.
								e target phlow spawnTool: (GtClassCoderTool forClass: eachClass) ];
						size: 10 @ 10 ];
				with: GtApModelEntity allSubclasses.
			m edges
				stencil: [ :eachClass | 
					BlLineElement new
						zIndex: -1;
						border: Color lightGray;
						toHead: (BlArrowheadSimpleArrow new
								border: (BlBorder paint: (Color lightGray alpha: 0.8))) ];
				connectToAll: [ :eachClass | eachClass customReferences ].
			m layout force  charge: -100];
		actionUpdateButton
]
