Class {
	#name : #AppBskyEmbedVideoCaption,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpLang',
		'atpFile'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyEmbedVideoCaption class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyEmbedVideoCaption class >> atpFile [
 ^ 'app/bsky/embed/video.json'
]

{ #category : #accessing }
AppBskyEmbedVideoCaption class >> atpRecordName [
 ^ 'app.bsky.embed.video#caption'
]

{ #category : #accessing }
AppBskyEmbedVideoCaption class >> atpSchema [
 ^ '{"type":"object","required":["lang","file"],"properties":{"lang":{"type":"string","format":"language"},"file":{"type":"blob","accept":["text/vtt"],"maxSize":20000}}}'
]

{ #category : #serialization }
AppBskyEmbedVideoCaption class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpLang: (aRequest at: 'lang' ifAbsent: [ nil ]);
		atpFile: (aRequest at: 'file' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyEmbedVideoCaption >> atpFile [
	<atpType:#ByteArray format:nil>
	^ atpFile
]

{ #category : #accessing }
AppBskyEmbedVideoCaption >> atpFile: anObject [
	atpFile := anObject
]

{ #category : #accessing }
AppBskyEmbedVideoCaption >> atpLang [
	<atpType:#String format:'language'>
	^ atpLang
]

{ #category : #accessing }
AppBskyEmbedVideoCaption >> atpLang: anObject [
	atpLang := anObject
]

{ #category : #magritte }
AppBskyEmbedVideoCaption >> fileDescription [
	<magritteDescription>
	^ MAFileDescription new
		label: 'File';
		accessor: #atpFile;
		beRequired
]

{ #category : #magritte }
AppBskyEmbedVideoCaption >> langDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Lang';
		accessor: #atpLang;
		beRequired
]
