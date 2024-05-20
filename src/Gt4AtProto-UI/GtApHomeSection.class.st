Class {
	#name : #GtApHomeSection,
	#superclass : #GtHomeMultiCardSection,
	#category : #'Gt4AtProto-UI'
}

{ #category : #accessing }
GtApHomeSection >> lepiterCard [
	<gtSectionCard>
	^ GtHomeCard lepiterBaseWithTableOfContents
		title: 'Glamorous Toolkit for AT Protocol docs';
		description: 'Read the docs';
		priority: 10;
		pageName: 'About Glamorous Toolkit for AT Protocol';
		databaseName: 'gt4atproto-lepiter';
		details: [ :db | 
			'This knowledge base documents the interactions with the AT Proto protocol and the BlueSky social network.' ]
]

{ #category : #accessing }
GtApHomeSection >> loginCard [
	<gtSectionCard>
	| card |
	card := GtHomeCard explicit.
	^ card
		description: 'Login to BlueSky';
		priority: 20;
		stencil: [ | form |
			form := GtApLoginForm new
					clientCallback: [ :aClient :anElement | 
						GtWorldUtility
							showObject: ((aClient appBskyActorGetProfileActor: aClient context handle) client: aClient)
							from: anElement ].
			BrVerticalPane new
				exact: 300 @ 250;
				background: Color white;
				aptitude: BrShadowAptitude new beLarge + (GtPhlowBrowseDefinitionAptitude new definition: [ card definingMethod ]);
				cellSpacing: 5;
				padding: (BlInsets all: 10);
				margin: (BlInsets
					top: self spaceGap
					left: 2 * self spaceGap
					bottom: 2 * self spaceGap
					right: 2 * self spaceGap);
				addChild: (BrLabel new
						beLargeSize;
						padding: (BlInsets top: 10 left: 5 bottom: 10 right: 20);
						aptitude: BrGlamorousLabelAptitude new bold;
						text: 'Login to BlueSky');
				addChild: (form asGtMagritteViewModel asElement margin: (BlInsets all: 5)) ]
]

{ #category : #accessing }
GtApHomeSection >> sectionTitle [
	^ 'Glamorous Toolkit for AT Protocol'
]
