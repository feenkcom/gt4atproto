Class {
	#name : #ATPResultStream,
	#superclass : #Object,
	#traits : 'TAsyncStream',
	#classTraits : 'TAsyncStream classTrait',
	#instVars : [
		'cursor',
		'key',
		'resultsList',
		'method',
		'client'
	],
	#category : #'Gt4AtProto-XRPC - Streams'
}

{ #category : #accessing }
ATPResultStream >> client: aClient [
	client := aClient
]

{ #category : #accessing }
ATPResultStream >> method: aMethodId [
	method := aMethodId
]

{ #category : #'api - stream' }
ATPResultStream >> pollNext: anAsynchronousContext [
	"Attempt to pull out the next value of this stream, registering the current task for wakeup if the value is not yet available, and returning None if the stream is exhausted.
	There are several possible return values, each indicating a distinct stream state:
	 - Poll::Pending means that this stream's next value is not ready yet. Implementations will ensure that the current task will be notified when the next value may be ready.
	 - Poll::Ready(Some(val)) means that the stream has successfully produced a value, val, and may produce further values on subsequent poll_next calls.
	 - Poll::Ready(None) means that the stream has terminated, and poll_next should not be invoked again."

	<return: #AsyncPoll>
	resultsList
		ifEmpty: [ | res |
			cursor
				ifNil: [ ^ AsyncPollReady value: AsyncOptionalValue none ]
				ifNotNil: [ res := (client clientFor: method parameters: {'cursor' -> cursor} asDictionary)
							query.
					resultsList := (res at: key) asOrderedCollection.
					cursor := res at: 'cursor' ] ].
	^ AsyncPollReady value: (AsyncOptionalValue some: resultsList removeFirst)
]

{ #category : #accessing }
ATPResultStream >> result: aQueryResult [
	cursor := aQueryResult at: 'cursor'.
	key := (aQueryResult keys asOrderedCollection
			remove: 'cursor';
			yourself) first.
	resultsList := (aQueryResult at: key) asOrderedCollection
]