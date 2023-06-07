Class {
	#name : #LeBlueskySpotterStart,
	#superclass : #Object,
	#category : #'Gt4Bluesky-Spotter'
}

{ #category : #accessing }
LeBlueskySpotterStart >> fileReferencesBy: aSelector inContext: aSpotterContext [
	^ ((aSpotterContext searchQuery asAsyncFuture asAsyncStream collect: #trimBoth)
		collect: [ :aQuery | 
			| lastDelimiter |
			lastDelimiter := aQuery
					findLastOccurrenceOfString: FileSystem disk delimiter asString
					startingAt: 1.

			lastDelimiter isZero
				ifTrue: [ AsyncEmptyStream new ]
				ifFalse: [ | rootDirectory allItems |
					rootDirectory := (aQuery copyFrom: 1 to: lastDelimiter) asFileReference.
					rootDirectory exists
						ifFalse: [ AsyncEmptyStream new ]
						ifTrue: [ allItems := (rootDirectory perform: aSelector) asAsyncStream.
							lastDelimiter = aQuery size
								ifTrue: [ allItems ]
								ifFalse: [ (GtSpotterSubstringFilterStream
										forStream: allItems
										search: (aQuery copyFrom: lastDelimiter + 1 to: aQuery size))
										itemString: [ :eachFile | eachFile basename ] ] ] ] ]) flatten
]

{ #category : #accessing }
LeBlueskySpotterStart >> gtSearchPagesByTitleFor: aSearch [
	<gtSearch>
	^ aSearch explicit
		title: 'Named pages';
		priority: 22;
		search: [ :aContext | LeDatabasesRegistry defaultLogicalDatabase asyncPagesForWord: aContext searchQuery ];
		itemName: #title;
		wantsToDisplayOnEmptyQuery: false
]

{ #category : #accessing }
LeBlueskySpotterStart >> gtSpotterContainingSubPartsFor: aSearch [
	<gtSearch>
	^ aSearch explicit
		priority: 23;
		title: 'Page contents';
		search: [ :aContext | 
			[ | filter results knowledgeBase |
			results := OrderedCollection new.
			filter := LeSubstringFilter new
					caseSensitive: false;
					query: aContext searchQuery.
			knowledgeBase := LeDatabasesRegistry defaultLogicalDatabase.
			knowledgeBase
				pagesWithNameDo: [ :eachPage | (filter isMatchedItem: eachPage) ifTrue: [ results add: eachPage ] ].
			knowledgeBase
				unnamedPagesDo: [ :eachPage | (filter isMatchedItem: eachPage) ifTrue: [ results add: eachPage ] ].
			results asAsyncStream ] asAsyncFuture asAsyncStream flatten ];
		itemName: #spotterItemName
]

{ #category : #accessing }
LeBlueskySpotterStart >> gtSpotterForDirectoriesFor: aSearch [
	<gtSearch>
	^ aSearch explicit
		priority: 0;
		title: 'Directories';
		search: [ :aContext | self fileReferencesBy: #directories inContext: aContext ]
]

{ #category : #accessing }
LeBlueskySpotterStart >> gtSpotterForFilesFor: aSearch [
	<gtSearch>
	^ aSearch explicit
		priority: 1;
		title: 'Files';
		search: [ :aContext | self fileReferencesBy: #files inContext: aContext ]
]
