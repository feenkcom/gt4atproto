Class {
	#name : #ComAtprotoLabelDefsLabel,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpVer',
		'atpSrc',
		'atpUri',
		'atpCid',
		'atpVal',
		'atpNeg',
		'atpCts',
		'atpExp',
		'atpSig'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoLabelDefsLabel class >> atpDescription [
 ^  'Metadata tag on an atproto resource (eg, repo or record).'
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel class >> atpFile [
 ^ 'com/atproto/label/defs.json'
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel class >> atpRecordName [
 ^ 'com.atproto.label.defs#label'
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel class >> atpSchema [
 ^ '{"type":"object","description":"Metadata tag on an atproto resource (eg, repo or record).","required":["src","uri","val","cts"],"properties":{"ver":{"type":"integer","description":"The AT Protocol version of the label object."},"src":{"type":"string","format":"did","description":"DID of the actor who created this label."},"uri":{"type":"string","format":"uri","description":"AT URI of the record, repository (account), or other resource that this label applies to."},"cid":{"type":"string","format":"cid","description":"Optionally, CID specifying the specific version of ''uri'' resource this label applies to."},"val":{"type":"string","maxLength":128,"description":"The short string name of the value or type of this label."},"neg":{"type":"boolean","description":"If true, this is a negation label, overwriting a previous label."},"cts":{"type":"string","format":"datetime","description":"Timestamp when this label was created."},"exp":{"type":"string","format":"datetime","description":"Timestamp at which this label expires (no longer applies)."},"sig":{"type":"bytes","description":"Signature of dag-cbor encoded label."}}}'
]

{ #category : #serialization }
ComAtprotoLabelDefsLabel class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpVer: (aRequest at: 'ver' ifAbsent: [ nil ]);
		atpSrc: (aRequest at: 'src' ifAbsent: [ nil ]);
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ]);
		atpCid: (aRequest at: 'cid' ifAbsent: [ nil ]);
		atpVal: (aRequest at: 'val' ifAbsent: [ nil ]);
		atpNeg: (aRequest at: 'neg' ifAbsent: [ nil ]);
		atpCts: (aRequest at: 'cts' ifAbsent: [ nil ]);
		atpExp: (aRequest at: 'exp' ifAbsent: [ nil ]);
		atpSig: (aRequest at: 'sig' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atpCid [
	<atpType:#String format:'cid'>
	^ atpCid
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atpCid: anObject [
	atpCid := anObject
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atpCts [
	<atpType:#String format:'datetime'>
	^ atpCts
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atpCts: anObject [
	atpCts := anObject
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atpExp [
	<atpType:#String format:'datetime'>
	^ atpExp
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atpExp: anObject [
	atpExp := anObject
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atpNeg [
	<atpType:#Boolean format:nil>
	^ atpNeg
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atpNeg: anObject [
	atpNeg := anObject
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atpSig [
	<atpType:#ByteArray format:nil>
	^ atpSig
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atpSig: anObject [
	atpSig := anObject
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atpSrc [
	<atpType:#String format:'did'>
	^ atpSrc
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atpSrc: anObject [
	atpSrc := anObject
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atpUri [
	<atpType:#String format:'uri'>
	^ atpUri
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atpVal [
	<atpType:#String format:nil>
	^ atpVal
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atpVal: anObject [
	atpVal := anObject
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atpVer [
	<atpType:#Number format:nil>
	^ atpVer
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atpVer: anObject [
	atpVer := anObject
]

{ #category : #magritte }
ComAtprotoLabelDefsLabel >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atpCid
]

{ #category : #magritte }
ComAtprotoLabelDefsLabel >> ctsDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cts';
		accessor: #atpCts;
		beRequired
]

{ #category : #magritte }
ComAtprotoLabelDefsLabel >> expDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Exp';
		accessor: #atpExp
]

{ #category : #magritte }
ComAtprotoLabelDefsLabel >> negDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Neg';
		accessor: #atpNeg
]

{ #category : #magritte }
ComAtprotoLabelDefsLabel >> sigDescription [
	<magritteDescription>
	^ MAFileDescription new
		label: 'Sig';
		accessor: #atpSig
]

{ #category : #magritte }
ComAtprotoLabelDefsLabel >> srcDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Src';
		accessor: #atpSrc;
		beRequired
]

{ #category : #magritte }
ComAtprotoLabelDefsLabel >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
		beRequired
]

{ #category : #magritte }
ComAtprotoLabelDefsLabel >> valDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Val';
		accessor: #atpVal;
		beRequired
]

{ #category : #magritte }
ComAtprotoLabelDefsLabel >> verDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Ver';
		accessor: #atpVer
]
