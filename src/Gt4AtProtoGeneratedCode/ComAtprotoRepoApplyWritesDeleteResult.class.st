Class {
	#name : #ComAtprotoRepoApplyWritesDeleteResult,
	#superclass : #GtApModelEntity,
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoRepoApplyWritesDeleteResult class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesDeleteResult class >> atpFile [
 ^ 'com/atproto/repo/applyWrites.json'
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesDeleteResult class >> atpRecordName [
 ^ 'com.atproto.repo.applyWrites#deleteResult'
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesDeleteResult class >> atpSchema [
 ^ '{"type":"object","required":[],"properties":{}}'
]

{ #category : #serialization }
ComAtprotoRepoApplyWritesDeleteResult class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest
]
