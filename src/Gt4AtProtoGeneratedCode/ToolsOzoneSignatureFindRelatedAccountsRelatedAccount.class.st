Class {
	#name : #ToolsOzoneSignatureFindRelatedAccountsRelatedAccount,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpAccount',
		'atpSimilarities'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneSignatureFindRelatedAccountsRelatedAccount class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ToolsOzoneSignatureFindRelatedAccountsRelatedAccount class >> atpFile [
 ^ 'tools/ozone/signature/findRelatedAccounts.json'
]

{ #category : #accessing }
ToolsOzoneSignatureFindRelatedAccountsRelatedAccount class >> atpRecordName [
 ^ 'tools.ozone.signature.findRelatedAccounts#relatedAccount'
]

{ #category : #accessing }
ToolsOzoneSignatureFindRelatedAccountsRelatedAccount class >> atpSchema [
 ^ '{"type":"object","required":["account"],"properties":{"account":{"type":"ref","ref":"com.atproto.admin.defs#accountView"},"similarities":{"type":"array","items":{"type":"ref","ref":"tools.ozone.signature.defs#sigDetail"}}}}'
]

{ #category : #serialization }
ToolsOzoneSignatureFindRelatedAccountsRelatedAccount class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpAccount: (aRequest
				at: 'account'
				ifPresent: [ :aValue | ComAtprotoAdminDefsAccountView fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpSimilarities: (aRequest
				at: 'similarities'
				ifPresent: [ :anArray | 
					anArray
						collect: [ :aValue | ToolsOzoneSignatureDefsSigDetail fromRequest: aValue ] ]
				ifAbsent: [ nil ])
]

{ #category : #magritte }
ToolsOzoneSignatureFindRelatedAccountsRelatedAccount >> accountDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Account';
		accessor: #atpAccount;
		beRequired
]

{ #category : #accessing }
ToolsOzoneSignatureFindRelatedAccountsRelatedAccount >> atpAccount [
	<referenceTo:'com.atproto.admin.defs#accountView'>
	<atpType:#ComAtprotoAdminDefsAccountView format:nil>
	^ atpAccount
]

{ #category : #accessing }
ToolsOzoneSignatureFindRelatedAccountsRelatedAccount >> atpAccount: anObject [
	<referenceTo:'com.atproto.admin.defs#accountView'>
	atpAccount := anObject
]

{ #category : #accessing }
ToolsOzoneSignatureFindRelatedAccountsRelatedAccount >> atpSimilarities [
	<atpType:#ToolsOzoneSignatureDefsSigDetail format:nil>
	<atpCollection>
	^ atpSimilarities
]

{ #category : #accessing }
ToolsOzoneSignatureFindRelatedAccountsRelatedAccount >> atpSimilarities: anObject [
	atpSimilarities := anObject
]

{ #category : #magritte }
ToolsOzoneSignatureFindRelatedAccountsRelatedAccount >> similaritiesDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ToolsOzoneSignatureDefsSigDetail};
		label: 'Similarities';
		accessor: #atpSimilarities
]
