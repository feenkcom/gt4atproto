Class {
	#name : #GtBlueskyPageEmbedding,
	#superclass : #GtBlueskyEmbedding,
	#instVars : [
		'page'
	],
	#category : #'Gt4Bluesky-Models'
}

{ #category : #'as yet unclassified' }
GtBlueskyPageEmbedding >> asElement [
	^ BrHorizontalPane new hMatchParent
		vExact: 200;
		clipChildren: false;
		background: Color white;
		aptitude: BrShadowAptitude;
		margin: (BlInsets all: 5);
		addChild: self snippetViewModel embeddedPage asPreviewElement
]

{ #category : #'as yet unclassified' }
GtBlueskyPageEmbedding >> asJson [
	^ {'$type' -> 'com.gtoolkit.embed.lepiterPage'.
		'record' -> (LeJsonV4 uniqueInstance serialize: self page)} asDictionary
]

{ #category : #accessing }
GtBlueskyPageEmbedding >> page [
	^ page
]

{ #category : #accessing }
GtBlueskyPageEmbedding >> page: anObject [
	page := anObject
]
