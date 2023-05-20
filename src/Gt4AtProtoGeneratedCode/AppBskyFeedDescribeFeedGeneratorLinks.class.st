Class {
	#name : #AppBskyFeedDescribeFeedGeneratorLinks,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpPrivacyPolicy',
		'atpTermsOfService'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedDescribeFeedGeneratorLinks class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
AppBskyFeedDescribeFeedGeneratorLinks class >> atpFile [
 ^ 'app/bsky/feed/describeFeedGenerator.json'
]

{ #category : #accessing }
AppBskyFeedDescribeFeedGeneratorLinks class >> atpRecordName [
 ^ 'app.bsky.feed.describeFeedGenerator#links'
]

{ #category : #accessing }
AppBskyFeedDescribeFeedGeneratorLinks class >> atpSchema [
 ^ '{"type":"object","properties":{"privacyPolicy":{"type":"string"},"termsOfService":{"type":"string"}}}'
]

{ #category : #serialization }
AppBskyFeedDescribeFeedGeneratorLinks class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpPrivacyPolicy: (aRequest at: 'privacyPolicy' ifAbsent: [ nil ]);
		atpTermsOfService: (aRequest at: 'termsOfService' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedDescribeFeedGeneratorLinks >> atpPrivacyPolicy [
	<atpType:#String format:nil>
	^ atpPrivacyPolicy
]

{ #category : #accessing }
AppBskyFeedDescribeFeedGeneratorLinks >> atpPrivacyPolicy: anObject [
	atpPrivacyPolicy := anObject
]

{ #category : #accessing }
AppBskyFeedDescribeFeedGeneratorLinks >> atpTermsOfService [
	<atpType:#String format:nil>
	^ atpTermsOfService
]

{ #category : #accessing }
AppBskyFeedDescribeFeedGeneratorLinks >> atpTermsOfService: anObject [
	atpTermsOfService := anObject
]

{ #category : #magritte }
AppBskyFeedDescribeFeedGeneratorLinks >> privacyPolicyDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'PrivacyPolicy';
		accessor: #atpPrivacyPolicy
]

{ #category : #magritte }
AppBskyFeedDescribeFeedGeneratorLinks >> termsOfServiceDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'TermsOfService';
		accessor: #atpTermsOfService
]
