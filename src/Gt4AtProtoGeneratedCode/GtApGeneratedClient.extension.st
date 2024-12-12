Extension { #name : #GtApGeneratedClient }

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyActorGetPreferences [
	"Get private preferences attached to the current account. Expected use is synchronization between multiple devices, and import/export during account migration. Requires auth."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'preferences' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self queryOn: 'app.bsky.actor.getPreferences' parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyActorGetProfileActor: actor [
	"Get detailed profile view of an actor. Does not require auth, but contains relevant metadata with auth."

	<xrpcQuery>
	^ AppBskyActorDefsProfileViewDetailed
		fromRequest: (self
				queryOn: 'app.bsky.actor.getProfile'
				parameters: {'actor' -> actor} asDictionary)
		withClient: self
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyActorGetProfilesActors: actors [
	"Get detailed profile views of multiple actors."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'profiles' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'app.bsky.actor.getProfiles'
				parameters: {'actors' -> actors} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyActorGetSuggestions [
	"Get a list of suggested actors. Expected use is discovery of accounts to follow during new account onboarding."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | AppBskyActorDefsProfileView fromRequest: aDictionary withClient: self ]
		stream: (self
				paginatedQueryOn: 'app.bsky.actor.getSuggestions'
				parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyActorPutPreferencesPreferences: preferences [
	"Set the private preferences attached to the account."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'app.bsky.actor.putPreferences'
				withBody: {'preferences' -> preferences} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyActorSearchActorsTerm: term q: q [
	"Find actors (profiles) matching search criteria. Does not require auth."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | AppBskyActorDefsProfileView fromRequest: aDictionary withClient: self ]
		stream: (self
				paginatedQueryOn: 'app.bsky.actor.searchActors'
				parameters: {'term' -> term.
						'q' -> q} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyActorSearchActorsTypeaheadTerm: term q: q [
	"Find actor suggestions for a prefix search term. Expected use is for auto-completion during text field entry. Does not require auth."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'actors' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'app.bsky.actor.searchActorsTypeahead'
				parameters: {'term' -> term.
						'q' -> q} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedDescribeFeedGenerator [
	"Get information about a feed generator, including policies and offered feed URIs. Does not require auth; implemented by Feed Generator services (not App View)."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'did' -> [ :aValue | aValue ].
				'feeds' -> [ :aValue | aValue ].
				'links'
					-> [ :aValue | AppBskyFeedDescribeFeedGeneratorLinks fromRequest: aValue withClient: self ]}
				asDictionary
		andRequest: (self
				queryOn: 'app.bsky.feed.describeFeedGenerator'
				parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetActorFeedsActor: actor [
	"Get a list of feeds (feed generator records) created by the actor (in the actor's repo)."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | AppBskyFeedDefsGeneratorView fromRequest: aDictionary withClient: self ]
		stream: (self
				paginatedQueryOn: 'app.bsky.feed.getActorFeeds'
				parameters: {'actor' -> actor} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetActorLikesActor: actor [
	"Get a list of posts liked by an actor. Requires auth, actor must be the requesting account."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | AppBskyFeedDefsFeedViewPost fromRequest: aDictionary withClient: self ]
		stream: (self
				paginatedQueryOn: 'app.bsky.feed.getActorLikes'
				parameters: {'actor' -> actor} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetAuthorFeedActor: actor filter: filter includePins: includePins [
	"Get a view of an actor's 'author feed' (post and reposts by the author). Does not require auth."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | AppBskyFeedDefsFeedViewPost fromRequest: aDictionary withClient: self ]
		stream: (self
				paginatedQueryOn: 'app.bsky.feed.getAuthorFeed'
				parameters: {'actor' -> actor.
						'filter' -> filter.
						'includePins' -> includePins} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetFeedFeed: feed [
	"Get a hydrated feed from an actor's selected feed generator. Implemented by App View."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | AppBskyFeedDefsFeedViewPost fromRequest: aDictionary withClient: self ]
		stream: (self
				paginatedQueryOn: 'app.bsky.feed.getFeed'
				parameters: {'feed' -> feed} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetFeedGeneratorFeed: feed [
	"Get information about a feed generator. Implemented by AppView."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'view'
					-> [ :aValue | AppBskyFeedDefsGeneratorView fromRequest: aValue withClient: self ].
				'isOnline' -> [ :aValue | aValue ].
				'isValid' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'app.bsky.feed.getFeedGenerator'
				parameters: {'feed' -> feed} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetFeedGeneratorsFeeds: feeds [
	"Get information about a list of feed generators."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'feeds' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'app.bsky.feed.getFeedGenerators'
				parameters: {'feeds' -> feeds} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetFeedSkeletonFeed: feed [
	"Get a skeleton of a feed provided by a feed generator. Auth is optional, depending on provider requirements, and provides the DID of the requester. Implemented by Feed Generator Service."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | AppBskyFeedDefsSkeletonFeedPost fromRequest: aDictionary withClient: self ]
		stream: (self
				paginatedQueryOn: 'app.bsky.feed.getFeedSkeleton'
				parameters: {'feed' -> feed} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetLikesUri: uri cid: cid [
	"Get like records which reference a subject (by AT-URI and CID)."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'likes'
					-> (GtApRequestStreamResolver new
							block: [ :aDictionary | AppBskyFeedGetLikesLike fromRequest: aDictionary withClient: self ]).
				'uri' -> [ :aValue | aValue ].
				'cid' -> [ :aValue | aValue ].
				'cursor' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				paginatedQueryOn: 'app.bsky.feed.getLikes'
				parameters: {'uri' -> uri.
						'cid' -> cid} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetListFeedList: list [
	"Get a feed of recent posts from a list (posts and reposts from any actors on the list). Does not require auth."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | AppBskyFeedDefsFeedViewPost fromRequest: aDictionary withClient: self ]
		stream: (self
				paginatedQueryOn: 'app.bsky.feed.getListFeed'
				parameters: {'list' -> list} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetPostThreadUri: uri depth: depth parentHeight: parentHeight [
	"Get posts in a thread. Does not require auth, but additional metadata and filtering will be applied for authed requests."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'thread'
					-> [ :aValue | 
						({'app.bsky.feed.defs#threadViewPost' -> AppBskyFeedDefsThreadViewPost.
							'app.bsky.feed.defs#notFoundPost' -> AppBskyFeedDefsNotFoundPost.
							'app.bsky.feed.defs#blockedPost' -> AppBskyFeedDefsBlockedPost}
							asDictionary at: (aValue at: '$type'))
							fromRequest: aValue
							withClient: self ].
				'threadgate'
					-> [ :aValue | AppBskyFeedDefsThreadgateView fromRequest: aValue withClient: self ]}
				asDictionary
		andRequest: (self
				queryOn: 'app.bsky.feed.getPostThread'
				parameters: {'uri' -> uri.
						'depth' -> depth.
						'parentHeight' -> parentHeight} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetPostsUris: uris [
	"Gets post views for a specified list of posts (by AT-URI). This is sometimes referred to as 'hydrating' a 'feed skeleton'."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'posts' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'app.bsky.feed.getPosts'
				parameters: {'uris' -> uris} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetQuotesUri: uri cid: cid [
	"Get a list of quotes for a given post."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'posts'
					-> (GtApRequestStreamResolver new
							block: [ :aDictionary | AppBskyFeedDefsPostView fromRequest: aDictionary withClient: self ]).
				'uri' -> [ :aValue | aValue ].
				'cid' -> [ :aValue | aValue ].
				'cursor' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				paginatedQueryOn: 'app.bsky.feed.getQuotes'
				parameters: {'uri' -> uri.
						'cid' -> cid} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetRepostedByUri: uri cid: cid [
	"Get a list of reposts for a given post."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'repostedBy'
					-> (GtApRequestStreamResolver new
							block: [ :aDictionary | AppBskyActorDefsProfileView fromRequest: aDictionary withClient: self ]).
				'uri' -> [ :aValue | aValue ].
				'cid' -> [ :aValue | aValue ].
				'cursor' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				paginatedQueryOn: 'app.bsky.feed.getRepostedBy'
				parameters: {'uri' -> uri.
						'cid' -> cid} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetSuggestedFeeds [
	"Get a list of suggested feeds (feed generators) for the requesting account."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | AppBskyFeedDefsGeneratorView fromRequest: aDictionary withClient: self ]
		stream: (self
				paginatedQueryOn: 'app.bsky.feed.getSuggestedFeeds'
				parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedGetTimelineAlgorithm: algorithm [
	"Get a view of the requesting account's home timeline. This is expected to be some form of reverse-chronological feed."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | AppBskyFeedDefsFeedViewPost fromRequest: aDictionary withClient: self ]
		stream: (self
				paginatedQueryOn: 'app.bsky.feed.getTimeline'
				parameters: {'algorithm' -> algorithm} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedSearchPostsQ: q sort: sort since: since until: until mentions: mentions author: author lang: lang domain: domain url: url tag: tag [
	"Find posts matching search criteria, returning views of those posts."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'posts'
					-> (GtApRequestStreamResolver new
							block: [ :aDictionary | AppBskyFeedDefsPostView fromRequest: aDictionary withClient: self ]).
				'cursor' -> [ :aValue | aValue ].
				'hitsTotal' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				paginatedQueryOn: 'app.bsky.feed.searchPosts'
				parameters: {'q' -> q.
						'sort' -> sort.
						'since' -> since.
						'until' -> until.
						'mentions' -> mentions.
						'author' -> author.
						'lang' -> lang.
						'domain' -> domain.
						'url' -> url.
						'tag' -> tag} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyFeedSendInteractionsInteractions: interactions [
	"Send information about interactions with feed items back to the feed generator that served them."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'app.bsky.feed.sendInteractions'
				withBody: {'interactions' -> interactions} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphGetActorStarterPacksActor: actor [
	"Get a list of starter packs created by the actor."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | AppBskyGraphDefsStarterPackViewBasic fromRequest: aDictionary withClient: self ]
		stream: (self
				paginatedQueryOn: 'app.bsky.graph.getActorStarterPacks'
				parameters: {'actor' -> actor} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphGetBlocks [
	"Enumerates which accounts the requesting account is currently blocking. Requires auth."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | AppBskyActorDefsProfileView fromRequest: aDictionary withClient: self ]
		stream: (self paginatedQueryOn: 'app.bsky.graph.getBlocks' parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphGetFollowersActor: actor [
	"Enumerates accounts which follow a specified account (actor)."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'followers'
					-> (GtApRequestStreamResolver new
							block: [ :aDictionary | AppBskyActorDefsProfileView fromRequest: aDictionary withClient: self ]).
				'subject'
					-> [ :aValue | AppBskyActorDefsProfileView fromRequest: aValue withClient: self ].
				'cursor' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				paginatedQueryOn: 'app.bsky.graph.getFollowers'
				parameters: {'actor' -> actor} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphGetFollowsActor: actor [
	"Enumerates accounts which a specified account (actor) follows."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'follows'
					-> (GtApRequestStreamResolver new
							block: [ :aDictionary | AppBskyActorDefsProfileView fromRequest: aDictionary withClient: self ]).
				'subject'
					-> [ :aValue | AppBskyActorDefsProfileView fromRequest: aValue withClient: self ].
				'cursor' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				paginatedQueryOn: 'app.bsky.graph.getFollows'
				parameters: {'actor' -> actor} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphGetKnownFollowersActor: actor [
	"Enumerates accounts which follow a specified account (actor) and are followed by the viewer."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'followers'
					-> (GtApRequestStreamResolver new
							block: [ :aDictionary | AppBskyActorDefsProfileView fromRequest: aDictionary withClient: self ]).
				'subject'
					-> [ :aValue | AppBskyActorDefsProfileView fromRequest: aValue withClient: self ].
				'cursor' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				paginatedQueryOn: 'app.bsky.graph.getKnownFollowers'
				parameters: {'actor' -> actor} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphGetListBlocks [
	"Get mod lists that the requesting account (actor) is blocking. Requires auth."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | AppBskyGraphDefsListView fromRequest: aDictionary withClient: self ]
		stream: (self
				paginatedQueryOn: 'app.bsky.graph.getListBlocks'
				parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphGetListList: list [
	"Gets a 'view' (with additional context) of a specified list."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'items'
					-> (GtApRequestStreamResolver new
							block: [ :aDictionary | AppBskyGraphDefsListItemView fromRequest: aDictionary withClient: self ]).
				'cursor' -> [ :aValue | aValue ].
				'list'
					-> [ :aValue | AppBskyGraphDefsListView fromRequest: aValue withClient: self ]}
				asDictionary
		andRequest: (self
				paginatedQueryOn: 'app.bsky.graph.getList'
				parameters: {'list' -> list} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphGetListMutes [
	"Enumerates mod lists that the requesting account (actor) currently has muted. Requires auth."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | AppBskyGraphDefsListView fromRequest: aDictionary withClient: self ]
		stream: (self
				paginatedQueryOn: 'app.bsky.graph.getListMutes'
				parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphGetListsActor: actor [
	"Enumerates the lists created by a specified account (actor)."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | AppBskyGraphDefsListView fromRequest: aDictionary withClient: self ]
		stream: (self
				paginatedQueryOn: 'app.bsky.graph.getLists'
				parameters: {'actor' -> actor} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphGetMutes [
	"Enumerates accounts that the requesting account (actor) currently has muted. Requires auth."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | AppBskyActorDefsProfileView fromRequest: aDictionary withClient: self ]
		stream: (self paginatedQueryOn: 'app.bsky.graph.getMutes' parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphGetRelationshipsActor: actor others: others [
	"Enumerates public relationships between one account, and a list of other accounts. Does not require auth."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'actor' -> [ :aValue | aValue ].
				'relationships' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'app.bsky.graph.getRelationships'
				parameters: {'actor' -> actor.
						'others' -> others} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphGetStarterPackStarterPack: starterPack [
	"Gets a view of a starter pack."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'starterPack'
					-> [ :aValue | AppBskyGraphDefsStarterPackView fromRequest: aValue withClient: self ]}
				asDictionary
		andRequest: (self
				queryOn: 'app.bsky.graph.getStarterPack'
				parameters: {'starterPack' -> starterPack} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphGetStarterPacksUris: uris [
	"Get views for a list of starter packs."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'starterPacks' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'app.bsky.graph.getStarterPacks'
				parameters: {'uris' -> uris} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphGetSuggestedFollowsByActorActor: actor [
	"Enumerates follows similar to a given account (actor). Expected use is to recommend additional accounts immediately after following one account."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'suggestions' -> [ :aValue | aValue ].
				'isFallback' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'app.bsky.graph.getSuggestedFollowsByActor'
				parameters: {'actor' -> actor} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphMuteActorActor: actor [
	"Creates a mute relationship for the specified account. Mutes are private in Bluesky. Requires auth."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'app.bsky.graph.muteActor'
				withBody: {'actor' -> actor} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphMuteActorListList: list [
	"Creates a mute relationship for the specified list of accounts. Mutes are private in Bluesky. Requires auth."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'app.bsky.graph.muteActorList'
				withBody: {'list' -> list} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphMuteThreadRoot: root [
	"Mutes a thread preventing notifications from the thread and any of its children. Mutes are private in Bluesky. Requires auth."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'app.bsky.graph.muteThread'
				withBody: {'root' -> root} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphSearchStarterPacksQ: q [
	"Find starter packs matching search criteria. Does not require auth."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | AppBskyGraphDefsStarterPackViewBasic fromRequest: aDictionary withClient: self ]
		stream: (self
				paginatedQueryOn: 'app.bsky.graph.searchStarterPacks'
				parameters: {'q' -> q} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphUnmuteActorActor: actor [
	"Unmutes the specified account. Requires auth."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'app.bsky.graph.unmuteActor'
				withBody: {'actor' -> actor} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphUnmuteActorListList: list [
	"Unmutes the specified list of accounts. Requires auth."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'app.bsky.graph.unmuteActorList'
				withBody: {'list' -> list} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyGraphUnmuteThreadRoot: root [
	"Unmutes the specified thread. Requires auth."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'app.bsky.graph.unmuteThread'
				withBody: {'root' -> root} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyLabelerGetServicesDids: dids detailed: detailed [
	"Get information about a list of labeler services."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'views' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'app.bsky.labeler.getServices'
				parameters: {'dids' -> dids.
						'detailed' -> detailed} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyNotificationGetUnreadCountPriority: priority seenAt: seenAt [
	"Count the number of unread notifications for the requesting account. Requires auth."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'count' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'app.bsky.notification.getUnreadCount'
				parameters: {'priority' -> priority.
						'seenAt' -> seenAt} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyNotificationListNotificationsReasons: reasons priority: priority seenAt: seenAt [
	"Enumerate notifications for the requesting account. Requires auth."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'notifications'
					-> (GtApRequestStreamResolver new
							block: [ :aDictionary | 
								AppBskyNotificationListNotificationsNotification
									fromRequest: aDictionary
									withClient: self ]).
				'cursor' -> [ :aValue | aValue ].
				'priority' -> [ :aValue | aValue ].
				'seenAt' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				paginatedQueryOn: 'app.bsky.notification.listNotifications'
				parameters: {'reasons' -> reasons.
						'priority' -> priority.
						'seenAt' -> seenAt} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyNotificationPutPreferencesPriority: priority [
	"Set notification-related preferences for an account. Requires auth."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'app.bsky.notification.putPreferences'
				withBody: {'priority' -> priority} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyNotificationRegisterPushServiceDid: serviceDid token: token platform: platform appId: appId [
	"Register to receive push notifications, via a specified service, for the requesting account. Requires auth."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'app.bsky.notification.registerPush'
				withBody: {'serviceDid' -> serviceDid.
						'token' -> token.
						'platform' -> platform.
						'appId' -> appId} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyNotificationUpdateSeenSeenAt: seenAt [
	"Notify server that the requesting account has seen notifications. Requires auth."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'app.bsky.notification.updateSeen'
				withBody: {'seenAt' -> seenAt} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyUnspeccedGetConfig [
	"Get miscellaneous runtime configuration."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'checkEmailConfirmed' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self queryOn: 'app.bsky.unspecced.getConfig' parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyUnspeccedGetPopularFeedGeneratorsquery: query [
	"An unspecced view of globally popular feed generators."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | AppBskyFeedDefsGeneratorView fromRequest: aDictionary withClient: self ]
		stream: (self
				paginatedQueryOn: 'app.bsky.unspecced.getPopularFeedGenerators'
				parameters: {'query' -> query} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyUnspeccedGetSuggestionsSkeletonViewer: viewer relativeToDid: relativeToDid [
	"Get a skeleton of suggested actors. Intended to be called and then hydrated through app.bsky.actor.getSuggestions"

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'actors'
					-> (GtApRequestStreamResolver new
							block: [ :aDictionary | 
								AppBskyUnspeccedDefsSkeletonSearchActor
									fromRequest: aDictionary
									withClient: self ]).
				'cursor' -> [ :aValue | aValue ].
				'relativeToDid' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				paginatedQueryOn: 'app.bsky.unspecced.getSuggestionsSkeleton'
				parameters: {'viewer' -> viewer.
						'relativeToDid' -> relativeToDid} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyUnspeccedGetTaggedSuggestions [
	"Get a list of suggestions (feeds and users) tagged with categories"

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'suggestions' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'app.bsky.unspecced.getTaggedSuggestions'
				parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyUnspeccedSearchActorsSkeletonQ: q viewer: viewer typeahead: typeahead [
	"Backend Actors (profile) search, returns only skeleton."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'actors'
					-> (GtApRequestStreamResolver new
							block: [ :aDictionary | 
								AppBskyUnspeccedDefsSkeletonSearchActor
									fromRequest: aDictionary
									withClient: self ]).
				'cursor' -> [ :aValue | aValue ].
				'hitsTotal' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				paginatedQueryOn: 'app.bsky.unspecced.searchActorsSkeleton'
				parameters: {'q' -> q.
						'viewer' -> viewer.
						'typeahead' -> typeahead} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyUnspeccedSearchPostsSkeletonQ: q sort: sort since: since until: until mentions: mentions author: author lang: lang domain: domain url: url tag: tag viewer: viewer [
	"Backend Posts search, returns only skeleton"

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'posts'
					-> (GtApRequestStreamResolver new
							block: [ :aDictionary | AppBskyUnspeccedDefsSkeletonSearchPost fromRequest: aDictionary withClient: self ]).
				'cursor' -> [ :aValue | aValue ].
				'hitsTotal' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				paginatedQueryOn: 'app.bsky.unspecced.searchPostsSkeleton'
				parameters: {'q' -> q.
						'sort' -> sort.
						'since' -> since.
						'until' -> until.
						'mentions' -> mentions.
						'author' -> author.
						'lang' -> lang.
						'domain' -> domain.
						'url' -> url.
						'tag' -> tag.
						'viewer' -> viewer} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyUnspeccedSearchStarterPacksSkeletonQ: q viewer: viewer [
	"Backend Starter Pack search, returns only skeleton."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'starterPacks'
					-> (GtApRequestStreamResolver new
							block: [ :aDictionary | 
								AppBskyUnspeccedDefsSkeletonSearchStarterPack
									fromRequest: aDictionary
									withClient: self ]).
				'cursor' -> [ :aValue | aValue ].
				'hitsTotal' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				paginatedQueryOn: 'app.bsky.unspecced.searchStarterPacksSkeleton'
				parameters: {'q' -> q.
						'viewer' -> viewer} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyVideoGetJobStatusJobId: jobId [
	"Get status details for a video processing job."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'jobStatus'
					-> [ :aValue | AppBskyVideoDefsJobStatus fromRequest: aValue withClient: self ]}
				asDictionary
		andRequest: (self
				queryOn: 'app.bsky.video.getJobStatus'
				parameters: {'jobId' -> jobId} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyVideoGetUploadLimits [
	"Get video upload limits for the authenticated user."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'canUpload' -> [ :aValue | aValue ].
				'remainingDailyVideos' -> [ :aValue | aValue ].
				'remainingDailyBytes' -> [ :aValue | aValue ].
				'message' -> [ :aValue | aValue ].
				'error' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'app.bsky.video.getUploadLimits'
				parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> appBskyVideoUploadVideo [
	"Upload a video to be processed then stored on the PDS."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {'jobStatus'
					-> [ :aValue | AppBskyVideoDefsJobStatus fromRequest: aValue withClient: self ]}
				asDictionary
		andRequest: (self
				procedureOn: 'app.bsky.video.uploadVideo'
				withBody: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> chatBskyActorDeleteAccount [
	""

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self procedureOn: 'chat.bsky.actor.deleteAccount' withBody: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> chatBskyActorExportAccountData [
	""

	<xrpcQuery>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self queryOn: 'chat.bsky.actor.exportAccountData' parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> chatBskyConvoDeleteMessageForSelfConvoId: convoId messageId: messageId [
	""

	<xrpcProcedure>
	^ ChatBskyConvoDefsDeletedMessageView
		fromRequest: (self
				procedureOn: 'chat.bsky.convo.deleteMessageForSelf'
				withBody: {'convoId' -> convoId.
						'messageId' -> messageId} asDictionary)
		withClient: self
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> chatBskyConvoGetConvoConvoId: convoId [
	""

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'convo'
					-> [ :aValue | ChatBskyConvoDefsConvoView fromRequest: aValue withClient: self ]}
				asDictionary
		andRequest: (self
				queryOn: 'chat.bsky.convo.getConvo'
				parameters: {'convoId' -> convoId} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> chatBskyConvoGetConvoForMembersMembers: members [
	""

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'convo'
					-> [ :aValue | ChatBskyConvoDefsConvoView fromRequest: aValue withClient: self ]}
				asDictionary
		andRequest: (self
				queryOn: 'chat.bsky.convo.getConvoForMembers'
				parameters: {'members' -> members} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> chatBskyConvoGetLog [
	""

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | 
			({'chat.bsky.convo.defs#logBeginConvo' -> ChatBskyConvoDefsLogBeginConvo.
				'chat.bsky.convo.defs#logLeaveConvo' -> ChatBskyConvoDefsLogLeaveConvo.
				'chat.bsky.convo.defs#logCreateMessage' -> ChatBskyConvoDefsLogCreateMessage.
				'chat.bsky.convo.defs#logDeleteMessage' -> ChatBskyConvoDefsLogDeleteMessage}
				asDictionary at: (aDictionary at: '$type'))
				fromRequest: aDictionary
				withClient: self ]
		stream: (self
				paginatedQueryOn: 'chat.bsky.convo.getLog'
				parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> chatBskyConvoGetMessagesConvoId: convoId [
	""

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | 
			({'chat.bsky.convo.defs#messageView' -> ChatBskyConvoDefsMessageView.
				'chat.bsky.convo.defs#deletedMessageView'
					-> ChatBskyConvoDefsDeletedMessageView} asDictionary
				at: (aDictionary at: '$type')) fromRequest: aDictionary withClient: self ]
		stream: (self
				paginatedQueryOn: 'chat.bsky.convo.getMessages'
				parameters: {'convoId' -> convoId} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> chatBskyConvoLeaveConvoConvoId: convoId [
	""

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {'convoId' -> [ :aValue | aValue ].
				'rev' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				procedureOn: 'chat.bsky.convo.leaveConvo'
				withBody: {'convoId' -> convoId} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> chatBskyConvoListConvos [
	""

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | ChatBskyConvoDefsConvoView fromRequest: aDictionary withClient: self ]
		stream: (self paginatedQueryOn: 'chat.bsky.convo.listConvos' parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> chatBskyConvoMuteConvoConvoId: convoId [
	""

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {'convo'
					-> [ :aValue | ChatBskyConvoDefsConvoView fromRequest: aValue withClient: self ]}
				asDictionary
		andRequest: (self
				procedureOn: 'chat.bsky.convo.muteConvo'
				withBody: {'convoId' -> convoId} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> chatBskyConvoSendMessageBatchItems: items [
	""

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {'items' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				procedureOn: 'chat.bsky.convo.sendMessageBatch'
				withBody: {'items' -> items} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> chatBskyConvoSendMessageConvoId: convoId message: message [
	""

	<xrpcProcedure>
	^ ChatBskyConvoDefsMessageView
		fromRequest: (self
				procedureOn: 'chat.bsky.convo.sendMessage'
				withBody: {'convoId' -> convoId.
						'message' -> message} asDictionary)
		withClient: self
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> chatBskyConvoUnmuteConvoConvoId: convoId [
	""

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {'convo'
					-> [ :aValue | ChatBskyConvoDefsConvoView fromRequest: aValue withClient: self ]}
				asDictionary
		andRequest: (self
				procedureOn: 'chat.bsky.convo.unmuteConvo'
				withBody: {'convoId' -> convoId} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> chatBskyConvoUpdateReadConvoId: convoId messageId: messageId [
	""

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {'convo'
					-> [ :aValue | ChatBskyConvoDefsConvoView fromRequest: aValue withClient: self ]}
				asDictionary
		andRequest: (self
				procedureOn: 'chat.bsky.convo.updateRead'
				withBody: {'convoId' -> convoId.
						'messageId' -> messageId} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> chatBskyModerationGetActorMetadataActor: actor [
	""

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'day'
					-> [ :aValue | ChatBskyModerationGetActorMetadataMetadata fromRequest: aValue withClient: self ].
				'month'
					-> [ :aValue | ChatBskyModerationGetActorMetadataMetadata fromRequest: aValue withClient: self ].
				'all'
					-> [ :aValue | ChatBskyModerationGetActorMetadataMetadata fromRequest: aValue withClient: self ]}
				asDictionary
		andRequest: (self
				queryOn: 'chat.bsky.moderation.getActorMetadata'
				parameters: {'actor' -> actor} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> chatBskyModerationGetMessageContextConvoId: convoId messageId: messageId before: before after: after [
	""

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'messages' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'chat.bsky.moderation.getMessageContext'
				parameters: {'convoId' -> convoId.
						'messageId' -> messageId.
						'before' -> before.
						'after' -> after} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> chatBskyModerationUpdateActorAccessActor: actor allowAccess: allowAccess ref: ref [
	""

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'chat.bsky.moderation.updateActorAccess'
				withBody: {'actor' -> actor.
						'allowAccess' -> allowAccess.
						'ref' -> ref} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminDeleteAccountDid: did [
	"Delete a user account as an administrator."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.admin.deleteAccount'
				withBody: {'did' -> did} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminDisableAccountInvitesAccount: account note: note [
	"Disable an account from receiving new invite codes, but does not invalidate existing codes."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.admin.disableAccountInvites'
				withBody: {'account' -> account.
						'note' -> note} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminDisableInviteCodesCodes: codes accounts: accounts [
	"Disable some set of codes and/or all codes associated with a set of users."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.admin.disableInviteCodes'
				withBody: {'codes' -> codes.
						'accounts' -> accounts} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminEnableAccountInvitesAccount: account note: note [
	"Re-enable an account's ability to receive invite codes."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.admin.enableAccountInvites'
				withBody: {'account' -> account.
						'note' -> note} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminGetAccountInfoDid: did [
	"Get details about an account."

	<xrpcQuery>
	^ ComAtprotoAdminDefsAccountView
		fromRequest: (self
				queryOn: 'com.atproto.admin.getAccountInfo'
				parameters: {'did' -> did} asDictionary)
		withClient: self
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminGetAccountInfosDids: dids [
	"Get details about some accounts."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'infos' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'com.atproto.admin.getAccountInfos'
				parameters: {'dids' -> dids} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminGetInviteCodesSort: sort [
	"Get an admin view of invite codes."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | ComAtprotoServerDefsInviteCode fromRequest: aDictionary withClient: self ]
		stream: (self
				paginatedQueryOn: 'com.atproto.admin.getInviteCodes'
				parameters: {'sort' -> sort} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminGetSubjectStatusDid: did uri: uri blob: blob [
	"Get the service-specific admin status of a subject (account, record, or blob)."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'subject'
					-> [ :aValue | 
						({'com.atproto.admin.defs#repoRef' -> ComAtprotoAdminDefsRepoRef.
							'com.atproto.repo.strongRef' -> ComAtprotoRepoStrongRefMain.
							'com.atproto.admin.defs#repoBlobRef' -> ComAtprotoAdminDefsRepoBlobRef}
							asDictionary at: (aValue at: '$type'))
							fromRequest: aValue
							withClient: self ].
				'takedown'
					-> [ :aValue | ComAtprotoAdminDefsStatusAttr fromRequest: aValue withClient: self ].
				'deactivated'
					-> [ :aValue | ComAtprotoAdminDefsStatusAttr fromRequest: aValue withClient: self ]}
				asDictionary
		andRequest: (self
				queryOn: 'com.atproto.admin.getSubjectStatus'
				parameters: {'did' -> did.
						'uri' -> uri.
						'blob' -> blob} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminSearchAccountsEmail: email [
	"Get list of accounts that matches your search query."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | ComAtprotoAdminDefsAccountView fromRequest: aDictionary withClient: self ]
		stream: (self
				paginatedQueryOn: 'com.atproto.admin.searchAccounts'
				parameters: {'email' -> email} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminSendEmailRecipientDid: recipientDid content: content subject: subject senderDid: senderDid comment: comment [
	"Send email to a user's account email address."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {'sent' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.admin.sendEmail'
				withBody: {'recipientDid' -> recipientDid.
						'content' -> content.
						'subject' -> subject.
						'senderDid' -> senderDid.
						'comment' -> comment} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminUpdateAccountEmailAccount: account email: email [
	"Administrative action to update an account's email."

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
	"Administrative action to update an account's handle."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.admin.updateAccountHandle'
				withBody: {'did' -> did.
						'handle' -> handle} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminUpdateAccountPasswordDid: did password: password [
	"Update the password for a user account as an administrator."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.admin.updateAccountPassword'
				withBody: {'did' -> did.
						'password' -> password} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoAdminUpdateSubjectStatusSubject: subject takedown: takedown deactivated: deactivated [
	"Update the service-specific admin status of a subject (account, record, or blob)."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {'subject'
					-> [ :aValue | 
						({'com.atproto.admin.defs#repoRef' -> ComAtprotoAdminDefsRepoRef.
							'com.atproto.repo.strongRef' -> ComAtprotoRepoStrongRefMain.
							'com.atproto.admin.defs#repoBlobRef' -> ComAtprotoAdminDefsRepoBlobRef}
							asDictionary at: (aValue at: '$type'))
							fromRequest: aValue
							withClient: self ].
				'takedown'
					-> [ :aValue | ComAtprotoAdminDefsStatusAttr fromRequest: aValue withClient: self ]}
				asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.admin.updateSubjectStatus'
				withBody: {'subject' -> subject.
						'takedown' -> takedown.
						'deactivated' -> deactivated} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoIdentityGetRecommendedDidCredentials [
	"Describe the credentials that should be included in the DID doc of an account that is migrating to this service."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'rotationKeys' -> [ :aValue | aValue ].
				'alsoKnownAs' -> [ :aValue | aValue ].
				'verificationMethods'
					-> [ :aValue | GtApModelEntity findForRequest: aValue withClient: self ].
				'services'
					-> [ :aValue | GtApModelEntity findForRequest: aValue withClient: self ]}
				asDictionary
		andRequest: (self
				queryOn: 'com.atproto.identity.getRecommendedDidCredentials'
				parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoIdentityRequestPlcOperationSignature [
	"Request an email with a code to in order to request a signed PLC operation. Requires Auth."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.identity.requestPlcOperationSignature'
				withBody: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoIdentityResolveHandleHandle: handle [
	"Resolves a handle (domain name) to a DID."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'did' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'com.atproto.identity.resolveHandle'
				parameters: {'handle' -> handle} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoIdentitySignPlcOperationToken: token rotationKeys: rotationKeys alsoKnownAs: alsoKnownAs verificationMethods: verificationMethods services: services [
	"Signs a PLC operation to update some value(s) in the requesting DID's document."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {'operation'
					-> [ :aValue | GtApModelEntity findForRequest: aValue withClient: self ]}
				asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.identity.signPlcOperation'
				withBody: {'token' -> token.
						'rotationKeys' -> rotationKeys.
						'alsoKnownAs' -> alsoKnownAs.
						'verificationMethods' -> verificationMethods.
						'services' -> services} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoIdentitySubmitPlcOperationOperation: operation [
	"Validates a PLC operation to ensure that it doesn't violate a service's constraints or get the identity into a bad state, then submits it to the PLC registry"

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.identity.submitPlcOperation'
				withBody: {'operation' -> operation} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoIdentityUpdateHandleHandle: handle [
	"Updates the current account's handle. Verifies handle validity, and updates did:plc document if necessary. Implemented by PDS, and requires auth."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.identity.updateHandle'
				withBody: {'handle' -> handle} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoLabelQueryLabelsUriPatterns: uriPatterns sources: sources [
	"Find labels relevant to the provided AT-URI patterns. Public endpoint for moderation services, though may return different or additional results with auth."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | ComAtprotoLabelDefsLabel fromRequest: aDictionary withClient: self ]
		stream: (self
				paginatedQueryOn: 'com.atproto.label.queryLabels'
				parameters: {'uriPatterns' -> uriPatterns.
						'sources' -> sources} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoModerationCreateReportReasonType: reasonType reason: reason subject: subject [
	"Submit a moderation report regarding an atproto account or record. Implemented by moderation services (with PDS proxying), and requires auth."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {'id' -> [ :aValue | aValue ].
				'reasonType' -> [ :aValue | aValue ].
				'reason' -> [ :aValue | aValue ].
				'subject'
					-> [ :aValue | 
						({'com.atproto.admin.defs#repoRef' -> ComAtprotoAdminDefsRepoRef.
							'com.atproto.repo.strongRef' -> ComAtprotoRepoStrongRefMain} asDictionary
							at: (aValue at: '$type')) fromRequest: aValue withClient: self ].
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
	"Apply a batch transaction of repository creates, updates, and deletes. Requires auth, implemented by PDS."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {'commit'
					-> [ :aValue | ComAtprotoRepoDefsCommitMeta fromRequest: aValue withClient: self ].
				'results' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.repo.applyWrites'
				withBody: {'repo' -> repo.
						'validate' -> validate.
						'writes' -> writes.
						'swapCommit' -> swapCommit} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoCreateRecordRepo: repo collection: collection rkey: rkey validate: validate record: record swapCommit: swapCommit [
	"Create a single new repository record. Requires auth, implemented by PDS."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {'uri' -> [ :aValue | aValue ].
				'cid' -> [ :aValue | aValue ].
				'commit'
					-> [ :aValue | ComAtprotoRepoDefsCommitMeta fromRequest: aValue withClient: self ].
				'validationStatus' -> [ :aValue | aValue ]} asDictionary
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
	"Delete a repository record, or ensure it doesn't exist. Requires auth, implemented by PDS."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {'commit'
					-> [ :aValue | ComAtprotoRepoDefsCommitMeta fromRequest: aValue withClient: self ]}
				asDictionary
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
	"Get information about an account and repository, including the list of collections. Does not require auth."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'handle' -> [ :aValue | aValue ].
				'did' -> [ :aValue | aValue ].
				'didDoc'
					-> [ :aValue | GtApModelEntity findForRequest: aValue withClient: self ].
				'collections' -> [ :aValue | aValue ].
				'handleIsCorrect' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'com.atproto.repo.describeRepo'
				parameters: {'repo' -> repo} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoGetRecordRepo: repo collection: collection rkey: rkey cid: cid [
	"Get a single record from a repository. Does not require auth."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'uri' -> [ :aValue | aValue ].
				'cid' -> [ :aValue | aValue ].
				'value'
					-> [ :aValue | GtApModelEntity findForRequest: aValue withClient: self ]}
				asDictionary
		andRequest: (self
				queryOn: 'com.atproto.repo.getRecord'
				parameters: {'repo' -> repo.
						'collection' -> collection.
						'rkey' -> rkey.
						'cid' -> cid} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoImportRepo [
	"Import a repo in the form of a CAR file. Requires Content-Length HTTP header to be set."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self procedureOn: 'com.atproto.repo.importRepo' withBody: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoListMissingBlobs [
	"Returns a list of missing blobs for the requesting account. Intended to be used in the account migration flow."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | 
			ComAtprotoRepoListMissingBlobsRecordBlob
				fromRequest: aDictionary
				withClient: self ]
		stream: (self
				paginatedQueryOn: 'com.atproto.repo.listMissingBlobs'
				parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoListRecordsRepo: repo collection: collection rkeyStart: rkeyStart rkeyEnd: rkeyEnd reverse: reverse [
	"List a range of records in a repository, matching a specific collection. Does not require auth."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | ComAtprotoRepoListRecordsRecord fromRequest: aDictionary withClient: self ]
		stream: (self
				paginatedQueryOn: 'com.atproto.repo.listRecords'
				parameters: {'repo' -> repo.
						'collection' -> collection.
						'rkeyStart' -> rkeyStart.
						'rkeyEnd' -> rkeyEnd.
						'reverse' -> reverse} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoRepoPutRecordRepo: repo collection: collection rkey: rkey validate: validate record: record swapRecord: swapRecord swapCommit: swapCommit [
	"Write a repository record, creating or updating it as needed. Requires auth, implemented by PDS."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {'uri' -> [ :aValue | aValue ].
				'cid' -> [ :aValue | aValue ].
				'commit'
					-> [ :aValue | ComAtprotoRepoDefsCommitMeta fromRequest: aValue withClient: self ].
				'validationStatus' -> [ :aValue | aValue ]} asDictionary
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
GtApGeneratedClient >> comAtprotoRepoUploadBlobFile: aFile [
	"Upload a new blob, to be referenced from a repository record. The blob will be deleted if it is not referenced within a time window (eg, minutes). Blob restrictions (mimetype, size, etc) are enforced when the reference is created. Requires auth, implemented by PDS."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {'blob' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self procedureOn: 'com.atproto.repo.uploadBlob' withFile: aFile)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerActivateAccount [
	"Activates a currently deactivated account. Used to finalize account migration after the account's repo is imported and identity is setup."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.server.activateAccount'
				withBody: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerCheckAccountStatus [
	"Returns the status of an account, especially as pertaining to import or recovery. Can be called many times over the course of an account migration. Requires auth and can only be called pertaining to oneself."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'activated' -> [ :aValue | aValue ].
				'validDid' -> [ :aValue | aValue ].
				'repoCommit' -> [ :aValue | aValue ].
				'repoRev' -> [ :aValue | aValue ].
				'repoBlocks' -> [ :aValue | aValue ].
				'indexedRecords' -> [ :aValue | aValue ].
				'privateStateValues' -> [ :aValue | aValue ].
				'expectedBlobs' -> [ :aValue | aValue ].
				'importedBlobs' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'com.atproto.server.checkAccountStatus'
				parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerConfirmEmailEmail: email token: token [
	"Confirm an email using a token from com.atproto.server.requestEmailConfirmation."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.server.confirmEmail'
				withBody: {'email' -> email.
						'token' -> token} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerCreateAccountEmail: email handle: handle did: did inviteCode: inviteCode verificationCode: verificationCode verificationPhone: verificationPhone password: password recoveryKey: recoveryKey plcOp: plcOp [
	"Create an account. Implemented by PDS."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {'accessJwt' -> [ :aValue | aValue ].
				'refreshJwt' -> [ :aValue | aValue ].
				'handle' -> [ :aValue | aValue ].
				'did' -> [ :aValue | aValue ].
				'didDoc'
					-> [ :aValue | GtApModelEntity findForRequest: aValue withClient: self ]}
				asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.server.createAccount'
				withBody: {'email' -> email.
						'handle' -> handle.
						'did' -> did.
						'inviteCode' -> inviteCode.
						'verificationCode' -> verificationCode.
						'verificationPhone' -> verificationPhone.
						'password' -> password.
						'recoveryKey' -> recoveryKey.
						'plcOp' -> plcOp} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerCreateAppPasswordName: name privileged: privileged [
	"Create an App Password."

	<xrpcProcedure>
	^ ComAtprotoServerCreateAppPasswordAppPassword
		fromRequest: (self
				procedureOn: 'com.atproto.server.createAppPassword'
				withBody: {'name' -> name.
						'privileged' -> privileged} asDictionary)
		withClient: self
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
	"Create invite codes."

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
GtApGeneratedClient >> comAtprotoServerCreateSessionIdentifier: identifier password: password authFactorToken: authFactorToken [
	"Create an authentication session."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {'accessJwt' -> [ :aValue | aValue ].
				'refreshJwt' -> [ :aValue | aValue ].
				'handle' -> [ :aValue | aValue ].
				'did' -> [ :aValue | aValue ].
				'didDoc'
					-> [ :aValue | GtApModelEntity findForRequest: aValue withClient: self ].
				'email' -> [ :aValue | aValue ].
				'emailConfirmed' -> [ :aValue | aValue ].
				'emailAuthFactor' -> [ :aValue | aValue ].
				'active' -> [ :aValue | aValue ].
				'status' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.server.createSession'
				withBody: {'identifier' -> identifier.
						'password' -> password.
						'authFactorToken' -> authFactorToken} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerDeactivateAccountDeleteAfter: deleteAfter [
	"Deactivates a currently active account. Stops serving of repo, and future writes to repo until reactivated. Used to finalize account migration with the old host after the account has been activated on the new host."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.server.deactivateAccount'
				withBody: {'deleteAfter' -> deleteAfter} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerDeleteAccountDid: did password: password token: token [
	"Delete an actor's account with a token and password. Can only be called after requesting a deletion token. Requires auth."

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
	"Delete the current session. Requires auth."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self procedureOn: 'com.atproto.server.deleteSession' withBody: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerDescribeServer [
	"Describes the server's account creation requirements and capabilities. Implemented by PDS."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'inviteCodeRequired' -> [ :aValue | aValue ].
				'phoneVerificationRequired' -> [ :aValue | aValue ].
				'availableUserDomains' -> [ :aValue | aValue ].
				'links'
					-> [ :aValue | ComAtprotoServerDescribeServerLinks fromRequest: aValue withClient: self ].
				'contact'
					-> [ :aValue | ComAtprotoServerDescribeServerContact fromRequest: aValue withClient: self ].
				'did' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'com.atproto.server.describeServer'
				parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerGetAccountInviteCodesIncludeUsed: includeUsed createAvailable: createAvailable [
	"Get all invite codes for the current account. Requires auth."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'codes' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'com.atproto.server.getAccountInviteCodes'
				parameters: {'includeUsed' -> includeUsed.
						'createAvailable' -> createAvailable} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerGetServiceAuthAud: aud exp: exp lxm: lxm [
	"Get a signed token on behalf of the requesting DID for the requested service."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'token' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'com.atproto.server.getServiceAuth'
				parameters: {'aud' -> aud.
						'exp' -> exp.
						'lxm' -> lxm} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerGetSession [
	"Get information about the current auth session. Requires auth."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'handle' -> [ :aValue | aValue ].
				'did' -> [ :aValue | aValue ].
				'email' -> [ :aValue | aValue ].
				'emailConfirmed' -> [ :aValue | aValue ].
				'emailAuthFactor' -> [ :aValue | aValue ].
				'didDoc'
					-> [ :aValue | GtApModelEntity findForRequest: aValue withClient: self ].
				'active' -> [ :aValue | aValue ].
				'status' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'com.atproto.server.getSession'
				parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerListAppPasswords [
	"List all App Passwords."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'passwords' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self queryOn: 'com.atproto.server.listAppPasswords' parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerRefreshSession [
	"Refresh an authentication session. Requires auth using the 'refreshJwt' (not the 'accessJwt')."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {'accessJwt' -> [ :aValue | aValue ].
				'refreshJwt' -> [ :aValue | aValue ].
				'handle' -> [ :aValue | aValue ].
				'did' -> [ :aValue | aValue ].
				'didDoc'
					-> [ :aValue | GtApModelEntity findForRequest: aValue withClient: self ].
				'active' -> [ :aValue | aValue ].
				'status' -> [ :aValue | aValue ]} asDictionary
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
GtApGeneratedClient >> comAtprotoServerRequestEmailConfirmation [
	"Request an email with a code to confirm ownership of email."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.server.requestEmailConfirmation'
				withBody: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerRequestEmailUpdate [
	"Request a token in order to update email."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {'tokenRequired' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.server.requestEmailUpdate'
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
GtApGeneratedClient >> comAtprotoServerReserveSigningKeyDid: did [
	"Reserve a repo signing key, for use with account creation. Necessary so that a DID PLC update operation can be constructed during an account migraiton. Public and does not require auth; implemented by PDS. NOTE: this endpoint may change when full account migration is implemented."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {'signingKey' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.server.reserveSigningKey'
				withBody: {'did' -> did} asDictionary)
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
	"Revoke an App Password by name."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.server.revokeAppPassword'
				withBody: {'name' -> name} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoServerUpdateEmailEmail: email emailAuthFactor: emailAuthFactor token: token [
	"Update an account's email."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.server.updateEmail'
				withBody: {'email' -> email.
						'emailAuthFactor' -> emailAuthFactor.
						'token' -> token} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncGetBlobDid: did cid: cid [
	"Get a blob associated with a given account. Returns the full blob as originally uploaded. Does not require auth; implemented by PDS."

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
	"Get data blocks from a given repo, by CID. For example, intermediate MST nodes, or records. Does not require auth; implemented by PDS."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				queryOn: 'com.atproto.sync.getBlocks'
				parameters: {'did' -> did.
						'cids' -> cids} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncGetCheckoutDid: did [
	"DEPRECATED - please use com.atproto.sync.getRepo instead"

	<xrpcQuery>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				queryOn: 'com.atproto.sync.getCheckout'
				parameters: {'did' -> did} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncGetHeadDid: did [
	"DEPRECATED - please use com.atproto.sync.getLatestCommit instead"

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'root' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'com.atproto.sync.getHead'
				parameters: {'did' -> did} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncGetLatestCommitDid: did [
	"Get the current commit CID & revision of the specified repo. Does not require auth."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'cid' -> [ :aValue | aValue ].
				'rev' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'com.atproto.sync.getLatestCommit'
				parameters: {'did' -> did} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncGetRecordDid: did collection: collection rkey: rkey commit: commit [
	"Get data blocks needed to prove the existence or non-existence of record in the current version of repo. Does not require auth."

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
GtApGeneratedClient >> comAtprotoSyncGetRepoDid: did since: since [
	"Download a repository export as CAR file. Optionally only a 'diff' since a previous revision. Does not require auth; implemented by PDS."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				queryOn: 'com.atproto.sync.getRepo'
				parameters: {'did' -> did.
						'since' -> since} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncGetRepoStatusDid: did [
	"Get the hosting status for a repository, on this server. Expected to be implemented by PDS and Relay."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'did' -> [ :aValue | aValue ].
				'active' -> [ :aValue | aValue ].
				'status' -> [ :aValue | aValue ].
				'rev' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'com.atproto.sync.getRepoStatus'
				parameters: {'did' -> did} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncListBlobsDid: did since: since [
	"List blob CIDs for an account, since some repo revision. Does not require auth; implemented by PDS."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | aDictionary ]
		stream: (self
				paginatedQueryOn: 'com.atproto.sync.listBlobs'
				parameters: {'did' -> did.
						'since' -> since} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncListRepos [
	"Enumerates all the DID, rev, and commit CID for all repos hosted by this service. Does not require auth; implemented by PDS and Relay."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | ComAtprotoSyncListReposRepo fromRequest: aDictionary withClient: self ]
		stream: (self paginatedQueryOn: 'com.atproto.sync.listRepos' parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncNotifyOfUpdateHostname: hostname [
	"Notify a crawling service of a recent update, and that crawling should resume. Intended use is after a gap between repo stream events caused the crawling service to disconnect. Does not require auth; implemented by Relay."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.sync.notifyOfUpdate'
				withBody: {'hostname' -> hostname} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoSyncRequestCrawlHostname: hostname [
	"Request a service to persistently crawl hosted repos. Expected use is new PDS instances declaring their existence to Relays. Does not require auth."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.sync.requestCrawl'
				withBody: {'hostname' -> hostname} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoTempAddReservedHandleHandle: handle [
	"Add a handle to the set of reserved handles."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.temp.addReservedHandle'
				withBody: {'handle' -> handle} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoTempCheckSignupQueue [
	"Check accounts location in signup queue."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'activated' -> [ :aValue | aValue ].
				'placeInQueue' -> [ :aValue | aValue ].
				'estimatedTimeMs' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'com.atproto.temp.checkSignupQueue'
				parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoTempFetchLabelsSince: since [
	"DEPRECATED: use queryLabels or subscribeLabels instead -- Fetch all labels from a labeler created after a certain date."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'labels' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'com.atproto.temp.fetchLabels'
				parameters: {'since' -> since} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> comAtprotoTempRequestPhoneVerificationPhoneNumber: phoneNumber [
	"Request a verification code to be sent to the supplied phone number"

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'com.atproto.temp.requestPhoneVerification'
				withBody: {'phoneNumber' -> phoneNumber} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> toolsOzoneCommunicationCreateTemplateName: name contentMarkdown: contentMarkdown subject: subject lang: lang createdBy: createdBy [
	"Administrative action to create a new, re-usable communication (email for now) template."

	<xrpcProcedure>
	^ ToolsOzoneCommunicationDefsTemplateView
		fromRequest: (self
				procedureOn: 'tools.ozone.communication.createTemplate'
				withBody: {'name' -> name.
						'contentMarkdown' -> contentMarkdown.
						'subject' -> subject.
						'lang' -> lang.
						'createdBy' -> createdBy} asDictionary)
		withClient: self
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> toolsOzoneCommunicationDeleteTemplateId: id [
	"Delete a communication template."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'tools.ozone.communication.deleteTemplate'
				withBody: {'id' -> id} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> toolsOzoneCommunicationListTemplates [
	"Get list of all communication templates."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'communicationTemplates' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'tools.ozone.communication.listTemplates'
				parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> toolsOzoneCommunicationUpdateTemplateId: id name: name lang: lang contentMarkdown: contentMarkdown subject: subject updatedBy: updatedBy disabled: disabled [
	"Administrative action to update an existing communication template. Allows passing partial fields to patch specific fields only."

	<xrpcProcedure>
	^ ToolsOzoneCommunicationDefsTemplateView
		fromRequest: (self
				procedureOn: 'tools.ozone.communication.updateTemplate'
				withBody: {'id' -> id.
						'name' -> name.
						'lang' -> lang.
						'contentMarkdown' -> contentMarkdown.
						'subject' -> subject.
						'updatedBy' -> updatedBy.
						'disabled' -> disabled} asDictionary)
		withClient: self
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> toolsOzoneModerationEmitEventEvent: event subject: subject subjectBlobCids: subjectBlobCids createdBy: createdBy [
	"Take a moderation action on an actor."

	<xrpcProcedure>
	^ ToolsOzoneModerationDefsModEventView
		fromRequest: (self
				procedureOn: 'tools.ozone.moderation.emitEvent'
				withBody: {'event' -> event.
						'subject' -> subject.
						'subjectBlobCids' -> subjectBlobCids.
						'createdBy' -> createdBy} asDictionary)
		withClient: self
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> toolsOzoneModerationGetEventId: id [
	"Get details about a moderation event."

	<xrpcQuery>
	^ ToolsOzoneModerationDefsModEventViewDetail
		fromRequest: (self
				queryOn: 'tools.ozone.moderation.getEvent'
				parameters: {'id' -> id} asDictionary)
		withClient: self
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> toolsOzoneModerationGetRecordUri: uri cid: cid [
	"Get details about a record."

	<xrpcQuery>
	^ ToolsOzoneModerationDefsRecordViewDetail
		fromRequest: (self
				queryOn: 'tools.ozone.moderation.getRecord'
				parameters: {'uri' -> uri.
						'cid' -> cid} asDictionary)
		withClient: self
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> toolsOzoneModerationGetRecordsUris: uris [
	"Get details about some records."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'records' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'tools.ozone.moderation.getRecords'
				parameters: {'uris' -> uris} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> toolsOzoneModerationGetRepoDid: did [
	"Get details about a repository."

	<xrpcQuery>
	^ ToolsOzoneModerationDefsRepoViewDetail
		fromRequest: (self
				queryOn: 'tools.ozone.moderation.getRepo'
				parameters: {'did' -> did} asDictionary)
		withClient: self
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> toolsOzoneModerationGetReposDids: dids [
	"Get details about some repositories."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'repos' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'tools.ozone.moderation.getRepos'
				parameters: {'dids' -> dids} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> toolsOzoneModerationSearchReposTerm: term q: q [
	"Find repositories based on a search term."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | ToolsOzoneModerationDefsRepoView fromRequest: aDictionary withClient: self ]
		stream: (self
				paginatedQueryOn: 'tools.ozone.moderation.searchRepos'
				parameters: {'term' -> term.
						'q' -> q} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> toolsOzoneServerGetConfig [
	"Get details about ozone's server configuration."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'appview'
					-> [ :aValue | ToolsOzoneServerGetConfigServiceConfig fromRequest: aValue withClient: self ].
				'pds'
					-> [ :aValue | ToolsOzoneServerGetConfigServiceConfig fromRequest: aValue withClient: self ].
				'blobDivert'
					-> [ :aValue | ToolsOzoneServerGetConfigServiceConfig fromRequest: aValue withClient: self ].
				'chat'
					-> [ :aValue | ToolsOzoneServerGetConfigServiceConfig fromRequest: aValue withClient: self ].
				'viewer'
					-> [ :aValue | ToolsOzoneServerGetConfigViewerConfig fromRequest: aValue withClient: self ]}
				asDictionary
		andRequest: (self
				queryOn: 'tools.ozone.server.getConfig'
				parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> toolsOzoneSetAddValuesName: name values: values [
	"Add values to a specific set. Attempting to add values to a set that does not exist will result in an error."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'tools.ozone.set.addValues'
				withBody: {'name' -> name.
						'values' -> values} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> toolsOzoneSetDeleteSetName: name [
	"Delete an entire set. Attempting to delete a set that does not exist will result in an error."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'tools.ozone.set.deleteSet'
				withBody: {'name' -> name} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> toolsOzoneSetDeleteValuesName: name values: values [
	"Delete values from a specific set. Attempting to delete values that are not in the set will not result in an error"

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'tools.ozone.set.deleteValues'
				withBody: {'name' -> name.
						'values' -> values} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> toolsOzoneSetGetValuesName: name [
	"Get a specific set and its values"

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'values'
					-> (GtApRequestStreamResolver new block: [ :aDictionary | aDictionary ]).
				'set'
					-> [ :aValue | ToolsOzoneSetDefsSetView fromRequest: aValue withClient: self ].
				'cursor' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				paginatedQueryOn: 'tools.ozone.set.getValues'
				parameters: {'name' -> name} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> toolsOzoneSetQuerySetsnamePrefix: namePrefix sortBy: sortBy sortDirection: sortDirection [
	"Query available sets"

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | ToolsOzoneSetDefsSetView fromRequest: aDictionary withClient: self ]
		stream: (self
				paginatedQueryOn: 'tools.ozone.set.querySets'
				parameters: {'namePrefix' -> namePrefix.
						'sortBy' -> sortBy.
						'sortDirection' -> sortDirection} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> toolsOzoneSetUpsertSetName: name description: description [
	"Create or update set metadata"

	<xrpcProcedure>
	^ ToolsOzoneSetDefsSetView
		fromRequest: (self
				procedureOn: 'tools.ozone.set.upsertSet'
				withBody: {'name' -> name.
						'description' -> description} asDictionary)
		withClient: self
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> toolsOzoneSettingListOptionsscope: scope prefix: prefix keys: keys [
	"List settings with optional filtering"

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | ToolsOzoneSettingDefsOption fromRequest: aDictionary withClient: self ]
		stream: (self
				paginatedQueryOn: 'tools.ozone.setting.listOptions'
				parameters: {'scope' -> scope.
						'prefix' -> prefix.
						'keys' -> keys} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> toolsOzoneSettingRemoveOptionsKeys: keys scope: scope [
	"Delete settings by key"

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'tools.ozone.setting.removeOptions'
				withBody: {'keys' -> keys.
						'scope' -> scope} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> toolsOzoneSettingUpsertOptionKey: key scope: scope value: value description: description managerRole: managerRole [
	"Create or update setting option"

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {'option'
					-> [ :aValue | ToolsOzoneSettingDefsOption fromRequest: aValue withClient: self ]}
				asDictionary
		andRequest: (self
				procedureOn: 'tools.ozone.setting.upsertOption'
				withBody: {'key' -> key.
						'scope' -> scope.
						'value' -> value.
						'description' -> description.
						'managerRole' -> managerRole} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> toolsOzoneSignatureFindCorrelationDids: dids [
	"Find all correlated threat signatures between 2 or more accounts."

	<xrpcQuery>
	^ GtApRequestResolver
		from: {'details' -> [ :aValue | aValue ]} asDictionary
		andRequest: (self
				queryOn: 'tools.ozone.signature.findCorrelation'
				parameters: {'dids' -> dids} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> toolsOzoneSignatureFindRelatedAccountsDid: did [
	"Get accounts that share some matching threat signatures with the root account."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | 
			ToolsOzoneSignatureFindRelatedAccountsRelatedAccount
				fromRequest: aDictionary
				withClient: self ]
		stream: (self
				paginatedQueryOn: 'tools.ozone.signature.findRelatedAccounts'
				parameters: {'did' -> did} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> toolsOzoneSignatureSearchAccountsValues: values [
	"Search for accounts that match one or more threat signature values."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | ComAtprotoAdminDefsAccountView fromRequest: aDictionary withClient: self ]
		stream: (self
				paginatedQueryOn: 'tools.ozone.signature.searchAccounts'
				parameters: {'values' -> values} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> toolsOzoneTeamAddMemberDid: did role: role [
	"Add a member to the ozone team. Requires admin role."

	<xrpcProcedure>
	^ ToolsOzoneTeamDefsMember
		fromRequest: (self
				procedureOn: 'tools.ozone.team.addMember'
				withBody: {'did' -> did.
						'role' -> role} asDictionary)
		withClient: self
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> toolsOzoneTeamDeleteMemberDid: did [
	"Delete a member from ozone team. Requires admin role."

	<xrpcProcedure>
	^ GtApRequestResolver
		from: {} asDictionary
		andRequest: (self
				procedureOn: 'tools.ozone.team.deleteMember'
				withBody: {'did' -> did} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> toolsOzoneTeamListMembers [
	"List all members with access to the ozone service."

	<xrpcQuery>
	^ AsyncMapStream
		mapBlock: [ :aDictionary | ToolsOzoneTeamDefsMember fromRequest: aDictionary withClient: self ]
		stream: (self
				paginatedQueryOn: 'tools.ozone.team.listMembers'
				parameters: {} asDictionary)
]

{ #category : #'*Gt4AtProtoGeneratedCode' }
GtApGeneratedClient >> toolsOzoneTeamUpdateMemberDid: did disabled: disabled role: role [
	"Update a member in the ozone service. Requires admin role."

	<xrpcProcedure>
	^ ToolsOzoneTeamDefsMember
		fromRequest: (self
				procedureOn: 'tools.ozone.team.updateMember'
				withBody: {'did' -> did.
						'disabled' -> disabled.
						'role' -> role} asDictionary)
		withClient: self
]
