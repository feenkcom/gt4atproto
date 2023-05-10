Class {
	#name : #AppBskyNotificationListNotificationsNotification,
	#superclass : #Object,
	#instVars : [
		'atProtoUri',
		'atProtoCid',
		'atProtoAuthor',
		'atProtoReason',
		'atProtoReasonSubject',
		'atProtoRecord',
		'atProtoIsRead',
		'atProtoIndexedAt',
		'atProtoLabels'
	],
	#category : #'Gt4AtProto-GeneratedCode'
}

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification >> atProtoAuthor [
	<referenceTo:'app.bsky.actor.defs#profileView'>
	^ atProtoAuthor
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification >> atProtoAuthor: anObject [
	<referenceTo:'app.bsky.actor.defs#profileView'>
	atProtoAuthor := anObject
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification >> atProtoCid [
	^ atProtoCid
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification >> atProtoCid: anObject [
	atProtoCid := anObject
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification >> atProtoIndexedAt [
	^ atProtoIndexedAt
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification >> atProtoIndexedAt: anObject [
	atProtoIndexedAt := anObject
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification >> atProtoIsRead [
	^ atProtoIsRead
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification >> atProtoIsRead: anObject [
	atProtoIsRead := anObject
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification >> atProtoLabels [
	^ atProtoLabels
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification >> atProtoLabels: anObject [
	atProtoLabels := anObject
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification >> atProtoReason [
	^ atProtoReason
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification >> atProtoReason: anObject [
	atProtoReason := anObject
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification >> atProtoReasonSubject [
	^ atProtoReasonSubject
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification >> atProtoReasonSubject: anObject [
	atProtoReasonSubject := anObject
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification >> atProtoRecord [
	^ atProtoRecord
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification >> atProtoRecord: anObject [
	atProtoRecord := anObject
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification >> atProtoUri [
	^ atProtoUri
]

{ #category : #accessing }
AppBskyNotificationListNotificationsNotification >> atProtoUri: anObject [
	atProtoUri := anObject
]

{ #category : #magritte }
AppBskyNotificationListNotificationsNotification >> authorDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Author';
		accessor: #atProtoAuthor;
		beRequired
]

{ #category : #magritte }
AppBskyNotificationListNotificationsNotification >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atProtoCid;
	beRequired
]

{ #category : #magritte }
AppBskyNotificationListNotificationsNotification >> indexedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'IndexedAt';
		accessor: #atProtoIndexedAt;
	beRequired
]

{ #category : #magritte }
AppBskyNotificationListNotificationsNotification >> isReadDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'IsRead';
		accessor: #atProtoIsRead;
	beRequired
]

{ #category : #magritte }
AppBskyNotificationListNotificationsNotification >> labelsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoLabelDefsLabel};
		label: 'Labels';
		accessor: #atProtoLabels
]

{ #category : #magritte }
AppBskyNotificationListNotificationsNotification >> reasonDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Reason';
		accessor: #atProtoReason;
	beRequired
]

{ #category : #magritte }
AppBskyNotificationListNotificationsNotification >> reasonSubjectDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'ReasonSubject';
		accessor: #atProtoReasonSubject
]

{ #category : #magritte }
AppBskyNotificationListNotificationsNotification >> recordDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Record';
		accessor: #atProtoRecord;
	beRequired
]

{ #category : #magritte }
AppBskyNotificationListNotificationsNotification >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atProtoUri;
	beRequired
]
