Class {
	#name : #GtApResultStream,
	#superclass : #Object,
	#traits : 'TAsyncStream',
	#classTraits : 'TAsyncStream classTrait',
	#instVars : [
		'cursor',
		'key',
		'resultsList',
		'method',
		'client',
		'parameters'
	],
	#category : #'Gt4AtProto-XRPC - Streams'
}

{ #category : #accessing }
GtApResultStream >> client: aClient [
	client := aClient
]

{ #category : #accessing }
GtApResultStream >> cursor [
	^ cursor
]

{ #category : #accessing }
GtApResultStream >> cursor: anObject [
	^ cursor := anObject
]

{ #category : #accessing }
GtApResultStream >> key [
	^ key
]

{ #category : #accessing }
GtApResultStream >> key: anObject [
	key := anObject
]

{ #category : #accessing }
GtApResultStream >> method: aMethodId [
	method := aMethodId
]

{ #category : #accessing }
GtApResultStream >> parameters [
	^ parameters ifNil: [ parameters := {} asDictionary ]
]

{ #category : #accessing }
GtApResultStream >> parameters: anObject [
	parameters := anObject
]

{ #category : #'api - stream' }
GtApResultStream >> pollNext: anAsynchronousContext [
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
				ifNotNil: [ res := (client
							clientFor: method
							parameters: ({'cursor' -> cursor} asDictionary union: self parameters))
							query.
					resultsList := (res at: key) asOrderedCollection.
					cursor := res at: 'cursor' ifAbsent: [ nil ].
					^ self pollNext: anAsynchronousContext ] ].
	^ AsyncPollReady value: (AsyncOptionalValue some: resultsList removeFirst)
]

{ #category : #accessing }
GtApResultStream >> result: aQueryResult [
	cursor := aQueryResult at: 'cursor'.
	key := (aQueryResult keys asOrderedCollection
			remove: 'cursor';
			yourself) first.
	resultsList := (aQueryResult at: key) asOrderedCollection
]

{ #category : #accessing }
GtApResultStream >> resultsList [
	^ resultsList
]

{ #category : #accessing }
GtApResultStream >> resultsList: anObject [
	resultsList := anObject
]
