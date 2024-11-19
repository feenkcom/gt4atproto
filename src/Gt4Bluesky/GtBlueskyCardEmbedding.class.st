Class {
	#name : #GtBlueskyCardEmbedding,
	#superclass : #GtBlueskyEmbedding,
	#instVars : [
		'card'
	],
	#category : #'Gt4Bluesky-Models'
}

{ #category : #'as yet unclassified' }
GtBlueskyCardEmbedding class >> blueskyRecord [
	^ AppBskyEmbedExternalMain
]

{ #category : #'as yet unclassified' }
GtBlueskyCardEmbedding class >> fromRecord: aPost inViewModel: aViewModel [
	^ self new
		card: (GtApExternalWebsiteCard
				fromExternal: aPost atpPost atpRecord atpEmbed atpExternal);
		snippet: aViewModel snippetModel;
		snippetViewModel: aViewModel
]

{ #category : #'as yet unclassified' }
GtBlueskyCardEmbedding >> asElement [
	^ BrHorizontalPane new fitContent
		clipChildren: false;
		background: Color white;
		aptitude: BrShadowAptitude;
		margin: (BlInsets all: 5);
		addChild: (GtApExternalElement new model: self card)
]

{ #category : #'as yet unclassified' }
GtBlueskyCardEmbedding >> asJson [
	| externalDictionary tempfile thumbUrl fileReference blob |
	externalDictionary := {'description' -> self card description.
			'title' -> self card title.
			'uri' -> self card url} asDictionary.

	self card thumb
		ifNotNil: [ thumbUrl := self card thumb asZnUrl.
			tempfile := Smalltalk imageDirectory / thumbUrl file.
			tempfile ensureDelete.
			fileReference := thumbUrl saveContentsToFile: tempfile.
			blob := self snippet client comAtprotoRepoUploadBlobFile: fileReference.
			externalDictionary
				at: 'thumb'
				put: ((blob at: 'blob') union: {'$type' -> 'blob'} asDictionary).
			tempfile ensureDelete ].

	^ {'$type' -> 'app.bsky.embed.external'.
		'external' -> externalDictionary} asDictionary
]

{ #category : #accessing }
GtBlueskyCardEmbedding >> card [
	^ card
]

{ #category : #accessing }
GtBlueskyCardEmbedding >> card: anObject [
	card := anObject
]
