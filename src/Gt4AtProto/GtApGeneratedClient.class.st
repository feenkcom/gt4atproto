Class {
	#name : #GtApGeneratedClient,
	#superclass : #GtApClient,
	#category : #'Gt4AtProto-GeneratedCode'
}

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> appBskyActorGetProfile [
	<xrpcQuery>
	^ self queryOn: 'app.bsky.actor.getProfile'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> appBskyActorGetProfiles [
	<xrpcQuery>
	^ self queryOn: 'app.bsky.actor.getProfiles'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> appBskyActorGetSuggestions [
	<xrpcQuery>
	^ self queryOn: 'app.bsky.actor.getSuggestions'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> appBskyActorSearchActors [
	<xrpcQuery>
	^ self queryOn: 'app.bsky.actor.searchActors'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> appBskyActorSearchActorsTypeahead [
	<xrpcQuery>
	^ self queryOn: 'app.bsky.actor.searchActorsTypeahead'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetAuthorFeed [
	<xrpcQuery>
	^ self queryOn: 'app.bsky.feed.getAuthorFeed'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetLikes [
	<xrpcQuery>
	^ self queryOn: 'app.bsky.feed.getLikes'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetPostThread [
	<xrpcQuery>
	^ self queryOn: 'app.bsky.feed.getPostThread'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetPosts [
	<xrpcQuery>
	^ self queryOn: 'app.bsky.feed.getPosts'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetRepostedBy [
	<xrpcQuery>
	^ self queryOn: 'app.bsky.feed.getRepostedBy'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetTimeline [
	<xrpcQuery>
	^ self queryOn: 'app.bsky.feed.getTimeline'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> appBskyGraphGetBlocks [
	<xrpcQuery>
	^ self queryOn: 'app.bsky.graph.getBlocks'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> appBskyGraphGetFollowers [
	<xrpcQuery>
	^ self queryOn: 'app.bsky.graph.getFollowers'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> appBskyGraphGetFollows [
	<xrpcQuery>
	^ self queryOn: 'app.bsky.graph.getFollows'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> appBskyGraphGetMutes [
	<xrpcQuery>
	^ self queryOn: 'app.bsky.graph.getMutes'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> appBskyGraphMuteActoractor: actor [ 
	<xrpcProcedure>
	^ self procedureOn: 'app.bsky.graph.muteActor' withBody: {'actor' -> actor} asDictionary
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> appBskyGraphUnmuteActoractor: actor [ 
	<xrpcProcedure>
	^ self procedureOn: 'app.bsky.graph.unmuteActor' withBody: {'actor' -> actor} asDictionary
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> appBskyNotificationGetUnreadCount [
	<xrpcQuery>
	^ self queryOn: 'app.bsky.notification.getUnreadCount'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> appBskyNotificationListNotifications [
	<xrpcQuery>
	^ self queryOn: 'app.bsky.notification.listNotifications'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> appBskyNotificationUpdateSeenseenAt: seenAt [ 
	<xrpcProcedure>
	^ self procedureOn: 'app.bsky.notification.updateSeen' withBody: {'seenAt' -> seenAt} asDictionary
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> appBskyUnspeccedGetPopular [
	<xrpcQuery>
	^ self queryOn: 'app.bsky.unspecced.getPopular'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminDisableAccountInvitesaccount: account [ 
	<xrpcProcedure>
	^ self procedureOn: 'com.atproto.admin.disableAccountInvites' withBody: {'account' -> account} asDictionary
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminDisableInviteCodescodes: codes accounts: accounts [ 
	<xrpcProcedure>
	^ self procedureOn: 'com.atproto.admin.disableInviteCodes' withBody: {'codes' -> codes. 'accounts' -> accounts} asDictionary
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminEnableAccountInvitesaccount: account [ 
	<xrpcProcedure>
	^ self procedureOn: 'com.atproto.admin.enableAccountInvites' withBody: {'account' -> account} asDictionary
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminGetInviteCodes [
	<xrpcQuery>
	^ self queryOn: 'com.atproto.admin.getInviteCodes'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminGetModerationAction [
	<xrpcQuery>
	^ self queryOn: 'com.atproto.admin.getModerationAction'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminGetModerationActions [
	<xrpcQuery>
	^ self queryOn: 'com.atproto.admin.getModerationActions'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminGetModerationReport [
	<xrpcQuery>
	^ self queryOn: 'com.atproto.admin.getModerationReport'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminGetModerationReports [
	<xrpcQuery>
	^ self queryOn: 'com.atproto.admin.getModerationReports'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminGetRecord [
	<xrpcQuery>
	^ self queryOn: 'com.atproto.admin.getRecord'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminGetRepo [
	<xrpcQuery>
	^ self queryOn: 'com.atproto.admin.getRepo'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminResolveModerationReportsactionId: actionId reportIds: reportIds createdBy: createdBy [ 
	<xrpcProcedure>
	^ self procedureOn: 'com.atproto.admin.resolveModerationReports' withBody: {'actionId' -> actionId. 'reportIds' -> reportIds. 'createdBy' -> createdBy} asDictionary
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminReverseModerationActionid: id reason: reason createdBy: createdBy [ 
	<xrpcProcedure>
	^ self procedureOn: 'com.atproto.admin.reverseModerationAction' withBody: {'id' -> id. 'reason' -> reason. 'createdBy' -> createdBy} asDictionary
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminSearchRepos [
	<xrpcQuery>
	^ self queryOn: 'com.atproto.admin.searchRepos'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminTakeModerationActionaction: action subject: subject subjectBlobCids: subjectBlobCids createLabelVals: createLabelVals negateLabelVals: negateLabelVals reason: reason createdBy: createdBy [ 
	<xrpcProcedure>
	^ self procedureOn: 'com.atproto.admin.takeModerationAction' withBody: {'action' -> action. 'subject' -> subject. 'subjectBlobCids' -> subjectBlobCids. 'createLabelVals' -> createLabelVals. 'negateLabelVals' -> negateLabelVals. 'reason' -> reason. 'createdBy' -> createdBy} asDictionary
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminUpdateAccountEmailaccount: account email: email [ 
	<xrpcProcedure>
	^ self procedureOn: 'com.atproto.admin.updateAccountEmail' withBody: {'account' -> account. 'email' -> email} asDictionary
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminUpdateAccountHandledid: did handle: handle [ 
	<xrpcProcedure>
	^ self procedureOn: 'com.atproto.admin.updateAccountHandle' withBody: {'did' -> did. 'handle' -> handle} asDictionary
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoIdentityResolveHandle [
	<xrpcQuery>
	^ self queryOn: 'com.atproto.identity.resolveHandle'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoIdentityUpdateHandlehandle: handle [ 
	<xrpcProcedure>
	^ self procedureOn: 'com.atproto.identity.updateHandle' withBody: {'handle' -> handle} asDictionary
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoLabelQueryLabels [
	<xrpcQuery>
	^ self queryOn: 'com.atproto.label.queryLabels'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoModerationCreateReportreasonType: reasonType reason: reason subject: subject [ 
	<xrpcProcedure>
	^ self procedureOn: 'com.atproto.moderation.createReport' withBody: {'reasonType' -> reasonType. 'reason' -> reason. 'subject' -> subject} asDictionary
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoApplyWritesrepo: repo validate: validate writes: writes swapCommit: swapCommit [ 
	<xrpcProcedure>
	^ self procedureOn: 'com.atproto.repo.applyWrites' withBody: {'repo' -> repo. 'validate' -> validate. 'writes' -> writes. 'swapCommit' -> swapCommit} asDictionary
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoCreateRecordrepo: repo collection: collection rkey: rkey validate: validate record: record swapCommit: swapCommit [ 
	<xrpcProcedure>
	^ self procedureOn: 'com.atproto.repo.createRecord' withBody: {'repo' -> repo. 'collection' -> collection. 'rkey' -> rkey. 'validate' -> validate. 'record' -> record. 'swapCommit' -> swapCommit} asDictionary
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoDeleteRecordrepo: repo collection: collection rkey: rkey swapRecord: swapRecord swapCommit: swapCommit [ 
	<xrpcProcedure>
	^ self procedureOn: 'com.atproto.repo.deleteRecord' withBody: {'repo' -> repo. 'collection' -> collection. 'rkey' -> rkey. 'swapRecord' -> swapRecord. 'swapCommit' -> swapCommit} asDictionary
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoDescribeRepo [
	<xrpcQuery>
	^ self queryOn: 'com.atproto.repo.describeRepo'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoGetRecord [
	<xrpcQuery>
	^ self queryOn: 'com.atproto.repo.getRecord'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoListRecords [
	<xrpcQuery>
	^ self queryOn: 'com.atproto.repo.listRecords'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoPutRecordrepo: repo collection: collection rkey: rkey validate: validate record: record swapRecord: swapRecord swapCommit: swapCommit [ 
	<xrpcProcedure>
	^ self procedureOn: 'com.atproto.repo.putRecord' withBody: {'repo' -> repo. 'collection' -> collection. 'rkey' -> rkey. 'validate' -> validate. 'record' -> record. 'swapRecord' -> swapRecord. 'swapCommit' -> swapCommit} asDictionary
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoRebaseReporepo: repo swapCommit: swapCommit [ 
	<xrpcProcedure>
	^ self procedureOn: 'com.atproto.repo.rebaseRepo' withBody: {'repo' -> repo. 'swapCommit' -> swapCommit} asDictionary
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoUploadBlob [
	<xrpcProcedure>
	^ self procedureOn: 'com.atproto.repo.uploadBlob' withBody: {} asDictionary
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoServerCreateAccountemail: email handle: handle inviteCode: inviteCode password: password recoveryKey: recoveryKey [ 
	<xrpcProcedure>
	^ self procedureOn: 'com.atproto.server.createAccount' withBody: {'email' -> email. 'handle' -> handle. 'inviteCode' -> inviteCode. 'password' -> password. 'recoveryKey' -> recoveryKey} asDictionary
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoServerCreateAppPasswordname: name [ 
	<xrpcProcedure>
	^ self procedureOn: 'com.atproto.server.createAppPassword' withBody: {'name' -> name} asDictionary
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoServerCreateInviteCodescodeCount: codeCount useCount: useCount forAccounts: forAccounts [ 
	<xrpcProcedure>
	^ self procedureOn: 'com.atproto.server.createInviteCodes' withBody: {'codeCount' -> codeCount. 'useCount' -> useCount. 'forAccounts' -> forAccounts} asDictionary
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoServerCreateInviteCodeuseCount: useCount forAccount: forAccount [ 
	<xrpcProcedure>
	^ self procedureOn: 'com.atproto.server.createInviteCode' withBody: {'useCount' -> useCount. 'forAccount' -> forAccount} asDictionary
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoServerCreateSessionidentifier: identifier password: password [ 
	<xrpcProcedure>
	^ self procedureOn: 'com.atproto.server.createSession' withBody: {'identifier' -> identifier. 'password' -> password} asDictionary
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoServerDeleteAccountdid: did password: password token: token [ 
	<xrpcProcedure>
	^ self procedureOn: 'com.atproto.server.deleteAccount' withBody: {'did' -> did. 'password' -> password. 'token' -> token} asDictionary
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoServerDeleteSession [
	<xrpcProcedure>
	^ self procedureOn: 'com.atproto.server.deleteSession' withBody: {} asDictionary
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoServerDescribeServer [
	<xrpcQuery>
	^ self queryOn: 'com.atproto.server.describeServer'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoServerGetAccountInviteCodes [
	<xrpcQuery>
	^ self queryOn: 'com.atproto.server.getAccountInviteCodes'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoServerGetSession [
	<xrpcQuery>
	^ self queryOn: 'com.atproto.server.getSession'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoServerListAppPasswords [
	<xrpcQuery>
	^ self queryOn: 'com.atproto.server.listAppPasswords'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoServerRefreshSession [
	<xrpcProcedure>
	^ self procedureOn: 'com.atproto.server.refreshSession' withBody: {} asDictionary
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoServerRequestAccountDelete [
	<xrpcProcedure>
	^ self procedureOn: 'com.atproto.server.requestAccountDelete' withBody: {} asDictionary
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoServerRequestPasswordResetemail: email [ 
	<xrpcProcedure>
	^ self procedureOn: 'com.atproto.server.requestPasswordReset' withBody: {'email' -> email} asDictionary
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoServerResetPasswordtoken: token password: password [ 
	<xrpcProcedure>
	^ self procedureOn: 'com.atproto.server.resetPassword' withBody: {'token' -> token. 'password' -> password} asDictionary
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoServerRevokeAppPasswordname: name [ 
	<xrpcProcedure>
	^ self procedureOn: 'com.atproto.server.revokeAppPassword' withBody: {'name' -> name} asDictionary
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncGetBlob [
	<xrpcQuery>
	^ self queryOn: 'com.atproto.sync.getBlob'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncGetBlocks [
	<xrpcQuery>
	^ self queryOn: 'com.atproto.sync.getBlocks'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncGetCheckout [
	<xrpcQuery>
	^ self queryOn: 'com.atproto.sync.getCheckout'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncGetCommitPath [
	<xrpcQuery>
	^ self queryOn: 'com.atproto.sync.getCommitPath'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncGetHead [
	<xrpcQuery>
	^ self queryOn: 'com.atproto.sync.getHead'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncGetRecord [
	<xrpcQuery>
	^ self queryOn: 'com.atproto.sync.getRecord'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncGetRepo [
	<xrpcQuery>
	^ self queryOn: 'com.atproto.sync.getRepo'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncListBlobs [
	<xrpcQuery>
	^ self queryOn: 'com.atproto.sync.listBlobs'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncListRepos [
	<xrpcQuery>
	^ self queryOn: 'com.atproto.sync.listRepos'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncNotifyOfUpdate [
	<xrpcQuery>
	^ self queryOn: 'com.atproto.sync.notifyOfUpdate'
]

{ #category : #'*Gt4AtProto-GeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncRequestCrawl [
	<xrpcQuery>
	^ self queryOn: 'com.atproto.sync.requestCrawl'
]
