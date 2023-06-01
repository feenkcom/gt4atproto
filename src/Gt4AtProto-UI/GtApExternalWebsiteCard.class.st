Class {
	#name : #GtApExternalWebsiteCard,
	#superclass : #Object,
	#instVars : [
		'url',
		'title',
		'description',
		'thumb'
	],
	#category : #'Gt4AtProto-UI-Models'
}

{ #category : #'instance creation' }
GtApExternalWebsiteCard class >> fromUrl: aUrl [
	^ self new url: aUrl
]

{ #category : #accessing }
GtApExternalWebsiteCard >> description [
	^ description
]

{ #category : #accessing }
GtApExternalWebsiteCard >> description: anObject [
	description := anObject
]

{ #category : #accessing }
GtApExternalWebsiteCard >> descriptionFromMetas: metas [
	(self findInMetas: metas property: 'og:description')
		ifNil: [ (self findInMetas: metas property: 'twitter:description')
				ifNil: [ (self findInMetas: metas name: 'description')
						ifNotNil: [ :aDescription | self description: aDescription ] ]
				ifNotNil: [ :aDescription | self description: aDescription ] ]
		ifNotNil: [ :aDescription | self description: aDescription ]
]

{ #category : #accessing }
GtApExternalWebsiteCard >> findInMetas: metas name: aString [
	^ metas
		detect: [ :aMeta | (aMeta attributeAt: 'name') = aString ]
		ifFound: [ :aMeta | aMeta attributeAt: 'content' ]
		ifNone: [ nil ]
]

{ #category : #accessing }
GtApExternalWebsiteCard >> findInMetas: metas property: aString [
	^ metas
		detect: [ :aMeta | (aMeta attributeAt: 'property') = aString ]
		ifFound: [ :aMeta | aMeta attributeAt: 'content' ]
		ifNone: [ nil ]
]

{ #category : #accessing }
GtApExternalWebsiteCard >> gtViewCardFor: aView [
	<gtView>
	^ aView explicit
		title: 'Card';
		priority: 1;
		stencil: [
			GtApExternalElement new model: self
		]
]

{ #category : #accessing }
GtApExternalWebsiteCard >> thumb [
	^ thumb
]

{ #category : #accessing }
GtApExternalWebsiteCard >> thumb: anObject [
	thumb := anObject
]

{ #category : #accessing }
GtApExternalWebsiteCard >> thumbFromMetas: metas [
	(self findInMetas: metas property: 'og:image')
		ifNil: [ (self findInMetas: metas property: 'twitter:image')
				ifNotNil: [ :aThumb | self thumb: aThumb ] ]
		ifNotNil: [ :aThumb | self thumb: aThumb ]
]

{ #category : #accessing }
GtApExternalWebsiteCard >> title [
	^ title
]

{ #category : #accessing }
GtApExternalWebsiteCard >> title: anObject [
	title := anObject
]

{ #category : #accessing }
GtApExternalWebsiteCard >> titleFromMetas: metas [
	(self findInMetas: metas property: 'og:title')
		ifNil: [ (self findInMetas: metas property: 'twitter:title')
				ifNil: [ (self findInMetas: metas name: 'title')
						ifNotNil: [ :aTitle | self title: aTitle ] ]
				ifNotNil: [ :aTitle | self title: aTitle ] ]
		ifNotNil: [ :aTitle | self title: aTitle ]
]

{ #category : #accessing }
GtApExternalWebsiteCard >> url [
	^ url
]

{ #category : #accessing }
GtApExternalWebsiteCard >> url: aUrl [
	| regex contents metas aPrefixedUrl |
	aPrefixedUrl := (aUrl beginsWith: 'http')
			ifTrue: [ aUrl ]
			ifFalse: [ 'https://' , aUrl ].
	contents := aPrefixedUrl asZnUrl retrieveContents.
	regex := '<meta [^>]*>' asRegex.
	metas := regex
			matchesIn: contents
			collect: [ :aNode | 
				[((aNode endsWith: '/>')
					ifTrue: [ aNode ]
					ifFalse: [ aNode replaceSuffix: '>' with: '/>' ]) parseXML nodes first] on: XMLParserException do: [:e | nil ] ].
	metas := metas reject: #isNil.
	self titleFromMetas: metas.
	self thumbFromMetas: metas.
	self descriptionFromMetas: metas.
	url := aUrl
]
