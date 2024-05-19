Class {
	#name : #GtApHomeSection,
	#superclass : #GtHomeMultiCardSection,
	#category : #'Gt4AtProto-UI'
}

{ #category : #accessing }
GtApHomeSection >> lepiterCard [
	<gtSectionCard>
	<gtExample>
	<notest>
	^ GtHomeCard lepiterBaseWithTableOfContents
		title: 'GT for ATProto docs';
		description: 'Read the docs';
		priority: 10;
		pageName: 'About Glamorous Toolkit for AT Protocol';
		databaseName: 'gt4atproto-lepiter';
		details: [ :db | 
			'This knowledge base documents the interactions with the AT Proto protocol and the Bluesky social network.' ]
]
