# The Ethereum 2.0 Beacon Block: A Data Schema and Visual Documentation

Gurdal Ertek and Joseph Kholodenko
UAE University, Al Ain, UAE
...., New York, NY

> *"When I came up with Ethereum, my first first thought was, 'Okay, this thing is too good to be true.' As it turned out, the core Ethereum idea was good - fundamentally, completely sound."* ***Vitalik Buterin***

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

The data schema that we present here represents the data that can be retrieved by [Lighthose https API](https://lighthouse-book.sigmaprime.io/http.html). 
While the Lighthouse API allows the retrieval of an extensive array of data, our focus in this article is the ['/beacon/block/ endpoint'](https://lighthouse-book.sigmaprime.io/http/beacon.html#beaconblock).
The Lighthouse API documentation also provides sample data, yet sample data is not complete for all the fields and data types.
A useful information available in our diagram is the parsing of the data in /beacon/block/ into tables of a relational database. 
The database schema also provides the [data types for MySQL](https://www.javatpoint.com/sql-data-types#:~:text=SQL%20Data%20Types%201%20String%20Data%20types%202,Data%20types%203%20Date%20and%20time%20Data%20types), 
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

``` yaml 
   {
        "root": "0x2d424c3838d2b49d9c8da4e8297471f375b872ea4b250a75127e89175b44ba70",
        "beacon_block": {
            "message": {
                "slot": 139,
                "proposer_index": 2185,
                "parent_root": "0x19c7252f6150f964fa62cc94e7ff9df79b74c552bf3d134b1f7a317c01662c1d",
                "state_root": "0xb9739996c890b47251eecab6643b7400ff992bf76ed75b26f0b04146ea4cd640",
                "body": {
                    "randao_reveal": "0x820574e5514420659826e18b183d7d0478389bce4a08464427168c97e67884c5d38839675313688d4ada52259becb1a40b8ee7ccaf983c9ae56d69c0000a7114006c6bb640a515075b7610b8bdf21506d4146787550ddd89a5ed8956ce470bb6",
                    "eth1_data": {
                        "deposit_root": "0x53d90f778f975dcca3f30e072b5c1a85cfd7a1b977b78620d94f143d06432f9b",
                        "deposit_count": 22637,
                        "block_hash": "0xe0c057333355956e8fb8d88382f5676bbe083fbf8b978f0db719b4d02ae70777"
                    },
                    "graffiti": "0x53746566616e2333393137000000000000000000000000000000000000000000",
                    "proposer_slashings": [...],
                    "attester_slashings": [],
                    "attestations": [],
                    "deposits": [],
                    "voluntary_exits": []
                }
            },
            "signature": "0xaa4bba19b1c185002f446cc79e24bcf917808569394669b4fea9b855f2f49e6f76c2408384d8ded3d151ed5ab238951a137a777958525bdf58c6fa75d6418ae4f5e67177747040919f81a86a1065355b2d1abb1553bc94630a6c06e4a67e5fe4"
        }
    }
```

https://www.dbml.org/docs/

### Proposer Slashings


``` JSON 
                    "proposer_slashings": [
                        {
                            "signed_header_1": {
                                "message": {
                                    "slot": 138,
                                    "proposer_index": 2329,
                                    "parent_root": "0x9ad72edd1303a10d292bf8ad84360d30b309a85fd0ee9f4143821f5a3ec01da1",
                                    "state_root": "0x1b067135c44e9b472608a58499f7e13561dbc0f4fd9ae3ebd9f6ddae298cebbe",
                                    "body_root": "0xa9905d68bfe2f4bde96020c4a5b66b62ef575b8c5096bbf5d042ee4795f13f80"
                                },
                                "signature": "0xa5e55750045079ee500ce6176c3ea83ae1ceb415357e6019a43641cf15a961bc7cc799923a1b0d019be0a6c6138b89e7025a57cedabbd262ceefe44931052b083e99d92624a91ace8f16acd6647f7234391df2e3e3f77a68816072793e8a718d"
                            },
                            "signed_header_2": {
                                "message": {
                                    "slot": 138,
                                    "proposer_index": 2329,
                                    "parent_root": "0x9ad72edd1303a10d292bf8ad84360d30b309a85fd0ee9f4143821f5a3ec01da1",
                                    "state_root": "0x0ea91fc990d9a0c2b5195c6e32d734d267f6c768c026d5205fce1a2df2fbe902",
                                    "body_root": "0xb416fb23f89604c7191b1502f6b6f20776e2f42093b44f2a1907f1ed3294ea19"
                                },
                                "signature": "0xa87f4a50ed559d883b163d2b2a12db4467b7331cdd2ec0b52460bb69485191254dd84837034a698ed38dd4fdb63f203402796d7e354025cd5f57b0efaae9e34d90cb04ef46e72cd772afd9d8b1f9effe6cbabca78197fb8fa02a2492e2a2d5b4"
                            }
                        }
                    ],
```

### Attester Slashings

``` JSON 

``` 

### Attestations

``` JSON 

``` 

### Deposits

``` JSON 

``` 

### Voluntary Exits

``` JSON 

``` 

## 

``` JSON 

``` 