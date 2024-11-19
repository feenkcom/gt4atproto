Class {
	#name : #GtBlueskyPageEmbedding,
	#superclass : #GtBlueskyEmbedding,
	#instVars : [
		'page'
	],
	#category : #'Gt4Bluesky-Models'
}

{ #category : #'as yet unclassified' }
GtBlueskyPageEmbedding class >> blueskyRecord [
	^ GtApUnknownRecord
]

{ #category : #'as yet unclassified' }
GtBlueskyPageEmbedding class >> fromRecord: aPost inViewModel: aViewModel [
	| stringStream anEmbedding |
	stringStream := (aPost atpPost atpRecord atpEmbed rawData at: 'record')
			readStream.

	anEmbedding := self new
			page: (LeJsonV4 uniqueInstance deserialize: stringStream);
			snippet: aViewModel snippetModel;
			snippetViewModel: aViewModel.

	stringStream close.
	^ anEmbedding
]

{ #category : #'as yet unclassified' }
GtBlueskyPageEmbedding >> asElement [
	^ BrHorizontalPane new hMatchParent
		vExact: 200;
		clipChildren: false;
		background: Color white;
		aptitude: BrShadowAptitude;
		margin: (BlInsets all: 5);
		addChild: self page asPreviewElement
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
