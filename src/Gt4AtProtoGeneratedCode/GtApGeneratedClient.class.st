Class {
	#name : #GtApGeneratedClient,
	#superclass : #GtApClient,
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyActorGetProfileactor: actor [ 
	<xrpcQuery>
	^ AppBskyActorDefsProfileViewDetailed fromRequest:  (self queryOn: 'app.bsky.actor.getProfile' parameters: {'actor' -> actor} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyActorGetProfilesactors: actors [ 
	<xrpcQuery>
	^  (self queryOn: 'app.bsky.actor.getProfiles' parameters: {'actors' -> actors} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyActorGetSuggestions [
	<xrpcQuery>
	^ AsyncMapStream mapBlock: [:aDictionary | AppBskyActorDefsProfileView fromRequest:  aDictionary ] stream:  (self queryOn: 'app.bsky.actor.getSuggestions' parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyActorSearchActorsTypeaheadterm: term [ 
	<xrpcQuery>
	^  (self queryOn: 'app.bsky.actor.searchActorsTypeahead' parameters: {'term' -> term} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyActorSearchActorsterm: term [ 
	<xrpcQuery>
	^ AsyncMapStream mapBlock: [:aDictionary | AppBskyActorDefsProfileView fromRequest:  aDictionary ] stream:  (self queryOn: 'app.bsky.actor.searchActors' parameters: {'term' -> term} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetAuthorFeedactor: actor [ 
	<xrpcQuery>
	^ AsyncMapStream mapBlock: [:aDictionary | AppBskyFeedDefsFeedViewPost fromRequest:  aDictionary ] stream:  (self queryOn: 'app.bsky.feed.getAuthorFeed' parameters: {'actor' -> actor} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetLikesuri: uri cid: cid [ 
	<xrpcQuery>
	^  (self queryOn: 'app.bsky.feed.getLikes' parameters: {'uri' -> uri. 'cid' -> cid} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetPostThreaduri: uri depth: depth [ 
	<xrpcQuery>
	^  (self queryOn: 'app.bsky.feed.getPostThread' parameters: {'uri' -> uri. 'depth' -> depth} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetPostsuris: uris [ 
	<xrpcQuery>
	^  (self queryOn: 'app.bsky.feed.getPosts' parameters: {'uris' -> uris} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetRepostedByuri: uri cid: cid [ 
	<xrpcQuery>
	^  (self queryOn: 'app.bsky.feed.getRepostedBy' parameters: {'uri' -> uri. 'cid' -> cid} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetTimelinealgorithm: algorithm [ 
	<xrpcQuery>
	^ AsyncMapStream mapBlock: [:aDictionary | AppBskyFeedDefsFeedViewPost fromRequest:  aDictionary ] stream:  (self queryOn: 'app.bsky.feed.getTimeline' parameters: {'algorithm' -> algorithm} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphGetBlocks [
	<xrpcQuery>
	^ AsyncMapStream mapBlock: [:aDictionary | AppBskyActorDefsProfileView fromRequest:  aDictionary ] stream:  (self queryOn: 'app.bsky.graph.getBlocks' parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphGetFollowersactor: actor [ 
	<xrpcQuery>
	^  (self queryOn: 'app.bsky.graph.getFollowers' parameters: {'actor' -> actor} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphGetFollowsactor: actor [ 
	<xrpcQuery>
	^  (self queryOn: 'app.bsky.graph.getFollows' parameters: {'actor' -> actor} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphGetMutes [
	<xrpcQuery>
	^ AsyncMapStream mapBlock: [:aDictionary | AppBskyActorDefsProfileView fromRequest:  aDictionary ] stream:  (self queryOn: 'app.bsky.graph.getMutes' parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphMuteActoractor: actor [ 
	<xrpcProcedure>
	^  (self procedureOn: 'app.bsky.graph.muteActor' withBody: {'actor' -> actor} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphUnmuteActoractor: actor [ 
	<xrpcProcedure>
	^  (self procedureOn: 'app.bsky.graph.unmuteActor' withBody: {'actor' -> actor} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyNotificationGetUnreadCountseenAt: seenAt [ 
	<xrpcQuery>
	^  (self queryOn: 'app.bsky.notification.getUnreadCount' parameters: {'seenAt' -> seenAt} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyNotificationListNotificationsseenAt: seenAt [ 
	<xrpcQuery>
	^ AsyncMapStream mapBlock: [:aDictionary | AppBskyNotificationListNotificationsNotification fromRequest:  aDictionary ] stream:  (self queryOn: 'app.bsky.notification.listNotifications' parameters: {'seenAt' -> seenAt} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyNotificationUpdateSeenseenAt: seenAt [ 
	<xrpcProcedure>
	^  (self procedureOn: 'app.bsky.notification.updateSeen' withBody: {'seenAt' -> seenAt} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyUnspeccedGetPopularincludeNsfw: includeNsfw [ 
	<xrpcQuery>
	^ AsyncMapStream mapBlock: [:aDictionary | AppBskyFeedDefsFeedViewPost fromRequest:  aDictionary ] stream:  (self queryOn: 'app.bsky.unspecced.getPopular' parameters: {'includeNsfw' -> includeNsfw} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminDisableAccountInvitesaccount: account [ 
	<xrpcProcedure>
	^  (self procedureOn: 'com.atproto.admin.disableAccountInvites' withBody: {'account' -> account} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminDisableInviteCodescodes: codes accounts: accounts [ 
	<xrpcProcedure>
	^  (self procedureOn: 'com.atproto.admin.disableInviteCodes' withBody: {'codes' -> codes. 'accounts' -> accounts} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminEnableAccountInvitesaccount: account [ 
	<xrpcProcedure>
	^  (self procedureOn: 'com.atproto.admin.enableAccountInvites' withBody: {'account' -> account} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminGetInviteCodessort: sort [ 
	<xrpcQuery>
	^ AsyncMapStream mapBlock: [:aDictionary | ComAtprotoServerDefsInviteCode fromRequest:  aDictionary ] stream:  (self queryOn: 'com.atproto.admin.getInviteCodes' parameters: {'sort' -> sort} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminGetModerationActionid: id [ 
	<xrpcQuery>
	^ ComAtprotoAdminDefsActionViewDetail fromRequest:  (self queryOn: 'com.atproto.admin.getModerationAction' parameters: {'id' -> id} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminGetModerationActionssubject: subject [ 
	<xrpcQuery>
	^ AsyncMapStream mapBlock: [:aDictionary | ComAtprotoAdminDefsActionView fromRequest:  aDictionary ] stream:  (self queryOn: 'com.atproto.admin.getModerationActions' parameters: {'subject' -> subject} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminGetModerationReportid: id [ 
	<xrpcQuery>
	^ ComAtprotoAdminDefsReportViewDetail fromRequest:  (self queryOn: 'com.atproto.admin.getModerationReport' parameters: {'id' -> id} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminGetModerationReportssubject: subject resolved: resolved [ 
	<xrpcQuery>
	^ AsyncMapStream mapBlock: [:aDictionary | ComAtprotoAdminDefsReportView fromRequest:  aDictionary ] stream:  (self queryOn: 'com.atproto.admin.getModerationReports' parameters: {'subject' -> subject. 'resolved' -> resolved} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminGetRecorduri: uri cid: cid [ 
	<xrpcQuery>
	^ ComAtprotoAdminDefsRecordViewDetail fromRequest:  (self queryOn: 'com.atproto.admin.getRecord' parameters: {'uri' -> uri. 'cid' -> cid} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminGetRepodid: did [ 
	<xrpcQuery>
	^ ComAtprotoAdminDefsRepoViewDetail fromRequest:  (self queryOn: 'com.atproto.admin.getRepo' parameters: {'did' -> did} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminResolveModerationReportsactionId: actionId reportIds: reportIds createdBy: createdBy [ 
	<xrpcProcedure>
	^ ComAtprotoAdminDefsActionView fromRequest:  (self procedureOn: 'com.atproto.admin.resolveModerationReports' withBody: {'actionId' -> actionId. 'reportIds' -> reportIds. 'createdBy' -> createdBy} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminReverseModerationActionid: id reason: reason createdBy: createdBy [ 
	<xrpcProcedure>
	^ ComAtprotoAdminDefsActionView fromRequest:  (self procedureOn: 'com.atproto.admin.reverseModerationAction' withBody: {'id' -> id. 'reason' -> reason. 'createdBy' -> createdBy} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminSearchReposterm: term invitedBy: invitedBy [ 
	<xrpcQuery>
	^ AsyncMapStream mapBlock: [:aDictionary | ComAtprotoAdminDefsRepoView fromRequest:  aDictionary ] stream:  (self queryOn: 'com.atproto.admin.searchRepos' parameters: {'term' -> term. 'invitedBy' -> invitedBy} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminTakeModerationActionaction: action subject: subject subjectBlobCids: subjectBlobCids createLabelVals: createLabelVals negateLabelVals: negateLabelVals reason: reason createdBy: createdBy [ 
	<xrpcProcedure>
	^ ComAtprotoAdminDefsActionView fromRequest:  (self procedureOn: 'com.atproto.admin.takeModerationAction' withBody: {'action' -> action. 'subject' -> subject. 'subjectBlobCids' -> subjectBlobCids. 'createLabelVals' -> createLabelVals. 'negateLabelVals' -> negateLabelVals. 'reason' -> reason. 'createdBy' -> createdBy} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminUpdateAccountEmailaccount: account email: email [ 
	<xrpcProcedure>
	^  (self procedureOn: 'com.atproto.admin.updateAccountEmail' withBody: {'account' -> account. 'email' -> email} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminUpdateAccountHandledid: did handle: handle [ 
	<xrpcProcedure>
	^  (self procedureOn: 'com.atproto.admin.updateAccountHandle' withBody: {'did' -> did. 'handle' -> handle} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoIdentityResolveHandlehandle: handle [ 
	<xrpcQuery>
	^  (self queryOn: 'com.atproto.identity.resolveHandle' parameters: {'handle' -> handle} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoIdentityUpdateHandlehandle: handle [ 
	<xrpcProcedure>
	^  (self procedureOn: 'com.atproto.identity.updateHandle' withBody: {'handle' -> handle} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoLabelQueryLabelsuriPatterns: uriPatterns sources: sources [ 
	<xrpcQuery>
	^ AsyncMapStream mapBlock: [:aDictionary | ComAtprotoLabelDefsLabel fromRequest:  aDictionary ] stream:  (self queryOn: 'com.atproto.label.queryLabels' parameters: {'uriPatterns' -> uriPatterns. 'sources' -> sources} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoModerationCreateReportreasonType: reasonType reason: reason subject: subject [ 
	<xrpcProcedure>
	^  (self procedureOn: 'com.atproto.moderation.createReport' withBody: {'reasonType' -> reasonType. 'reason' -> reason. 'subject' -> subject} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoApplyWritesrepo: repo validate: validate writes: writes swapCommit: swapCommit [ 
	<xrpcProcedure>
	^  (self procedureOn: 'com.atproto.repo.applyWrites' withBody: {'repo' -> repo. 'validate' -> validate. 'writes' -> writes. 'swapCommit' -> swapCommit} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoCreateRecordrepo: repo collection: collection rkey: rkey validate: validate record: record swapCommit: swapCommit [ 
	<xrpcProcedure>
	^  (self procedureOn: 'com.atproto.repo.createRecord' withBody: {'repo' -> repo. 'collection' -> collection. 'rkey' -> rkey. 'validate' -> validate. 'record' -> record. 'swapCommit' -> swapCommit} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoDeleteRecordrepo: repo collection: collection rkey: rkey swapRecord: swapRecord swapCommit: swapCommit [ 
	<xrpcProcedure>
	^  (self procedureOn: 'com.atproto.repo.deleteRecord' withBody: {'repo' -> repo. 'collection' -> collection. 'rkey' -> rkey. 'swapRecord' -> swapRecord. 'swapCommit' -> swapCommit} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoDescribeReporepo: repo [ 
	<xrpcQuery>
	^  (self queryOn: 'com.atproto.repo.describeRepo' parameters: {'repo' -> repo} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoGetRecordrepo: repo collection: collection rkey: rkey cid: cid [ 
	<xrpcQuery>
	^  (self queryOn: 'com.atproto.repo.getRecord' parameters: {'repo' -> repo. 'collection' -> collection. 'rkey' -> rkey. 'cid' -> cid} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoListRecordsrepo: repo collection: collection rkeyStart: rkeyStart rkeyEnd: rkeyEnd reverse: reverse [ 
	<xrpcQuery>
	^ AsyncMapStream mapBlock: [:aDictionary | ComAtprotoRepoListRecordsRecord fromRequest:  aDictionary ] stream:  (self queryOn: 'com.atproto.repo.listRecords' parameters: {'repo' -> repo. 'collection' -> collection. 'rkeyStart' -> rkeyStart. 'rkeyEnd' -> rkeyEnd. 'reverse' -> reverse} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoPutRecordrepo: repo collection: collection rkey: rkey validate: validate record: record swapRecord: swapRecord swapCommit: swapCommit [ 
	<xrpcProcedure>
	^  (self procedureOn: 'com.atproto.repo.putRecord' withBody: {'repo' -> repo. 'collection' -> collection. 'rkey' -> rkey. 'validate' -> validate. 'record' -> record. 'swapRecord' -> swapRecord. 'swapCommit' -> swapCommit} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoRebaseReporepo: repo swapCommit: swapCommit [ 
	<xrpcProcedure>
	^  (self procedureOn: 'com.atproto.repo.rebaseRepo' withBody: {'repo' -> repo. 'swapCommit' -> swapCommit} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoUploadBlob [
	<xrpcProcedure>
	^  (self procedureOn: 'com.atproto.repo.uploadBlob' withBody: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerCreateAccountemail: email handle: handle inviteCode: inviteCode password: password recoveryKey: recoveryKey [ 
	<xrpcProcedure>
	^  (self procedureOn: 'com.atproto.server.createAccount' withBody: {'email' -> email. 'handle' -> handle. 'inviteCode' -> inviteCode. 'password' -> password. 'recoveryKey' -> recoveryKey} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerCreateAppPasswordname: name [ 
	<xrpcProcedure>
	^ ComAtprotoServerCreateAppPasswordAppPassword fromRequest:  (self procedureOn: 'com.atproto.server.createAppPassword' withBody: {'name' -> name} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerCreateInviteCodescodeCount: codeCount useCount: useCount forAccounts: forAccounts [ 
	<xrpcProcedure>
	^  (self procedureOn: 'com.atproto.server.createInviteCodes' withBody: {'codeCount' -> codeCount. 'useCount' -> useCount. 'forAccounts' -> forAccounts} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerCreateInviteCodeuseCount: useCount forAccount: forAccount [ 
	<xrpcProcedure>
	^  (self procedureOn: 'com.atproto.server.createInviteCode' withBody: {'useCount' -> useCount. 'forAccount' -> forAccount} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerCreateSessionidentifier: identifier password: password [ 
	<xrpcProcedure>
	^  (self procedureOn: 'com.atproto.server.createSession' withBody: {'identifier' -> identifier. 'password' -> password} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerDeleteAccountdid: did password: password token: token [ 
	<xrpcProcedure>
	^  (self procedureOn: 'com.atproto.server.deleteAccount' withBody: {'did' -> did. 'password' -> password. 'token' -> token} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerDeleteSession [
	<xrpcProcedure>
	^  (self procedureOn: 'com.atproto.server.deleteSession' withBody: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerDescribeServer [
	<xrpcQuery>
	^  (self queryOn: 'com.atproto.server.describeServer' parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerGetAccountInviteCodesincludeUsed: includeUsed createAvailable: createAvailable [ 
	<xrpcQuery>
	^  (self queryOn: 'com.atproto.server.getAccountInviteCodes' parameters: {'includeUsed' -> includeUsed. 'createAvailable' -> createAvailable} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerGetSession [
	<xrpcQuery>
	^  (self queryOn: 'com.atproto.server.getSession' parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerListAppPasswords [
	<xrpcQuery>
	^  (self queryOn: 'com.atproto.server.listAppPasswords' parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerRefreshSession [
	<xrpcProcedure>
	^  (self procedureOn: 'com.atproto.server.refreshSession' withBody: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerRequestAccountDelete [
	<xrpcProcedure>
	^  (self procedureOn: 'com.atproto.server.requestAccountDelete' withBody: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerRequestPasswordResetemail: email [ 
	<xrpcProcedure>
	^  (self procedureOn: 'com.atproto.server.requestPasswordReset' withBody: {'email' -> email} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerResetPasswordtoken: token password: password [ 
	<xrpcProcedure>
	^  (self procedureOn: 'com.atproto.server.resetPassword' withBody: {'token' -> token. 'password' -> password} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerRevokeAppPasswordname: name [ 
	<xrpcProcedure>
	^  (self procedureOn: 'com.atproto.server.revokeAppPassword' withBody: {'name' -> name} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncGetBlobdid: did cid: cid [ 
	<xrpcQuery>
	^  (self queryOn: 'com.atproto.sync.getBlob' parameters: {'did' -> did. 'cid' -> cid} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncGetBlocksdid: did cids: cids [ 
	<xrpcQuery>
	^  (self queryOn: 'com.atproto.sync.getBlocks' parameters: {'did' -> did. 'cids' -> cids} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncGetCheckoutdid: did commit: commit [ 
	<xrpcQuery>
	^  (self queryOn: 'com.atproto.sync.getCheckout' parameters: {'did' -> did. 'commit' -> commit} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncGetCommitPathdid: did latest: latest earliest: earliest [ 
	<xrpcQuery>
	^  (self queryOn: 'com.atproto.sync.getCommitPath' parameters: {'did' -> did. 'latest' -> latest. 'earliest' -> earliest} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncGetHeaddid: did [ 
	<xrpcQuery>
	^  (self queryOn: 'com.atproto.sync.getHead' parameters: {'did' -> did} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncGetRecorddid: did collection: collection rkey: rkey commit: commit [ 
	<xrpcQuery>
	^  (self queryOn: 'com.atproto.sync.getRecord' parameters: {'did' -> did. 'collection' -> collection. 'rkey' -> rkey. 'commit' -> commit} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncGetRepodid: did earliest: earliest latest: latest [ 
	<xrpcQuery>
	^  (self queryOn: 'com.atproto.sync.getRepo' parameters: {'did' -> did. 'earliest' -> earliest. 'latest' -> latest} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncListBlobsdid: did latest: latest earliest: earliest [ 
	<xrpcQuery>
	^  (self queryOn: 'com.atproto.sync.listBlobs' parameters: {'did' -> did. 'latest' -> latest. 'earliest' -> earliest} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncListRepos [
	<xrpcQuery>
	^ AsyncMapStream mapBlock: [:aDictionary | ComAtprotoSyncListReposRepo fromRequest:  aDictionary ] stream:  (self queryOn: 'com.atproto.sync.listRepos' parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncNotifyOfUpdatehostname: hostname [ 
	<xrpcQuery>
	^  (self queryOn: 'com.atproto.sync.notifyOfUpdate' parameters: {'hostname' -> hostname} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncRequestCrawlhostname: hostname [ 
	<xrpcQuery>
	^  (self queryOn: 'com.atproto.sync.requestCrawl' parameters: {'hostname' -> hostname} asDictionary)
]
