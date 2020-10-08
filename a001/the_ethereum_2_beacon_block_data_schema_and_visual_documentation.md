# The Ethereum 2.0 Beacon Block: A Data Schema and Visual Documentation

Gurdal Ertek and Joseph Kholodenko
UAE University, Al Ain, UAE
...., New York, NY

> "When I came up with Ethereum, my first first thought was, 'Okay, this thing is too good to be true.' As it turned out, the core Ethereum idea was good - fundamentally, completely sound." Vitalik Buterin

**Summary:** Ethereum 2.0 is the new version of the Ethereum blockchain, where consensus (agreement of which data and blocks will be added) is to be achieved through proof-of-stake (PoS). 
Coordination of consensus and many other processes in Ethereum 2.0 will be carried out by a chain referred to as the "beacon chain".
There exists numerous comprehensive technical documentations of Ethereum 2.0 and the beacon chain. 
This article presents interactive visualizations and sample data to facilitate the understanding of data in the Beacon block.


## Ethereum and Ethereum 2.0
Ethereum is the first [triple-entry ledger system](https://hackernoon.com/why-everyone-missed-the-most-important-invention-in-the-last-500-years-c90b0151c169) in human history to serve as an enabling platform for smart contracts and decentralized applications (dapps).
Ethereum 1.0, the Ethereum blockchain that achieves consensus through proof-of-work (PoW), is already the second most powerful computing platform on the face of earth.
The Ethereum Community and the Ethereum Foundation envison things to become much bigger. Exponentially bigger.

Yet, there is a roadblock. 
Ethereum 1.0 is also limited by the very PoW consensus protocol that makes it so much reliable and -almost unbreakably- robust: 
As of October 2020, the time of this article being written, transactions fees on the Ethereum blockchain network have become substantially higher than before, even doubling at one point the previous all-time-high (ATH) costs.
The bottleneck is the proof-of-work (PoW) protocol.

An existentially inevitable milestone in Ethereum's journey to become ["The Infinite Machine"](https://www.amazon.com/Infinite-Machine-Crypto-Hackers-Building-Internet/dp/B07XJ7WKXL/ref=sr_1_1?dchild=1&keywords=infinite+machine&qid=1602161947&s=books&sr=1-1) 
is Ethereum's version 2.0, , i.e, Ethereum 2.0. 
Upon the completion of the three Phases of Ethereum 2.0, namely Phase 0, Phase 1, and Phase 2, Ethereum blockchain will be fully functional without any dependence to any other "Layer 2" solution.

The focus of this article is the Beacon Block, a block on the beacon chain of Ethereum 2.0, which is to be introduced in Phase 0. 
Beacon chain is at the center of the Ethereum 2.0 network. Understanding the beacon chain is a critical step for any organization, team, or individual who plans to develop applications on Ethereum 2.0 or interact with it at code level.
Specifically, the article holds the magnifier on the beacon chain block, 

As of October 2020, Ethereum 2.0 is being tested on the Medalla testnet, which is to run for about three months, as well as other testnets that run over few days.


## Beacon Chain and Beacon Block

http://grabcad.com/....
Figure. Interactive 3D visualization of chains and sharding in Ethereum 2.0.

How to View: Click the "Load in 3D Viewer" link to view the visualization in 3D. 
Then click towards the middle of the 3D visualization and drag to the left and right, and then up and down to obtain the angle you wish to view from.
Click the plus (+) and minus (-) buttons on the right hand side of the window to zoom and unzoom.

The Beacon chain can be thought of "the chain that rules them all", it is the chain within Ethereum 2.0 which is central to the system and its processes. 
As analogy, similar to how the spine of a human connects and holds together the body, the beacon chain will connect and hold together the many chains in Ethereum 2.0. 
Yet, unlike the spine of a human, which remains static, the beacon chain will over epochs of time, together with the other chains and components of the system.

Beacon chain is the focus and the ultimate deliverable of Phase 0 of Ethereum 2.0. In the latter Phases 1 and 2, other components of the system will be added. 
Yet, for other systems to operate successfully and integrate to the whole, the Beacon chain must be functioning flawlessly.

When Ethereum 2.0 becomes fully active, Beacon chain will perform the following critical functions:


## Medalla Testnet
Medalla is the final long-lasting testnet of Ethereum 2.0 Phase 0. 

The data schema that we present here represents the data that can be retrieved by Lighthose https API (https://lighthouse-book.sigmaprime.io/http.html). 
While the Lighthouse API allows the retrieval of an extensive array of data, our focus in this article is the /beacon/block/ endpoint (https://lighthouse-book.sigmaprime.io/http/beacon.html#beaconblock).
The Lighthouse API documentation also provides sample data, yet sample data is not complete for all the fields and data types.
A useful information available in our diagram is the parsing of the data in /beacon/block/ into tables of a relational database. 
The database schema also provides the data types for MySQL (https://www.javatpoint.com/sql-data-types#:~:text=SQL%20Data%20Types%201%20String%20Data%20types%202,Data%20types%203%20Date%20and%20time%20Data%20types), 
the key attributes of each table, and the foreign keys that relate the tables to each other.
For the sake of simplicity, all bigint data types of Ethereum 2.0 have been represented as INT(255) and all hash strings -while many of them require much less memory- have been represented as TINYTEXT.

## Beacon Block Data Schema

https://dbdiagram.io/d/5f6653cb7da1ea736e2e8295
Figure. Interactive data schema diagram (dbdiagram) for Ethereum 2.0 Beacon Block. 

The data schema visualization is interactive and is especially ideal for exploring the relations between the tables through foreign keys. 

How to View & Interact: Simply hold your mouse cursor over any connecting line. This will show the two fields at both ends of the relation. 
Use zooming feature and click and drag to focus on different areas of the diagram.

The next visualization is a zoomable presentation, which shows different groups of related tables as a part of the whole. 
This presentation can help understand better the different groups of tables and the data fields in each table.

How to View & Interact: Click on the play button in the intro screen. Then click the forward and back buttons at the bottom of the presentation. 
At any time, to return back to the main window, move the mouse cursor towards the middle right of the window, inside black area, until you see two buttons. 
Then, click the arrow button to return to main window.

https://prezi.com/p/z5sf3nyicten/?present=1
Figure. Zoomable data schema diagram with sample data. 

## Data Tables and Fields within Beacon Block

### Beacon Block 

``` DBML 
...
```

https://www.dbml.org/docs/

### Proposer Slashings

### Attester Slashings

### Attestations

### Deposits

### Voluntary Exits

## 
``` 
SELECT * FROM mytable;
```
