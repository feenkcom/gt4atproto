Class {
	#name : #AppBskyActorDefsBskyAppStatePref,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpActiveProgressGuide',
		'atpQueuedNudges',
		'atpNuxs'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyActorDefsBskyAppStatePref class >> atpDescription [
 ^  'A grab bag of state that''s specific to the bsky.app program. Third-party apps shouldn''t use this.'
]

{ #category : #accessing }
AppBskyActorDefsBskyAppStatePref class >> atpFile [
 ^ 'app/bsky/actor/defs.json'
]

{ #category : #accessing }
AppBskyActorDefsBskyAppStatePref class >> atpRecordName [
 ^ 'app.bsky.actor.defs#bskyAppStatePref'
]

{ #category : #accessing }
AppBskyActorDefsBskyAppStatePref class >> atpSchema [
 ^ '{"description":"A grab bag of state that''s specific to the bsky.app program. Third-party apps shouldn''t use this.","type":"object","properties":{"activeProgressGuide":{"type":"ref","ref":"#bskyAppProgressGuide"},"queuedNudges":{"description":"An array of tokens which identify nudges (modals, popups, tours, highlight dots) that should be shown to the user.","type":"array","maxLength":1000,"items":{"type":"string","maxLength":100}},"nuxs":{"description":"Storage for NUXs the user has encountered.","type":"array","maxLength":100,"items":{"type":"ref","ref":"app.bsky.actor.defs#nux"}}}}'
]

{ #category : #serialization }
AppBskyActorDefsBskyAppStatePref class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpActiveProgressGuide: (aRequest
				at: 'activeProgressGuide'
				ifPresent: [ :aValue | AppBskyActorDefsBskyAppProgressGuide fromRequest: aValue withClient: aClient ]
				ifAbsent: [ nil ]);
		atpQueuedNudges: (aRequest
				at: 'queuedNudges'
				ifPresent: [ :anArray | anArray collect: [ :aValue | aValue ] ]
				ifAbsent: [ nil ]);
		atpNuxs: (aRequest
				at: 'nuxs'
				ifPresent: [ :anArray | 
					anArray
						collect: [ :aValue | AppBskyActorDefsNux fromRequest: aValue withClient: aClient ] ]
				ifAbsent: [ nil ])
]

{ #category : #magritte }
AppBskyActorDefsBskyAppStatePref >> activeProgressGuideDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'ActiveProgressGuide';
		accessor: #atpActiveProgressGuide
]

{ #category : #accessing }
AppBskyActorDefsBskyAppStatePref >> atpActiveProgressGuide [
	<referenceTo:'#bskyAppProgressGuide'>
	<atpType:#AppBskyActorDefsBskyAppProgressGuide format:nil>
	^ atpActiveProgressGuide
]

{ #category : #accessing }
AppBskyActorDefsBskyAppStatePref >> atpActiveProgressGuide: anObject [
	<referenceTo:'#bskyAppProgressGuide'>
	atpActiveProgressGuide := anObject
]

{ #category : #accessing }
AppBskyActorDefsBskyAppStatePref >> atpNuxs [
	<atpType:#AppBskyActorDefsNux format:nil>
	<atpCollection>
	^ atpNuxs
]

{ #category : #accessing }
AppBskyActorDefsBskyAppStatePref >> atpNuxs: anObject [
	atpNuxs := anObject
]

{ #category : #accessing }
AppBskyActorDefsBskyAppStatePref >> atpQueuedNudges [
	<atpType:#String format:nil>
	<atpCollection>
	^ atpQueuedNudges
]

{ #category : #accessing }
AppBskyActorDefsBskyAppStatePref >> atpQueuedNudges: anObject [
	atpQueuedNudges := anObject
]

{ #category : #magritte }
AppBskyActorDefsBskyAppStatePref >> nuxsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {AppBskyActorDefsNux};
		label: 'Nuxs';
		accessor: #atpNuxs
]

{ #category : #magritte }
AppBskyActorDefsBskyAppStatePref >> queuedNudgesDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {String};
		label: 'QueuedNudges';
		accessor: #atpQueuedNudges
]
