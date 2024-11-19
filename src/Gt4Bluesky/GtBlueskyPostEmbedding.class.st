Class {
	#name : #GtBlueskyPostEmbedding,
	#superclass : #GtBlueskyEmbedding,
	#instVars : [
		'post'
	],
	#category : #'Gt4Bluesky-Models'
}

{ #category : #'as yet unclassified' }
GtBlueskyPostEmbedding class >> blueskyRecord [
	^ AppBskyEmbedRecordMain
]

{ #category : #'as yet unclassified' }
GtBlueskyPostEmbedding class >> fromRecord: aPost inViewModel: aViewModel [
	^ GtBlueskyPostEmbedding new
		post: aPost atpPost atpEmbed;
		snippet: aViewModel snippetModel;
		snippetViewModel: aViewModel
]

{ #category : #'as yet unclassified' }
GtBlueskyPostEmbedding >> asElement [
	^ BrHorizontalPane new fitContent
		clipChildren: false;
		background: Color white;
		aptitude: BrShadowAptitude;
		margin: (BlInsets all: 5);
		addChild: (GtApFeedPostSummaryElement new post: self post)
]

{ #category : #'as yet unclassified' }
GtBlueskyPostEmbedding >> asJson [
	^ {'$type' -> 'app.bsky.embed.record'.
		'record'
			-> {'uri' -> self post atpPost atpUri.
					'cid' -> self post atpPost atpCid} asDictionary} asDictionary
]

{ #category : #accessing }
GtBlueskyPostEmbedding >> post [
	^ post
]

{ #category : #accessing }
GtBlueskyPostEmbedding >> post: anObject [
	post := anObject
]
