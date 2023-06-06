Extension { #name : #GtApGeneratedClient }

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyActorGetPreferences [
	"Get private preferences attached to the account."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'preferences' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self queryOn: 'app.bsky.actor.getPreferences' parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyActorGetProfileActor: actor [
	""

	<xrpcQuery>
	^ AppBskyActorDefsProfileViewDetailed
		fromRequest: (self
				queryOn: 'app.bsky.actor.getProfile'
				parameters: {'actor' -> actor} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyActorGetProfilesActors: actors [
	""

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'profiles' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'app.bsky.actor.getProfiles'
				parameters: {'actors' -> actors} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyActorGetSuggestions [
	"Get a list of actors suggested for following. Used in discovery UIs."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | AppBskyActorDefsProfileView fromRequest: aDictionary ]
		stream: (self queryOn: 'app.bsky.actor.getSuggestions' parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyActorPutPreferencesPreferences: preferences [
	"Sets the private preferences attached to the account."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'app.bsky.actor.putPreferences'
				withBody: {'preferences' -> preferences} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyActorSearchActorsTerm: term [
	"Find actors matching search criteria."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | AppBskyActorDefsProfileView fromRequest: aDictionary ]
		stream: (self
				queryOn: 'app.bsky.actor.searchActors'
				parameters: {'term' -> term} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyActorSearchActorsTypeaheadTerm: term [
	"Find actor suggestions for a search term."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'actors' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'app.bsky.actor.searchActorsTypeahead'
				parameters: {'term' -> term} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedDescribeFeedGenerator [
	"Returns information about a given feed generator including TOS & offered feed URIs"

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'did' -> [ :aValue | aValue ].
				'feeds' -> [ :aValue | aValue ].
				'links'
					-> [ :aValue | AppBskyFeedDescribeFeedGeneratorLinks fromRequest: aValue ]}
				asDictionary
		andRequest: (self
				queryOn: 'app.bsky.feed.describeFeedGenerator'
				parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetActorFeedsActor: actor [
	"Retrieve a list of feeds created by a given actor"

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | AppBskyFeedDefsGeneratorView fromRequest: aDictionary ]
		stream: (self
				queryOn: 'app.bsky.feed.getActorFeeds'
				parameters: {'actor' -> actor} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetAuthorFeedActor: actor [
	"A view of an actor's feed."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | AppBskyFeedDefsFeedViewPost fromRequest: aDictionary ]
		stream: (self
				queryOn: 'app.bsky.feed.getAuthorFeed'
				parameters: {'actor' -> actor} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetFeedFeed: feed [
	"Compose and hydrate a feed from a user's selected feed generator"

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | AppBskyFeedDefsFeedViewPost fromRequest: aDictionary ]
		stream: (self queryOn: 'app.bsky.feed.getFeed' parameters: {'feed' -> feed} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetFeedGeneratorFeed: feed [
	"Get information about a specific feed offered by a feed generator, such as its online status"

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'view' -> [ :aValue | AppBskyFeedDefsGeneratorView fromRequest: aValue ].
				'isOnline' -> [ :aValue | aValue ].
				'isValid' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'app.bsky.feed.getFeedGenerator'
				parameters: {'feed' -> feed} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetFeedGeneratorsFeeds: feeds [
	"Get information about a list of feed generators"

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'feeds' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'app.bsky.feed.getFeedGenerators'
				parameters: {'feeds' -> feeds} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetFeedSkeletonFeed: feed [
	"A skeleton of a feed provided by a feed generator"

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | AppBskyFeedDefsSkeletonFeedPost fromRequest: aDictionary ]
		stream: (self
				queryOn: 'app.bsky.feed.getFeedSkeleton'
				parameters: {'feed' -> feed} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetLikesUri: uri cid: cid [
	""

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'likes'
					-> (GtApRequestStreamResolver new
							block: [ :aDictionary | AppBskyFeedGetLikesLike fromRequest: aDictionary ]).
				'uri' -> [ :aValue | aValue ].
				'cid' -> [ :aValue | aValue ].
				'cursor' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'app.bsky.feed.getLikes'
				parameters: {'uri' -> uri.
						'cid' -> cid} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetPostThreadUri: uri depth: depth parentHeight: parentHeight [
	""

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'thread' -> [ :aValue | GtApModelEntity findForRequest: aValue ]} asDictionary
		andRequest: (self
				queryOn: 'app.bsky.feed.getPostThread'
				parameters: {'uri' -> uri.
						'depth' -> depth.
						'parentHeight' -> parentHeight} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetPostsUris: uris [
	"A view of an actor's feed."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'posts' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'app.bsky.feed.getPosts'
				parameters: {'uris' -> uris} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetRepostedByUri: uri cid: cid [
	""

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'repostedBy'
					-> (GtApRequestStreamResolver new
							block: [ :aDictionary | AppBskyActorDefsProfileView fromRequest: aDictionary ]).
				'uri' -> [ :aValue | aValue ].
				'cid' -> [ :aValue | aValue ].
				'cursor' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'app.bsky.feed.getRepostedBy'
				parameters: {'uri' -> uri.
						'cid' -> cid} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetTimelineAlgorithm: algorithm [
	"A view of the user's home timeline."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | AppBskyFeedDefsFeedViewPost fromRequest: aDictionary ]
		stream: (self
				queryOn: 'app.bsky.feed.getTimeline'
				parameters: {'algorithm' -> algorithm} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphGetBlocks [
	"Who is the requester's account blocking?"

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | AppBskyActorDefsProfileView fromRequest: aDictionary ]
		stream: (self queryOn: 'app.bsky.graph.getBlocks' parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphGetFollowersActor: actor [
	"Who is following an actor?"

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'followers'
					-> (GtApRequestStreamResolver new
							block: [ :aDictionary | AppBskyActorDefsProfileView fromRequest: aDictionary ]).
				'subject' -> [ :aValue | AppBskyActorDefsProfileView fromRequest: aValue ].
				'cursor' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'app.bsky.graph.getFollowers'
				parameters: {'actor' -> actor} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphGetFollowsActor: actor [
	"Who is an actor following?"

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'follows'
					-> (GtApRequestStreamResolver new
							block: [ :aDictionary | AppBskyActorDefsProfileView fromRequest: aDictionary ]).
				'subject' -> [ :aValue | AppBskyActorDefsProfileView fromRequest: aValue ].
				'cursor' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'app.bsky.graph.getFollows'
				parameters: {'actor' -> actor} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphGetListList: list [
	"Fetch a list of actors"

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'items'
					-> (GtApRequestStreamResolver new
							block: [ :aDictionary | AppBskyGraphDefsListItemView fromRequest: aDictionary ]).
				'cursor' -> [ :aValue | aValue ].
				'list' -> [ :aValue | AppBskyGraphDefsListView fromRequest: aValue ]}
				asDictionary
		andRequest: (self
				queryOn: 'app.bsky.graph.getList'
				parameters: {'list' -> list} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphGetListMutes [
	"Which lists is the requester's account muting?"

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | AppBskyGraphDefsListView fromRequest: aDictionary ]
		stream: (self queryOn: 'app.bsky.graph.getListMutes' parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphGetListsActor: actor [
	"Fetch a list of lists that belong to an actor"

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | AppBskyGraphDefsListView fromRequest: aDictionary ]
		stream: (self
				queryOn: 'app.bsky.graph.getLists'
				parameters: {'actor' -> actor} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphGetMutes [
	"Who does the viewer mute?"

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | AppBskyActorDefsProfileView fromRequest: aDictionary ]
		stream: (self queryOn: 'app.bsky.graph.getMutes' parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphMuteActorActor: actor [
	"Mute an actor by did or handle."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'app.bsky.graph.muteActor'
				withBody: {'actor' -> actor} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphMuteActorListList: list [
	"Mute a list of actors."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'app.bsky.graph.muteActorList'
				withBody: {'list' -> list} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphUnmuteActorActor: actor [
	"Unmute an actor by did or handle."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'app.bsky.graph.unmuteActor'
				withBody: {'actor' -> actor} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphUnmuteActorListList: list [
	"Unmute a list of actors."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'app.bsky.graph.unmuteActorList'
				withBody: {'list' -> list} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyNotificationGetUnreadCountSeenAt: seenAt [
	""

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'count' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'app.bsky.notification.getUnreadCount'
				parameters: {'seenAt' -> seenAt} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyNotificationListNotificationsseenAt: seenAt [
	""

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | AppBskyNotificationListNotificationsNotification fromRequest: aDictionary ]
		stream: (self
				queryOn: 'app.bsky.notification.listNotifications'
				parameters: {'seenAt' -> seenAt} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyNotificationUpdateSeenSeenAt: seenAt [
	"Notify server that the user has seen notifications."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'app.bsky.notification.updateSeen'
				withBody: {'seenAt' -> seenAt} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyUnspeccedGetPopularFeedGenerators [
	"An unspecced view of globally popular feed generators"

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'feeds' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'app.bsky.unspecced.getPopularFeedGenerators'
				parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyUnspeccedGetPopularIncludeNsfw: includeNsfw [
	"An unspecced view of globally popular items"

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | AppBskyFeedDefsFeedViewPost fromRequest: aDictionary ]
		stream: (self
				queryOn: 'app.bsky.unspecced.getPopular'
				parameters: {'includeNsfw' -> includeNsfw} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminDisableAccountInvitesAccount: account [
	"Disable an account from receiving new invite codes, but does not invalidate existing codes"

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.admin.disableAccountInvites'
				withBody: {'account' -> account} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminDisableInviteCodesCodes: codes accounts: accounts [
	"Disable some set of codes and/or all codes associated with a set of users"

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.admin.disableInviteCodes'
				withBody: {'codes' -> codes.
						'accounts' -> accounts} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminEnableAccountInvitesAccount: account [
	"Re-enable an accounts ability to receive invite codes"

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.admin.enableAccountInvites'
				withBody: {'account' -> account} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminGetInviteCodesSort: sort [
	"Admin view of invite codes"

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | ComAtprotoServerDefsInviteCode fromRequest: aDictionary ]
		stream: (self
				queryOn: 'com.atproto.admin.getInviteCodes'
				parameters: {'sort' -> sort} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminGetModerationActionId: id [
	"View details about a moderation action."

	<xrpcQuery>
	^ ComAtprotoAdminDefsActionViewDetail
		fromRequest: (self
				queryOn: 'com.atproto.admin.getModerationAction'
				parameters: {'id' -> id} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminGetModerationActionsSubject: subject [
	"List moderation actions related to a subject."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | ComAtprotoAdminDefsActionView fromRequest: aDictionary ]
		stream: (self
				queryOn: 'com.atproto.admin.getModerationActions'
				parameters: {'subject' -> subject} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminGetModerationReportId: id [
	"View details about a moderation report."

	<xrpcQuery>
	^ ComAtprotoAdminDefsReportViewDetail
		fromRequest: (self
				queryOn: 'com.atproto.admin.getModerationReport'
				parameters: {'id' -> id} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminGetModerationReportsSubject: subject ignoreSubjects: ignoreSubjects resolved: resolved actionType: actionType reverse: reverse [
	"List moderation reports related to a subject."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | ComAtprotoAdminDefsReportView fromRequest: aDictionary ]
		stream: (self
				queryOn: 'com.atproto.admin.getModerationReports'
				parameters: {'subject' -> subject.
						'ignoreSubjects' -> ignoreSubjects.
						'resolved' -> resolved.
						'actionType' -> actionType.
						'reverse' -> reverse} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminGetRecordUri: uri cid: cid [
	"View details about a record."

	<xrpcQuery>
	^ ComAtprotoAdminDefsRecordViewDetail
		fromRequest: (self
				queryOn: 'com.atproto.admin.getRecord'
				parameters: {'uri' -> uri.
						'cid' -> cid} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminGetRepoDid: did [
	"View details about a repository."

	<xrpcQuery>
	^ ComAtprotoAdminDefsRepoViewDetail
		fromRequest: (self
				queryOn: 'com.atproto.admin.getRepo'
				parameters: {'did' -> did} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminRebaseRepoRepo: repo swapCommit: swapCommit [
	"Administrative action to rebase an account's repo"

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.admin.rebaseRepo'
				withBody: {'repo' -> repo.
						'swapCommit' -> swapCommit} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminResolveModerationReportsActionId: actionId reportIds: reportIds createdBy: createdBy [
	"Resolve moderation reports by an action."

	<xrpcProcedure>
	^ ComAtprotoAdminDefsActionView
		fromRequest: (self
				procedureOn: 'com.atproto.admin.resolveModerationReports'
				withBody: {'actionId' -> actionId.
						'reportIds' -> reportIds.
						'createdBy' -> createdBy} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminReverseModerationActionId: id reason: reason createdBy: createdBy [
	"Reverse a moderation action."

	<xrpcProcedure>
	^ ComAtprotoAdminDefsActionView
		fromRequest: (self
				procedureOn: 'com.atproto.admin.reverseModerationAction'
				withBody: {'id' -> id.
						'reason' -> reason.
						'createdBy' -> createdBy} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminSearchReposTerm: term invitedBy: invitedBy [
	"Find repositories based on a search term."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | ComAtprotoAdminDefsRepoView fromRequest: aDictionary ]
		stream: (self
				queryOn: 'com.atproto.admin.searchRepos'
				parameters: {'term' -> term.
						'invitedBy' -> invitedBy} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminTakeModerationActionAction: action subject: subject subjectBlobCids: subjectBlobCids createLabelVals: createLabelVals negateLabelVals: negateLabelVals reason: reason createdBy: createdBy [
	"Take a moderation action on a repo."

	<xrpcProcedure>
	^ ComAtprotoAdminDefsActionView
		fromRequest: (self
				procedureOn: 'com.atproto.admin.takeModerationAction'
				withBody: {'action' -> action.
						'subject' -> subject.
						'subjectBlobCids' -> subjectBlobCids.
						'createLabelVals' -> createLabelVals.
						'negateLabelVals' -> negateLabelVals.
						'reason' -> reason.
						'createdBy' -> createdBy} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminUpdateAccountEmailAccount: account email: email [
	"Administrative action to update an account's email"

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.admin.updateAccountEmail'
				withBody: {'account' -> account.
						'email' -> email} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminUpdateAccountHandleDid: did handle: handle [
	"Administrative action to update an account's handle"

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.admin.updateAccountHandle'
				withBody: {'did' -> did.
						'handle' -> handle} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoIdentityResolveHandleHandle: handle [
	"Provides the DID of a repo."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'did' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'com.atproto.identity.resolveHandle'
				parameters: {'handle' -> handle} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoIdentityUpdateHandleHandle: handle [
	"Updates the handle of the account"

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.identity.updateHandle'
				withBody: {'handle' -> handle} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoLabelQueryLabelsUriPatterns: uriPatterns sources: sources [
	"Find labels relevant to the provided URI patterns."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | ComAtprotoLabelDefsLabel fromRequest: aDictionary ]
		stream: (self
				queryOn: 'com.atproto.label.queryLabels'
				parameters: {'uriPatterns' -> uriPatterns.
						'sources' -> sources} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoModerationCreateReportReasonType: reasonType reason: reason subject: subject [
	"Report a repo or a record."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {'id' -> [ :aValue | aValue ].
				'reasonType' -> [ :aValue | aValue ].
				'reason' -> [ :aValue | aValue ].
				'subject' -> [ :aValue | GtApModelEntity findForRequest: aValue ].
				'reportedBy' -> [ :aValue | aValue ].
				'createdAt' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.moderation.createReport'
				withBody: {'reasonType' -> reasonType.
						'reason' -> reason.
						'subject' -> subject} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoApplyWritesRepo: repo validate: validate writes: writes swapCommit: swapCommit [
	"Apply a batch transaction of creates, updates, and deletes."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.repo.applyWrites'
				withBody: {'repo' -> repo.
						'validate' -> validate.
						'writes' -> writes.
						'swapCommit' -> swapCommit} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoCreateRecordRepo: repo collection: collection rkey: rkey validate: validate record: record swapCommit: swapCommit [
	"Create a new record."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {'uri' -> [ :aValue | aValue ].
				'cid' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.repo.createRecord'
				withBody: {'repo' -> repo.
						'collection' -> collection.
						'rkey' -> rkey.
						'validate' -> validate.
						'record' -> record.
						'swapCommit' -> swapCommit} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoDeleteRecordRepo: repo collection: collection rkey: rkey swapRecord: swapRecord swapCommit: swapCommit [
	"Delete a record, or ensure it doesn't exist."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.repo.deleteRecord'
				withBody: {'repo' -> repo.
						'collection' -> collection.
						'rkey' -> rkey.
						'swapRecord' -> swapRecord.
						'swapCommit' -> swapCommit} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoDescribeRepoRepo: repo [
	"Get information about the repo, including the list of collections."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'handle' -> [ :aValue | aValue ].
				'did' -> [ :aValue | aValue ].
				'didDoc' -> [ :aValue | GtApModelEntity findForRequest: aValue ].
				'collections' -> [ :aValue | aValue ].
				'handleIsCorrect' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'com.atproto.repo.describeRepo'
				parameters: {'repo' -> repo} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoGetRecordRepo: repo collection: collection rkey: rkey cid: cid [
	"Get a record."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'uri' -> [ :aValue | aValue ].
				'cid' -> [ :aValue | aValue ].
				'value' -> [ :aValue | GtApModelEntity findForRequest: aValue ]}
				asDictionary
		andRequest: (self
				queryOn: 'com.atproto.repo.getRecord'
				parameters: {'repo' -> repo.
						'collection' -> collection.
						'rkey' -> rkey.
						'cid' -> cid} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoListRecordsRepo: repo collection: collection rkeyStart: rkeyStart rkeyEnd: rkeyEnd reverse: reverse [
	"List a range of records in a collection."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | ComAtprotoRepoListRecordsRecord fromRequest: aDictionary ]
		stream: (self
				queryOn: 'com.atproto.repo.listRecords'
				parameters: {'repo' -> repo.
						'collection' -> collection.
						'rkeyStart' -> rkeyStart.
						'rkeyEnd' -> rkeyEnd.
						'reverse' -> reverse} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoPutRecordRepo: repo collection: collection rkey: rkey validate: validate record: record swapRecord: swapRecord swapCommit: swapCommit [
	"Write a record, creating or updating it as needed."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {'uri' -> [ :aValue | aValue ].
				'cid' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.repo.putRecord'
				withBody: {'repo' -> repo.
						'collection' -> collection.
						'rkey' -> rkey.
						'validate' -> validate.
						'record' -> record.
						'swapRecord' -> swapRecord.
						'swapCommit' -> swapCommit} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoRebaseRepoRepo: repo swapCommit: swapCommit [
	"Simple rebase of repo that deletes history"

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.repo.rebaseRepo'
				withBody: {'repo' -> repo.
						'swapCommit' -> swapCommit} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoUploadBlobFile: aFile [
	"Upload a new blob to be added to repo in a later request."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {'blob' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self procedureOn: 'com.atproto.repo.uploadBlob' withFile: aFile)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerCreateAccountEmail: email handle: handle did: did inviteCode: inviteCode password: password recoveryKey: recoveryKey [
	"Create an account."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {'accessJwt' -> [ :aValue | aValue ].
				'refreshJwt' -> [ :aValue | aValue ].
				'handle' -> [ :aValue | aValue ].
				'did' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.server.createAccount'
				withBody: {'email' -> email.
						'handle' -> handle.
						'did' -> did.
						'inviteCode' -> inviteCode.
						'password' -> password.
						'recoveryKey' -> recoveryKey} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerCreateAppPasswordName: name [
	"Create an app-specific password."

	<xrpcProcedure>
	^ ComAtprotoServerCreateAppPasswordAppPassword
		fromRequest: (self
				procedureOn: 'com.atproto.server.createAppPassword'
				withBody: {'name' -> name} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerCreateInviteCodeUseCount: useCount forAccount: forAccount [
	"Create an invite code."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {'code' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.server.createInviteCode'
				withBody: {'useCount' -> useCount.
						'forAccount' -> forAccount} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerCreateInviteCodesCodeCount: codeCount useCount: useCount forAccounts: forAccounts [
	"Create an invite code."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {'codes' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.server.createInviteCodes'
				withBody: {'codeCount' -> codeCount.
						'useCount' -> useCount.
						'forAccounts' -> forAccounts} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerCreateSessionIdentifier: identifier password: password [
	"Create an authentication session."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {'accessJwt' -> [ :aValue | aValue ].
				'refreshJwt' -> [ :aValue | aValue ].
				'handle' -> [ :aValue | aValue ].
				'did' -> [ :aValue | aValue ].
				'email' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.server.createSession'
				withBody: {'identifier' -> identifier.
						'password' -> password} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerDeleteAccountDid: did password: password token: token [
	"Delete a user account with a token and password."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.server.deleteAccount'
				withBody: {'did' -> did.
						'password' -> password.
						'token' -> token} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerDeleteSession [
	"Delete the current session."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self procedureOn: 'com.atproto.server.deleteSession' withBody: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerDescribeServer [
	"Get a document describing the service's accounts configuration."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'inviteCodeRequired' -> [ :aValue | aValue ].
				'availableUserDomains' -> [ :aValue | aValue ].
				'links'
					-> [ :aValue | ComAtprotoServerDescribeServerLinks fromRequest: aValue ]}
				asDictionary
		andRequest: (self
				queryOn: 'com.atproto.server.describeServer'
				parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerGetAccountInviteCodesIncludeUsed: includeUsed createAvailable: createAvailable [
	"Get all invite codes for a given account"

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'codes' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'com.atproto.server.getAccountInviteCodes'
				parameters: {'includeUsed' -> includeUsed.
						'createAvailable' -> createAvailable} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerGetSession [
	"Get information about the current session."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'handle' -> [ :aValue | aValue ].
				'did' -> [ :aValue | aValue ].
				'email' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'com.atproto.server.getSession'
				parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerListAppPasswords [
	"List all app-specific passwords."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'passwords' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self queryOn: 'com.atproto.server.listAppPasswords' parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerRefreshSession [
	"Refresh an authentication session."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {'accessJwt' -> [ :aValue | aValue ].
				'refreshJwt' -> [ :aValue | aValue ].
				'handle' -> [ :aValue | aValue ].
				'did' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.server.refreshSession'
				withBody: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerRequestAccountDelete [
	"Initiate a user account deletion via email."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.server.requestAccountDelete'
				withBody: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerRequestPasswordResetEmail: email [
	"Initiate a user account password reset via email."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.server.requestPasswordReset'
				withBody: {'email' -> email} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerResetPasswordToken: token password: password [
	"Reset a user account password using a token."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.server.resetPassword'
				withBody: {'token' -> token.
						'password' -> password} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerRevokeAppPasswordName: name [
	"Revoke an app-specific password by name."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.server.revokeAppPassword'
				withBody: {'name' -> name} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncGetBlobDid: did cid: cid [
	"Get a blob associated with a given repo."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				queryOn: 'com.atproto.sync.getBlob'
				parameters: {'did' -> did.
						'cid' -> cid} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncGetBlocksDid: did cids: cids [
	"Gets blocks from a given repo."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				queryOn: 'com.atproto.sync.getBlocks'
				parameters: {'did' -> did.
						'cids' -> cids} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncGetCheckoutDid: did commit: commit [
	"Gets the repo state."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				queryOn: 'com.atproto.sync.getCheckout'
				parameters: {'did' -> did.
						'commit' -> commit} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncGetCommitPathDid: did latest: latest earliest: earliest [
	"Gets the path of repo commits"

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'commits' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'com.atproto.sync.getCommitPath'
				parameters: {'did' -> did.
						'latest' -> latest.
						'earliest' -> earliest} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncGetHeadDid: did [
	"Gets the current HEAD CID of a repo."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'root' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'com.atproto.sync.getHead'
				parameters: {'did' -> did} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncGetRecordDid: did collection: collection rkey: rkey commit: commit [
	"Gets blocks needed for existence or non-existence of record."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				queryOn: 'com.atproto.sync.getRecord'
				parameters: {'did' -> did.
						'collection' -> collection.
						'rkey' -> rkey.
						'commit' -> commit} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncGetRepoDid: did earliest: earliest latest: latest [
	"Gets the repo state."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				queryOn: 'com.atproto.sync.getRepo'
				parameters: {'did' -> did.
						'earliest' -> earliest.
						'latest' -> latest} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncListBlobsDid: did latest: latest earliest: earliest [
	"List blob cids for some range of commits"

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'cids' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'com.atproto.sync.listBlobs'
				parameters: {'did' -> did.
						'latest' -> latest.
						'earliest' -> earliest} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncListRepos [
	"List dids and root cids of hosted repos"

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | ComAtprotoSyncListReposRepo fromRequest: aDictionary ]
		stream: (self queryOn: 'com.atproto.sync.listRepos' parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncNotifyOfUpdateHostname: hostname [
	"Notify a crawling service of a recent update. Often when a long break between updates causes the connection with the crawling service to break."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				queryOn: 'com.atproto.sync.notifyOfUpdate'
				parameters: {'hostname' -> hostname} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncRequestCrawlHostname: hostname [
	"Request a service to persistently crawl hosted repos."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				queryOn: 'com.atproto.sync.requestCrawl'
				parameters: {'hostname' -> hostname} asDictionary)
]
