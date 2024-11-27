Class {
	#name : #GtBlueskyLinkEmbedding,
	#superclass : #GtBlueskyEmbedding,
	#instVars : [
		'post'
	],
	#category : #'Gt4Bluesky-Models'
}

{ #category : #'as yet unclassified' }
GtBlueskyLinkEmbedding class >> blueskyRecord [
	^ AppBskyEmbedRecordMain
]

{ #category : #'as yet unclassified' }
GtBlueskyLinkEmbedding class >> fromRecord: aPost inViewModel: aViewModel [
	^ GtBlueskyLinkEmbedding new
		post: aPost atpPost atpEmbed;
		snippet: aViewModel snippetModel;
		snippetViewModel: aViewModel
]

{ #category : #'as yet unclassified' }
GtBlueskyLinkEmbedding >> asElement [
	^ BrHorizontalPane new fitContent
		clipChildren: false;
		background: Color white;
		aptitude: BrShadowAptitude;
		margin: (BlInsets all: 5);
		addChild: (GtApFeedPostSummaryElement new post: self post)
]

{ #category : #'as yet unclassified' }
GtBlueskyLinkEmbedding >> asJson [
	^ {'$type' -> 'app.bsky.embed.record'.
		'record'
			-> {'uri' -> self post atpPost atpUri.
					'cid' -> self post atpPost atpCid} asDictionary} asDictionary
]

{ #category : #accessing }
GtBlueskyLinkEmbedding >> post [
	^ post
]

{ #category : #accessing }
GtBlueskyLinkEmbedding >> post: anObject [
	post := anObject
]
