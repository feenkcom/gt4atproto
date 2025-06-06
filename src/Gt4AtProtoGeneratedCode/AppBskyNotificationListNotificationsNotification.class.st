Class {
	#name : #AppBskyNotificationListNotificationsNotification,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUri',
		'atpCid',
		'atpAuthor',
		'atpReason',
		'atpReasonSubject',
		'atpRecord',
		'atpIsRead',
		'atpIndexedAt',
		'atpLabels'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification class >> atpFile [
 ^ 'app/bsky/notification/listNotifications.json'
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification class >> atpRecordName [
 ^ 'app.bsky.notification.listNotifications#notification'
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification class >> atpSchema [
 ^ '{"type":"object","required":["uri","cid","author","reason","record","isRead","indexedAt"],"properties":{"uri":{"type":"string","format":"at-uri"},"cid":{"type":"string","format":"cid"},"author":{"type":"ref","ref":"app.bsky.actor.defs#profileView"},"reason":{"type":"string","description":"Expected values are ''like'', ''repost'', ''follow'', ''mention'', ''reply'', ''quote'', and ''starterpack-joined''.","knownValues":["like","repost","follow","mention","reply","quote","starterpack-joined"]},"reasonSubject":{"type":"string","format":"at-uri"},"record":{"type":"unknown"},"isRead":{"type":"boolean"},"indexedAt":{"type":"string","format":"datetime"},"labels":{"type":"array","items":{"type":"ref","ref":"com.atproto.label.defs#label"}}}}'
]

{ #category : #serialization }
AppBskyNotificationListNotificationsNotification class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ]);
		atpCid: (aRequest at: 'cid' ifAbsent: [ nil ]);
		atpAuthor: (aRequest
				at: 'author'
				ifPresent: [ :aValue | AppBskyActorDefsProfileView fromRequest: aValue withClient: aClient ]
				ifAbsent: [ nil ]);
		atpReason: (aRequest at: 'reason' ifAbsent: [ nil ]);
		atpReasonSubject: (aRequest at: 'reasonSubject' ifAbsent: [ nil ]);
		atpRecord: (aRequest
				at: 'record'
				ifPresent: [ :aValue | GtApModelEntity findForRequest: aValue withClient: aClient ]
				ifAbsent: [ nil ]);
		atpIsRead: (aRequest at: 'isRead' ifAbsent: [ nil ]);
		atpIndexedAt: (aRequest at: 'indexedAt' ifAbsent: [ nil ]);
		atpLabels: (aRequest
				at: 'labels'
				ifPresent: [ :anArray | 
					anArray
						collect: [ :aValue | ComAtprotoLabelDefsLabel fromRequest: aValue withClient: aClient ] ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification >> atpAuthor [
	<referenceTo:'app.bsky.actor.defs#profileView'>
	<atpType:#AppBskyActorDefsProfileView format:nil>
	^ atpAuthor
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification >> atpAuthor: anObject [
	<referenceTo:'app.bsky.actor.defs#profileView'>
	atpAuthor := anObject
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification >> atpCid [
	<atpType:#String format:'cid'>
	^ atpCid
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification >> atpCid: anObject [
	atpCid := anObject
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification >> atpIndexedAt [
	<atpType:#String format:'datetime'>
	^ atpIndexedAt
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification >> atpIndexedAt: anObject [
	atpIndexedAt := anObject
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification >> atpIsRead [
	<atpType:#Boolean format:nil>
	^ atpIsRead
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification >> atpIsRead: anObject [
	atpIsRead := anObject
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification >> atpLabels [
	<atpType:#ComAtprotoLabelDefsLabel format:nil>
	<atpCollection>
	^ atpLabels
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification >> atpLabels: anObject [
	atpLabels := anObject
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification >> atpReason [
	<atpType:#String format:nil>
	^ atpReason
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification >> atpReason: anObject [
	atpReason := anObject
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification >> atpReasonSubject [
	<atpType:#String format:'at-uri'>
	^ atpReasonSubject
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification >> atpReasonSubject: anObject [
	atpReasonSubject := anObject
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification >> atpRecord [
	<atpType:#Object format:nil>
	^ atpRecord
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification >> atpRecord: anObject [
	atpRecord := anObject
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification >> atpUri [
	<atpType:#String format:'at-uri'>
	^ atpUri
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #magritte }
AppBskyNotificationListNotificationsNotification >> authorDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Author';
		accessor: #atpAuthor;
		beRequired
]

{ #category : #magritte }
AppBskyNotificationListNotificationsNotification >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atpCid;
		beRequired
]

{ #category : #magritte }
AppBskyNotificationListNotificationsNotification >> indexedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'IndexedAt';
		accessor: #atpIndexedAt;
		beRequired
]

{ #category : #magritte }
AppBskyNotificationListNotificationsNotification >> isReadDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'IsRead';
		accessor: #atpIsRead;
		beRequired
]

{ #category : #magritte }
AppBskyNotificationListNotificationsNotification >> labelsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoLabelDefsLabel};
		label: 'Labels';
		accessor: #atpLabels
]

{ #category : #magritte }
AppBskyNotificationListNotificationsNotification >> reasonDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Reason';
		accessor: #atpReason;
		beRequired
]

{ #category : #magritte }
AppBskyNotificationListNotificationsNotification >> reasonSubjectDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'ReasonSubject';
		accessor: #atpReasonSubject
]

{ #category : #magritte }
AppBskyNotificationListNotificationsNotification >> recordDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Record';
		accessor: #atpRecord;
		beRequired
]

{ #category : #magritte }
AppBskyNotificationListNotificationsNotification >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
		beRequired
]
