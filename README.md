# Glamorous Toolkit for AT Protocol
This is an environment for [AT Protocol](https://atproto.com) built in [Glamorous Toolkit (GT)](https://gtoolkit.com).

GT is the moldable development environment through which we can construct dedicated experiences. This specific project offers such a dedicated experience for the AT Protocol.

It covers several things at different levels of abstraction.
- Creating posts and threads from inside the knowledge management system.
- Working with a server through AT Protocol.
- Streaming and pagination support out of the box.
- Inspecting and visualizing results.
- Code generation from lexicons to Smalltalk code.
- Dedicated styling and completion support for exploring and editing lexicon JSON files.

[Read the announcement blog post.](https://lepiter.io/feenk/gt4atproto--a-dedicated-environment-for-at-7kcp8pwy6dcnomlljmtvl3wx2/)
## Installation
To install, [download GT](https://gtoolkit.com/download) for your platform, open a playground and execute the following script:
```
Metacello new
	repository: 'github://feenkcom/gt4atproto:main/src';
	baseline: 'Gt4AtProto';
	load.
#BaselineOfGt4AtProto asClass loadLepiter
```

This will load the code specific for AT Protocol, and the associated knowledge base.
