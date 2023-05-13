Class {
	#name : #GtApGeneratedClient,
	#superclass : #GtApClient,
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyActorGetPreferences [
	<xrpcQuery>
	"Get private preferences attached to the account."
	^ GtApRequestResolver from: {'preferences' -> [:aValue | aValue]} asDictionary andRequest:  (self queryOn: 'app.bsky.actor.getPreferences' parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyActorGetProfileactor: actor [ 
	<xrpcQuery>
	""
	^ AppBskyActorDefsProfileViewDetailed fromRequest:  (self queryOn: 'app.bsky.actor.getProfile' parameters: {'actor' -> actor} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyActorGetProfilesactors: actors [ 
	<xrpcQuery>
	""
	^ GtApRequestResolver from: {'profiles' -> [:aValue | aValue]} asDictionary andRequest:  (self queryOn: 'app.bsky.actor.getProfiles' parameters: {'actors' -> actors} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyActorGetSuggestions [
	<xrpcQuery>
	"Get a list of actors suggested for following. Used in discovery UIs."
	^ AsyncMapStream mapBlock: [:aDictionary | AppBskyActorDefsProfileView fromRequest:  aDictionary ] stream:  (self queryOn: 'app.bsky.actor.getSuggestions' parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyActorPutPreferencespreferences: preferences [ 
	<xrpcProcedure>
	"Sets the private preferences attached to the account."
	^ GtApRequestResolver from: {} asDictionary andRequest:  (self procedureOn: 'app.bsky.actor.putPreferences' withBody: {'preferences' -> preferences} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyActorSearchActorsTypeaheadterm: term [ 
	<xrpcQuery>
	"Find actor suggestions for a search term."
	^ GtApRequestResolver from: {'actors' -> [:aValue | aValue]} asDictionary andRequest:  (self queryOn: 'app.bsky.actor.searchActorsTypeahead' parameters: {'term' -> term} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyActorSearchActorsterm: term [ 
	<xrpcQuery>
	"Find actors matching search criteria."
	^ AsyncMapStream mapBlock: [:aDictionary | AppBskyActorDefsProfileView fromRequest:  aDictionary ] stream:  (self queryOn: 'app.bsky.actor.searchActors' parameters: {'term' -> term} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetAuthorFeedactor: actor [ 
	<xrpcQuery>
	"A view of an actor's feed."
	^ AsyncMapStream mapBlock: [:aDictionary | AppBskyFeedDefsFeedViewPost fromRequest:  aDictionary ] stream:  (self queryOn: 'app.bsky.feed.getAuthorFeed' parameters: {'actor' -> actor} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetLikesuri: uri cid: cid [ 
	<xrpcQuery>
	""
	^ GtApRequestResolver from: {'likes' -> (GtApRequestStreamResolver new block: [:aDictionary | AppBskyFeedGetLikesLike fromRequest:  aDictionary ]). 'uri' -> [:aValue | aValue]. 'cid' -> [:aValue | aValue]. 'cursor' -> [:aValue | aValue]} asDictionary andRequest:  (self queryOn: 'app.bsky.feed.getLikes' parameters: {'uri' -> uri. 'cid' -> cid} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetPostThreaduri: uri depth: depth [ 
	<xrpcQuery>
	""
	^ GtApRequestResolver from: {'thread' -> [:aValue |GtApModelEntity findForRequest:  aValue]} asDictionary andRequest:  (self queryOn: 'app.bsky.feed.getPostThread' parameters: {'uri' -> uri. 'depth' -> depth} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetPostsuris: uris [ 
	<xrpcQuery>
	"A view of an actor's feed."
	^ GtApRequestResolver from: {'posts' -> [:aValue | aValue]} asDictionary andRequest:  (self queryOn: 'app.bsky.feed.getPosts' parameters: {'uris' -> uris} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetRepostedByuri: uri cid: cid [ 
	<xrpcQuery>
	""
	^ GtApRequestResolver from: {'repostedBy' -> (GtApRequestStreamResolver new block: [:aDictionary | AppBskyActorDefsProfileView fromRequest:  aDictionary ]). 'uri' -> [:aValue | aValue]. 'cid' -> [:aValue | aValue]. 'cursor' -> [:aValue | aValue]} asDictionary andRequest:  (self queryOn: 'app.bsky.feed.getRepostedBy' parameters: {'uri' -> uri. 'cid' -> cid} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetTimelinealgorithm: algorithm [ 
	<xrpcQuery>
	"A view of the user's home timeline."
	^ AsyncMapStream mapBlock: [:aDictionary | AppBskyFeedDefsFeedViewPost fromRequest:  aDictionary ] stream:  (self queryOn: 'app.bsky.feed.getTimeline' parameters: {'algorithm' -> algorithm} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphGetBlocks [
	<xrpcQuery>
	"Who is the requester's account blocking?"
	^ AsyncMapStream mapBlock: [:aDictionary | AppBskyActorDefsProfileView fromRequest:  aDictionary ] stream:  (self queryOn: 'app.bsky.graph.getBlocks' parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphGetFollowersactor: actor [ 
	<xrpcQuery>
	"Who is following an actor?"
	^ GtApRequestResolver from: {'followers' -> (GtApRequestStreamResolver new block: [:aDictionary | AppBskyActorDefsProfileView fromRequest:  aDictionary ]). 'subject' -> [:aValue |AppBskyActorDefsProfileView fromRequest:  aValue]. 'cursor' -> [:aValue | aValue]} asDictionary andRequest:  (self queryOn: 'app.bsky.graph.getFollowers' parameters: {'actor' -> actor} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphGetFollowsactor: actor [ 
	<xrpcQuery>
	"Who is an actor following?"
	^ GtApRequestResolver from: {'follows' -> (GtApRequestStreamResolver new block: [:aDictionary | AppBskyActorDefsProfileView fromRequest:  aDictionary ]). 'subject' -> [:aValue |AppBskyActorDefsProfileView fromRequest:  aValue]. 'cursor' -> [:aValue | aValue]} asDictionary andRequest:  (self queryOn: 'app.bsky.graph.getFollows' parameters: {'actor' -> actor} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphGetListMutes [
	<xrpcQuery>
	"Which lists is the requester's account muting?"
	^ AsyncMapStream mapBlock: [:aDictionary | AppBskyGraphDefsListView fromRequest:  aDictionary ] stream:  (self queryOn: 'app.bsky.graph.getListMutes' parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphGetListlist: list [ 
	<xrpcQuery>
	"Fetch a list of actors"
	^ GtApRequestResolver from: {'items' -> (GtApRequestStreamResolver new block: [:aDictionary | AppBskyGraphDefsListItemView fromRequest:  aDictionary ]). 'cursor' -> [:aValue | aValue]. 'list' -> [:aValue |AppBskyGraphDefsListView fromRequest:  aValue]} asDictionary andRequest:  (self queryOn: 'app.bsky.graph.getList' parameters: {'list' -> list} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphGetListsactor: actor [ 
	<xrpcQuery>
	"Fetch a list of lists that belong to an actor"
	^ AsyncMapStream mapBlock: [:aDictionary | AppBskyGraphDefsListView fromRequest:  aDictionary ] stream:  (self queryOn: 'app.bsky.graph.getLists' parameters: {'actor' -> actor} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphGetMutes [
	<xrpcQuery>
	"Who does the viewer mute?"
	^ AsyncMapStream mapBlock: [:aDictionary | AppBskyActorDefsProfileView fromRequest:  aDictionary ] stream:  (self queryOn: 'app.bsky.graph.getMutes' parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphMuteActorListlist: list [ 
	<xrpcProcedure>
	"Mute a list of actors."
	^ GtApRequestResolver from: {} asDictionary andRequest:  (self procedureOn: 'app.bsky.graph.muteActorList' withBody: {'list' -> list} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphMuteActoractor: actor [ 
	<xrpcProcedure>
	"Mute an actor by did or handle."
	^ GtApRequestResolver from: {} asDictionary andRequest:  (self procedureOn: 'app.bsky.graph.muteActor' withBody: {'actor' -> actor} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphUnmuteActorListlist: list [ 
	<xrpcProcedure>
	"Unmute a list of actors."
	^ GtApRequestResolver from: {} asDictionary andRequest:  (self procedureOn: 'app.bsky.graph.unmuteActorList' withBody: {'list' -> list} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphUnmuteActoractor: actor [ 
	<xrpcProcedure>
	"Unmute an actor by did or handle."
	^ GtApRequestResolver from: {} asDictionary andRequest:  (self procedureOn: 'app.bsky.graph.unmuteActor' withBody: {'actor' -> actor} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyNotificationGetUnreadCountseenAt: seenAt [ 
	<xrpcQuery>
	""
	^ GtApRequestResolver from: {'count' -> [:aValue | aValue]} asDictionary andRequest:  (self queryOn: 'app.bsky.notification.getUnreadCount' parameters: {'seenAt' -> seenAt} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyNotificationListNotificationsseenAt: seenAt [ 
	<xrpcQuery>
	""
	^ AsyncMapStream mapBlock: [:aDictionary | AppBskyNotificationListNotificationsNotification fromRequest:  aDictionary ] stream:  (self queryOn: 'app.bsky.notification.listNotifications' parameters: {'seenAt' -> seenAt} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyNotificationUpdateSeenseenAt: seenAt [ 
	<xrpcProcedure>
	"Notify server that the user has seen notifications."
	^ GtApRequestResolver from: {} asDictionary andRequest:  (self procedureOn: 'app.bsky.notification.updateSeen' withBody: {'seenAt' -> seenAt} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyUnspeccedGetPopularincludeNsfw: includeNsfw [ 
	<xrpcQuery>
	"An unspecced view of globally popular items"
	^ AsyncMapStream mapBlock: [:aDictionary | AppBskyFeedDefsFeedViewPost fromRequest:  aDictionary ] stream:  (self queryOn: 'app.bsky.unspecced.getPopular' parameters: {'includeNsfw' -> includeNsfw} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminDisableAccountInvitesaccount: account [ 
	<xrpcProcedure>
	"Disable an account from receiving new invite codes, but does not invalidate existing codes"
	^ GtApRequestResolver from: {} asDictionary andRequest:  (self procedureOn: 'com.atproto.admin.disableAccountInvites' withBody: {'account' -> account} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminDisableInviteCodescodes: codes accounts: accounts [ 
	<xrpcProcedure>
	"Disable some set of codes and/or all codes associated with a set of users"
	^ GtApRequestResolver from: {} asDictionary andRequest:  (self procedureOn: 'com.atproto.admin.disableInviteCodes' withBody: {'codes' -> codes. 'accounts' -> accounts} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminEnableAccountInvitesaccount: account [ 
	<xrpcProcedure>
	"Re-enable an accounts ability to receive invite codes"
	^ GtApRequestResolver from: {} asDictionary andRequest:  (self procedureOn: 'com.atproto.admin.enableAccountInvites' withBody: {'account' -> account} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminGetInviteCodessort: sort [ 
	<xrpcQuery>
	"Admin view of invite codes"
	^ AsyncMapStream mapBlock: [:aDictionary | ComAtprotoServerDefsInviteCode fromRequest:  aDictionary ] stream:  (self queryOn: 'com.atproto.admin.getInviteCodes' parameters: {'sort' -> sort} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminGetModerationActionid: id [ 
	<xrpcQuery>
	"View details about a moderation action."
	^ ComAtprotoAdminDefsActionViewDetail fromRequest:  (self queryOn: 'com.atproto.admin.getModerationAction' parameters: {'id' -> id} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminGetModerationActionssubject: subject [ 
	<xrpcQuery>
	"List moderation actions related to a subject."
	^ AsyncMapStream mapBlock: [:aDictionary | ComAtprotoAdminDefsActionView fromRequest:  aDictionary ] stream:  (self queryOn: 'com.atproto.admin.getModerationActions' parameters: {'subject' -> subject} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminGetModerationReportid: id [ 
	<xrpcQuery>
	"View details about a moderation report."
	^ ComAtprotoAdminDefsReportViewDetail fromRequest:  (self queryOn: 'com.atproto.admin.getModerationReport' parameters: {'id' -> id} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminGetModerationReportssubject: subject resolved: resolved actionType: actionType [ 
	<xrpcQuery>
	"List moderation reports related to a subject."
	^ AsyncMapStream mapBlock: [:aDictionary | ComAtprotoAdminDefsReportView fromRequest:  aDictionary ] stream:  (self queryOn: 'com.atproto.admin.getModerationReports' parameters: {'subject' -> subject. 'resolved' -> resolved. 'actionType' -> actionType} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminGetRecorduri: uri cid: cid [ 
	<xrpcQuery>
	"View details about a record."
	^ ComAtprotoAdminDefsRecordViewDetail fromRequest:  (self queryOn: 'com.atproto.admin.getRecord' parameters: {'uri' -> uri. 'cid' -> cid} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminGetRepodid: did [ 
	<xrpcQuery>
	"View details about a repository."
	^ ComAtprotoAdminDefsRepoViewDetail fromRequest:  (self queryOn: 'com.atproto.admin.getRepo' parameters: {'did' -> did} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminResolveModerationReportsactionId: actionId reportIds: reportIds createdBy: createdBy [ 
	<xrpcProcedure>
	"Resolve moderation reports by an action."
	^ ComAtprotoAdminDefsActionView fromRequest:  (self procedureOn: 'com.atproto.admin.resolveModerationReports' withBody: {'actionId' -> actionId. 'reportIds' -> reportIds. 'createdBy' -> createdBy} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminReverseModerationActionid: id reason: reason createdBy: createdBy [ 
	<xrpcProcedure>
	"Reverse a moderation action."
	^ ComAtprotoAdminDefsActionView fromRequest:  (self procedureOn: 'com.atproto.admin.reverseModerationAction' withBody: {'id' -> id. 'reason' -> reason. 'createdBy' -> createdBy} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminSearchReposterm: term invitedBy: invitedBy [ 
	<xrpcQuery>
	"Find repositories based on a search term."
	^ AsyncMapStream mapBlock: [:aDictionary | ComAtprotoAdminDefsRepoView fromRequest:  aDictionary ] stream:  (self queryOn: 'com.atproto.admin.searchRepos' parameters: {'term' -> term. 'invitedBy' -> invitedBy} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminTakeModerationActionaction: action subject: subject subjectBlobCids: subjectBlobCids createLabelVals: createLabelVals negateLabelVals: negateLabelVals reason: reason createdBy: createdBy [ 
	<xrpcProcedure>
	"Take a moderation action on a repo."
	^ ComAtprotoAdminDefsActionView fromRequest:  (self procedureOn: 'com.atproto.admin.takeModerationAction' withBody: {'action' -> action. 'subject' -> subject. 'subjectBlobCids' -> subjectBlobCids. 'createLabelVals' -> createLabelVals. 'negateLabelVals' -> negateLabelVals. 'reason' -> reason. 'createdBy' -> createdBy} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminUpdateAccountEmailaccount: account email: email [ 
	<xrpcProcedure>
	"Administrative action to update an account's email"
	^ GtApRequestResolver from: {} asDictionary andRequest:  (self procedureOn: 'com.atproto.admin.updateAccountEmail' withBody: {'account' -> account. 'email' -> email} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminUpdateAccountHandledid: did handle: handle [ 
	<xrpcProcedure>
	"Administrative action to update an account's handle"
	^ GtApRequestResolver from: {} asDictionary andRequest:  (self procedureOn: 'com.atproto.admin.updateAccountHandle' withBody: {'did' -> did. 'handle' -> handle} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoIdentityResolveHandlehandle: handle [ 
	<xrpcQuery>
	"Provides the DID of a repo."
	^ GtApRequestResolver from: {'did' -> [:aValue | aValue]} asDictionary andRequest:  (self queryOn: 'com.atproto.identity.resolveHandle' parameters: {'handle' -> handle} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoIdentityUpdateHandlehandle: handle [ 
	<xrpcProcedure>
	"Updates the handle of the account"
	^ GtApRequestResolver from: {} asDictionary andRequest:  (self procedureOn: 'com.atproto.identity.updateHandle' withBody: {'handle' -> handle} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoLabelQueryLabelsuriPatterns: uriPatterns sources: sources [ 
	<xrpcQuery>
	"Find labels relevant to the provided URI patterns."
	^ AsyncMapStream mapBlock: [:aDictionary | ComAtprotoLabelDefsLabel fromRequest:  aDictionary ] stream:  (self queryOn: 'com.atproto.label.queryLabels' parameters: {'uriPatterns' -> uriPatterns. 'sources' -> sources} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoModerationCreateReportreasonType: reasonType reason: reason subject: subject [ 
	<xrpcProcedure>
	"Report a repo or a record."
	^ GtApRequestResolver from: {'id' -> [:aValue | aValue]. 'reasonType' -> [:aValue | aValue]. 'reason' -> [:aValue | aValue]. 'subject' -> [:aValue |GtApModelEntity findForRequest:  aValue]. 'reportedBy' -> [:aValue | aValue]. 'createdAt' -> [:aValue | aValue]} asDictionary andRequest:  (self procedureOn: 'com.atproto.moderation.createReport' withBody: {'reasonType' -> reasonType. 'reason' -> reason. 'subject' -> subject} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoApplyWritesrepo: repo validate: validate writes: writes swapCommit: swapCommit [ 
	<xrpcProcedure>
	"Apply a batch transaction of creates, updates, and deletes."
	^ GtApRequestResolver from: {} asDictionary andRequest:  (self procedureOn: 'com.atproto.repo.applyWrites' withBody: {'repo' -> repo. 'validate' -> validate. 'writes' -> writes. 'swapCommit' -> swapCommit} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoCreateRecordrepo: repo collection: collection rkey: rkey validate: validate record: record swapCommit: swapCommit [ 
	<xrpcProcedure>
	"Create a new record."
	^ GtApRequestResolver from: {'uri' -> [:aValue | aValue]. 'cid' -> [:aValue | aValue]} asDictionary andRequest:  (self procedureOn: 'com.atproto.repo.createRecord' withBody: {'repo' -> repo. 'collection' -> collection. 'rkey' -> rkey. 'validate' -> validate. 'record' -> record. 'swapCommit' -> swapCommit} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoDeleteRecordrepo: repo collection: collection rkey: rkey swapRecord: swapRecord swapCommit: swapCommit [ 
	<xrpcProcedure>
	"Delete a record, or ensure it doesn't exist."
	^ GtApRequestResolver from: {} asDictionary andRequest:  (self procedureOn: 'com.atproto.repo.deleteRecord' withBody: {'repo' -> repo. 'collection' -> collection. 'rkey' -> rkey. 'swapRecord' -> swapRecord. 'swapCommit' -> swapCommit} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoDescribeReporepo: repo [ 
	<xrpcQuery>
	"Get information about the repo, including the list of collections."
	^ GtApRequestResolver from: {'handle' -> [:aValue | aValue]. 'did' -> [:aValue | aValue]. 'didDoc' -> [:aValue |GtApModelEntity findForRequest:  aValue]. 'collections' -> [:aValue | aValue]. 'handleIsCorrect' -> [:aValue | aValue]} asDictionary andRequest:  (self queryOn: 'com.atproto.repo.describeRepo' parameters: {'repo' -> repo} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoGetRecordrepo: repo collection: collection rkey: rkey cid: cid [ 
	<xrpcQuery>
	"Get a record."
	^ GtApRequestResolver from: {'uri' -> [:aValue | aValue]. 'cid' -> [:aValue | aValue]. 'value' -> [:aValue |GtApModelEntity findForRequest:  aValue]} asDictionary andRequest:  (self queryOn: 'com.atproto.repo.getRecord' parameters: {'repo' -> repo. 'collection' -> collection. 'rkey' -> rkey. 'cid' -> cid} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoListRecordsrepo: repo collection: collection rkeyStart: rkeyStart rkeyEnd: rkeyEnd reverse: reverse [ 
	<xrpcQuery>
	"List a range of records in a collection."
	^ AsyncMapStream mapBlock: [:aDictionary | ComAtprotoRepoListRecordsRecord fromRequest:  aDictionary ] stream:  (self queryOn: 'com.atproto.repo.listRecords' parameters: {'repo' -> repo. 'collection' -> collection. 'rkeyStart' -> rkeyStart. 'rkeyEnd' -> rkeyEnd. 'reverse' -> reverse} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoPutRecordrepo: repo collection: collection rkey: rkey validate: validate record: record swapRecord: swapRecord swapCommit: swapCommit [ 
	<xrpcProcedure>
	"Write a record, creating or updating it as needed."
	^ GtApRequestResolver from: {'uri' -> [:aValue | aValue]. 'cid' -> [:aValue | aValue]} asDictionary andRequest:  (self procedureOn: 'com.atproto.repo.putRecord' withBody: {'repo' -> repo. 'collection' -> collection. 'rkey' -> rkey. 'validate' -> validate. 'record' -> record. 'swapRecord' -> swapRecord. 'swapCommit' -> swapCommit} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoRebaseReporepo: repo swapCommit: swapCommit [ 
	<xrpcProcedure>
	"Simple rebase of repo that deletes history"
	^ GtApRequestResolver from: {} asDictionary andRequest:  (self procedureOn: 'com.atproto.repo.rebaseRepo' withBody: {'repo' -> repo. 'swapCommit' -> swapCommit} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoUploadBlob [
	<xrpcProcedure>
	"Upload a new blob to be added to repo in a later request."
	^ GtApRequestResolver from: {'blob' -> [:aValue | aValue]} asDictionary andRequest:  (self procedureOn: 'com.atproto.repo.uploadBlob' withBody: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerCreateAccountemail: email handle: handle did: did inviteCode: inviteCode password: password recoveryKey: recoveryKey [ 
	<xrpcProcedure>
	"Create an account."
	^ GtApRequestResolver from: {'accessJwt' -> [:aValue | aValue]. 'refreshJwt' -> [:aValue | aValue]. 'handle' -> [:aValue | aValue]. 'did' -> [:aValue | aValue]} asDictionary andRequest:  (self procedureOn: 'com.atproto.server.createAccount' withBody: {'email' -> email. 'handle' -> handle. 'did' -> did. 'inviteCode' -> inviteCode. 'password' -> password. 'recoveryKey' -> recoveryKey} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerCreateAppPasswordname: name [ 
	<xrpcProcedure>
	"Create an app-specific password."
	^ ComAtprotoServerCreateAppPasswordAppPassword fromRequest:  (self procedureOn: 'com.atproto.server.createAppPassword' withBody: {'name' -> name} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerCreateInviteCodescodeCount: codeCount useCount: useCount forAccounts: forAccounts [ 
	<xrpcProcedure>
	"Create an invite code."
	^ GtApRequestResolver from: {'codes' -> [:aValue | aValue]} asDictionary andRequest:  (self procedureOn: 'com.atproto.server.createInviteCodes' withBody: {'codeCount' -> codeCount. 'useCount' -> useCount. 'forAccounts' -> forAccounts} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerCreateInviteCodeuseCount: useCount forAccount: forAccount [ 
	<xrpcProcedure>
	"Create an invite code."
	^ GtApRequestResolver from: {'code' -> [:aValue | aValue]} asDictionary andRequest:  (self procedureOn: 'com.atproto.server.createInviteCode' withBody: {'useCount' -> useCount. 'forAccount' -> forAccount} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerCreateSessionidentifier: identifier password: password [ 
	<xrpcProcedure>
	"Create an authentication session."
	^ GtApRequestResolver from: {'accessJwt' -> [:aValue | aValue]. 'refreshJwt' -> [:aValue | aValue]. 'handle' -> [:aValue | aValue]. 'did' -> [:aValue | aValue]. 'email' -> [:aValue | aValue]} asDictionary andRequest:  (self procedureOn: 'com.atproto.server.createSession' withBody: {'identifier' -> identifier. 'password' -> password} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerDeleteAccountdid: did password: password token: token [ 
	<xrpcProcedure>
	"Delete a user account with a token and password."
	^ GtApRequestResolver from: {} asDictionary andRequest:  (self procedureOn: 'com.atproto.server.deleteAccount' withBody: {'did' -> did. 'password' -> password. 'token' -> token} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerDeleteSession [
	<xrpcProcedure>
	"Delete the current session."
	^ GtApRequestResolver from: {} asDictionary andRequest:  (self procedureOn: 'com.atproto.server.deleteSession' withBody: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerDescribeServer [
	<xrpcQuery>
	"Get a document describing the service's accounts configuration."
	^ GtApRequestResolver from: {'inviteCodeRequired' -> [:aValue | aValue]. 'availableUserDomains' -> [:aValue | aValue]. 'links' -> [:aValue |ComAtprotoServerDescribeServerLinks fromRequest:  aValue]} asDictionary andRequest:  (self queryOn: 'com.atproto.server.describeServer' parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerGetAccountInviteCodesincludeUsed: includeUsed createAvailable: createAvailable [ 
	<xrpcQuery>
	"Get all invite codes for a given account"
	^ GtApRequestResolver from: {'codes' -> [:aValue | aValue]} asDictionary andRequest:  (self queryOn: 'com.atproto.server.getAccountInviteCodes' parameters: {'includeUsed' -> includeUsed. 'createAvailable' -> createAvailable} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerGetSession [
	<xrpcQuery>
	"Get information about the current session."
	^ GtApRequestResolver from: {'handle' -> [:aValue | aValue]. 'did' -> [:aValue | aValue]. 'email' -> [:aValue | aValue]} asDictionary andRequest:  (self queryOn: 'com.atproto.server.getSession' parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerListAppPasswords [
	<xrpcQuery>
	"List all app-specific passwords."
	^ GtApRequestResolver from: {'passwords' -> [:aValue | aValue]} asDictionary andRequest:  (self queryOn: 'com.atproto.server.listAppPasswords' parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerRefreshSession [
	<xrpcProcedure>
	"Refresh an authentication session."
	^ GtApRequestResolver from: {'accessJwt' -> [:aValue | aValue]. 'refreshJwt' -> [:aValue | aValue]. 'handle' -> [:aValue | aValue]. 'did' -> [:aValue | aValue]} asDictionary andRequest:  (self procedureOn: 'com.atproto.server.refreshSession' withBody: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerRequestAccountDelete [
	<xrpcProcedure>
	"Initiate a user account deletion via email."
	^ GtApRequestResolver from: {} asDictionary andRequest:  (self procedureOn: 'com.atproto.server.requestAccountDelete' withBody: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerRequestPasswordResetemail: email [ 
	<xrpcProcedure>
	"Initiate a user account password reset via email."
	^ GtApRequestResolver from: {} asDictionary andRequest:  (self procedureOn: 'com.atproto.server.requestPasswordReset' withBody: {'email' -> email} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerResetPasswordtoken: token password: password [ 
	<xrpcProcedure>
	"Reset a user account password using a token."
	^ GtApRequestResolver from: {} asDictionary andRequest:  (self procedureOn: 'com.atproto.server.resetPassword' withBody: {'token' -> token. 'password' -> password} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerRevokeAppPasswordname: name [ 
	<xrpcProcedure>
	"Revoke an app-specific password by name."
	^ GtApRequestResolver from: {} asDictionary andRequest:  (self procedureOn: 'com.atproto.server.revokeAppPassword' withBody: {'name' -> name} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncGetBlobdid: did cid: cid [ 
	<xrpcQuery>
	"Get a blob associated with a given repo."
	^ GtApRequestResolver from: {} asDictionary andRequest:  (self queryOn: 'com.atproto.sync.getBlob' parameters: {'did' -> did. 'cid' -> cid} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncGetBlocksdid: did cids: cids [ 
	<xrpcQuery>
	"Gets blocks from a given repo."
	^ GtApRequestResolver from: {} asDictionary andRequest:  (self queryOn: 'com.atproto.sync.getBlocks' parameters: {'did' -> did. 'cids' -> cids} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncGetCheckoutdid: did commit: commit [ 
	<xrpcQuery>
	"Gets the repo state."
	^ GtApRequestResolver from: {} asDictionary andRequest:  (self queryOn: 'com.atproto.sync.getCheckout' parameters: {'did' -> did. 'commit' -> commit} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncGetCommitPathdid: did latest: latest earliest: earliest [ 
	<xrpcQuery>
	"Gets the path of repo commits"
	^ GtApRequestResolver from: {'commits' -> [:aValue | aValue]} asDictionary andRequest:  (self queryOn: 'com.atproto.sync.getCommitPath' parameters: {'did' -> did. 'latest' -> latest. 'earliest' -> earliest} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncGetHeaddid: did [ 
	<xrpcQuery>
	"Gets the current HEAD CID of a repo."
	^ GtApRequestResolver from: {'root' -> [:aValue | aValue]} asDictionary andRequest:  (self queryOn: 'com.atproto.sync.getHead' parameters: {'did' -> did} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncGetRecorddid: did collection: collection rkey: rkey commit: commit [ 
	<xrpcQuery>
	"Gets blocks needed for existence or non-existence of record."
	^ GtApRequestResolver from: {} asDictionary andRequest:  (self queryOn: 'com.atproto.sync.getRecord' parameters: {'did' -> did. 'collection' -> collection. 'rkey' -> rkey. 'commit' -> commit} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncGetRepodid: did earliest: earliest latest: latest [ 
	<xrpcQuery>
	"Gets the repo state."
	^ GtApRequestResolver from: {} asDictionary andRequest:  (self queryOn: 'com.atproto.sync.getRepo' parameters: {'did' -> did. 'earliest' -> earliest. 'latest' -> latest} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncListBlobsdid: did latest: latest earliest: earliest [ 
	<xrpcQuery>
	"List blob cids for some range of commits"
	^ GtApRequestResolver from: {'cids' -> [:aValue | aValue]} asDictionary andRequest:  (self queryOn: 'com.atproto.sync.listBlobs' parameters: {'did' -> did. 'latest' -> latest. 'earliest' -> earliest} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncListRepos [
	<xrpcQuery>
	"List dids and root cids of hosted repos"
	^ AsyncMapStream mapBlock: [:aDictionary | ComAtprotoSyncListReposRepo fromRequest:  aDictionary ] stream:  (self queryOn: 'com.atproto.sync.listRepos' parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncNotifyOfUpdatehostname: hostname [ 
	<xrpcQuery>
	"Notify a crawling service of a recent update. Often when a long break between updates causes the connection with the crawling service to break."
	^ GtApRequestResolver from: {} asDictionary andRequest:  (self queryOn: 'com.atproto.sync.notifyOfUpdate' parameters: {'hostname' -> hostname} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncRequestCrawlhostname: hostname [ 
	<xrpcQuery>
	"Request a service to persistently crawl hosted repos."
	^ GtApRequestResolver from: {} asDictionary andRequest:  (self queryOn: 'com.atproto.sync.requestCrawl' parameters: {'hostname' -> hostname} asDictionary)
]
