Class {
	#name : #GtRBRemoveClassRefactoring,
	#superclass : #RBRemoveClassRefactoring,
	#category : #'Gt4AtProto-Refactorings'
}

{ #category : #accessing }
GtRBRemoveClassRefactoring >> preconditionHasNoUsers: aClassOrTrait [
	^ (RBCondition
		withBlock: [ ((aClassOrTrait realName: aClassOrTrait name) realClass users copyWithoutAll: classNames) isEmpty ])
		errorMacro: aClassOrTrait name , ' Trait is used.<n>Browse classes using it?';
		errorBlock: [ self openBrowserOn: (self environmentWithUsersOf: aClassOrTrait) ];
		yourself
]

{ #category : #accessing }
GtRBRemoveClassRefactoring >> preconditions [

	^ classNames inject: self emptyCondition into: [ :sum :each | 
		  | aClassOrTrait |
		  aClassOrTrait := self model classNamed: each asSymbol.
		  aClassOrTrait ifNil: [ 
			  self refactoringFailure: 'No such class or trait' ].
		  sum & ((self preconditionIsNotMetaclass: aClassOrTrait)
		   & (self preconditionEmptyOrHasNoSubclasses: aClassOrTrait)
		   & (self preconditionHasNoUsers: aClassOrTrait)) ]
]
