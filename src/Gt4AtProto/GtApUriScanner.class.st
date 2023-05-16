Class {
	#name : #GtApUriScanner,
	#superclass : #SmaCCScanner,
	#category : #'Gt4AtProto-URI'
}

{ #category : #generated }
GtApUriScanner >> emptySymbolTokenId [
	^ 20
]

{ #category : #generated }
GtApUriScanner >> errorTokenId [
	^ 21
]

{ #category : #generated }
GtApUriScanner >> scan1 [
	self step.
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter between: $a and: $z ] ])
		ifTrue: [ self step.
			((currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter between: $a and: $z ] ])
				ifTrue: [ [ self recordMatch: #(8).
					self step.
					currentCharacter == $% ifTrue: [ ^ self scan1 ].
					(currentCharacter between: $- and: $.)
						or: [ (currentCharacter between: $0 and: $9)
								or: [ (currentCharacter between: $A and: $Z)
										or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ] ]
						whileTrue ] ].
	^ self reportLastMatch
]

{ #category : #generated }
GtApUriScanner >> scan2 [
	[ self recordMatch: #(8 9 10).
	self step.
	currentCharacter == $% ifTrue: [ ^ self scan1 ].
	('#?' includes: currentCharacter)
		ifTrue: [ [ self recordMatch: #(10).
			self step.
			currentCharacter == $#
				or: [ (currentCharacter between: $- and: $.)
						or: [ (currentCharacter between: $0 and: $9)
								or: [ currentCharacter == $?
										or: [ (currentCharacter between: $A and: $Z)
												or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ] ] ] ]
				whileTrue.
			^ self reportLastMatch ].
	(currentCharacter between: $- and: $.)
		or: [ (currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ] ]
		whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
GtApUriScanner >> scan3 [
	[ self recordMatch: #(8 9 10 11).
	self step.
	currentCharacter == $% ifTrue: [ ^ self scan1 ].
	('#?' includes: currentCharacter)
		ifTrue: [ [ self recordMatch: #(10).
			self step.
			currentCharacter == $#
				or: [ (currentCharacter between: $- and: $.)
						or: [ (currentCharacter between: $0 and: $9)
								or: [ currentCharacter == $?
										or: [ (currentCharacter between: $A and: $Z)
												or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ] ] ] ]
				whileTrue.
			^ self reportLastMatch ].
	('._' includes: currentCharacter) ifTrue: [ ^ self scan2 ].
	currentCharacter == $-
		or: [ (currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter between: $a and: $z ] ] ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
GtApUriScanner >> scan4 [
	[ self recordMatch: #(7 8 9 10 11).
	self step.
	currentCharacter == $% ifTrue: [ ^ self scan1 ].
	currentCharacter == $- ifTrue: [ ^ self scan3 ].
	('#?' includes: currentCharacter)
		ifTrue: [ [ self recordMatch: #(10).
			self step.
			currentCharacter == $#
				or: [ (currentCharacter between: $- and: $.)
						or: [ (currentCharacter between: $0 and: $9)
								or: [ currentCharacter == $?
										or: [ (currentCharacter between: $A and: $Z)
												or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ] ] ] ]
				whileTrue.
			^ self reportLastMatch ].
	('._' includes: currentCharacter) ifTrue: [ ^ self scan2 ].
	(currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter between: $a and: $z ] ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
GtApUriScanner >> scanForToken [
	self step.
	currentCharacter == $# ifTrue: [ ^ self scanForTokenX5 ].
	currentCharacter == $% ifTrue: [ ^ self scan1 ].
	currentCharacter == $. ifTrue: [ ^ self scanForTokenX4 ].
	currentCharacter == $/ ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter == $: ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	currentCharacter == $? ifTrue: [ ^ self scanForTokenX7 ].
	currentCharacter == $a ifTrue: [ ^ self scanForTokenX1 ].
	currentCharacter == $d ifTrue: [ ^ self scanForTokenX2 ].
	^ self scanForTokenX8
]

{ #category : #generated }
GtApUriScanner >> scanForTokenX1 [
	self recordMatch: #(7 8 9 10).
	self step.
	currentCharacter == $% ifTrue: [ ^ self scan1 ].
	currentCharacter == $- ifTrue: [ ^ self scan3 ].
	currentCharacter == $t
		ifTrue: [ self recordMatch: #(7 8 9 10 11).
			self step.
			currentCharacter == $% ifTrue: [ ^ self scan1 ].
			currentCharacter == $- ifTrue: [ ^ self scan3 ].
			currentCharacter == $: ifTrue: [ ^ self scanForTokenX1X2 ] ].
	('#?' includes: currentCharacter) ifTrue: [ ^ self scanForTokenX1X1 ].
	('._' includes: currentCharacter) ifTrue: [ ^ self scan2 ].
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter between: $a and: $z ] ]) ifTrue: [ ^ self scan4 ].
	^ self reportLastMatch
]

{ #category : #generated }
GtApUriScanner >> scanForTokenX1X1 [
	[ self recordMatch: #(10).
	self step.
	currentCharacter == $#
		or: [ (currentCharacter between: $- and: $.)
				or: [ (currentCharacter between: $0 and: $9)
						or: [ currentCharacter == $?
								or: [ (currentCharacter between: $A and: $Z)
										or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ] ] ] ]
		whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
GtApUriScanner >> scanForTokenX1X2 [
	(self scanForString: '//') ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	^ self reportLastMatch
]

{ #category : #generated }
GtApUriScanner >> scanForTokenX2 [
	self recordMatch: #(7 8 9 10).
	self step.
	currentCharacter == $% ifTrue: [ ^ self scan1 ].
	currentCharacter == $- ifTrue: [ ^ self scan3 ].
	currentCharacter == $i
		ifTrue: [ self recordMatch: #(7 8 9 10 11).
			self step.
			currentCharacter == $% ifTrue: [ ^ self scan1 ].
			currentCharacter == $- ifTrue: [ ^ self scan3 ].
			currentCharacter == $d
				ifTrue: [ self recordMatch: #(7 8 9 10 11).
					self step.
					currentCharacter == $% ifTrue: [ ^ self scan1 ].
					currentCharacter == $- ifTrue: [ ^ self scan3 ].
					currentCharacter == $: ifTrue: [ ^ self recordAndReportMatch: #(6) ] ] ].
	('#?' includes: currentCharacter) ifTrue: [ ^ self scanForTokenX2X1 ].
	('._' includes: currentCharacter) ifTrue: [ ^ self scan2 ].
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter between: $a and: $z ] ]) ifTrue: [ ^ self scan4 ].
	^ self reportLastMatch
]

{ #category : #generated }
GtApUriScanner >> scanForTokenX2X1 [
	[ self recordMatch: #(10).
	self step.
	currentCharacter == $#
		or: [ (currentCharacter between: $- and: $.)
				or: [ (currentCharacter between: $0 and: $9)
						or: [ currentCharacter == $?
								or: [ (currentCharacter between: $A and: $Z)
										or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ] ] ] ]
		whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
GtApUriScanner >> scanForTokenX3 [
	[ self recordMatch: #(7 8 9 10).
	self step.
	currentCharacter == $% ifTrue: [ ^ self scan1 ].
	('#?' includes: currentCharacter)
		ifTrue: [ [ self recordMatch: #(10).
			self step.
			currentCharacter == $#
				or: [ (currentCharacter between: $- and: $.)
						or: [ (currentCharacter between: $0 and: $9)
								or: [ currentCharacter == $?
										or: [ (currentCharacter between: $A and: $Z)
												or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ] ] ] ]
				whileTrue.
			^ self reportLastMatch ].
	((currentCharacter between: $- and: $.) or: [ currentCharacter == $_ ])
		ifTrue: [ ^ self scan2 ].
	(currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter between: $a and: $z ] ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
GtApUriScanner >> scanForTokenX4 [
	self recordMatch: #(2 8 9 10).
	self step.
	currentCharacter == $% ifTrue: [ ^ self scan1 ].
	('#?' includes: currentCharacter)
		ifTrue: [ [ self recordMatch: #(10).
			self step.
			currentCharacter == $#
				or: [ (currentCharacter between: $- and: $.)
						or: [ (currentCharacter between: $0 and: $9)
								or: [ currentCharacter == $?
										or: [ (currentCharacter between: $A and: $Z)
												or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ] ] ] ]
				whileTrue.
			^ self reportLastMatch ].
	((currentCharacter between: $- and: $.)
		or: [ (currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ])
		ifTrue: [ ^ self scan2 ].
	^ self reportLastMatch
]

{ #category : #generated }
GtApUriScanner >> scanForTokenX5 [
	self recordMatch: #(1 10).
	self step.
	(currentCharacter == $#
		or: [ (currentCharacter between: $- and: $.)
				or: [ (currentCharacter between: $0 and: $9)
						or: [ currentCharacter == $?
								or: [ (currentCharacter between: $A and: $Z)
										or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ] ] ])
		ifTrue: [ [ self recordMatch: #(10).
			self step.
			currentCharacter == $#
				or: [ (currentCharacter between: $- and: $.)
						or: [ (currentCharacter between: $0 and: $9)
								or: [ currentCharacter == $?
										or: [ (currentCharacter between: $A and: $Z)
												or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
GtApUriScanner >> scanForTokenX6 [
	[ self recordMatch: #(10).
	self step.
	currentCharacter == $#
		or: [ (currentCharacter between: $- and: $.)
				or: [ (currentCharacter between: $0 and: $9)
						or: [ currentCharacter == $?
								or: [ (currentCharacter between: $A and: $Z)
										or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ] ] ] ]
		whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
GtApUriScanner >> scanForTokenX7 [
	[ self recordMatch: #(10).
	self step.
	currentCharacter == $#
		or: [ (currentCharacter between: $- and: $.)
				or: [ (currentCharacter between: $0 and: $9)
						or: [ currentCharacter == $?
								or: [ (currentCharacter between: $A and: $Z)
										or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ] ] ] ]
		whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
GtApUriScanner >> scanForTokenX8 [
	currentCharacter isDigit ifTrue: [ ^ self scanForTokenX3 ].
	('-_' includes: currentCharacter) ifTrue: [ ^ self scan2 ].
	((currentCharacter between: $A and: $Z)
		or: [ currentCharacter between: $b and: $z ])
		ifTrue: [ self recordMatch: #(7 8 9 10).
			self step.
			currentCharacter == $% ifTrue: [ ^ self scan1 ].
			currentCharacter == $- ifTrue: [ ^ self scan3 ].
			('#?' includes: currentCharacter) ifTrue: [ ^ self scanForTokenX6 ].
			('._' includes: currentCharacter) ifTrue: [ ^ self scan2 ].
			((currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter between: $a and: $z ] ]) ifTrue: [ ^ self scan4 ] ].
	^ self reportLastMatch
]
