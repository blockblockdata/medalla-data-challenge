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

``` json 
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
                    "attester_slashings": [],
                    "attestations": [
                        {
                            "aggregation_bits": "0x7398241da819d42d1c2c0f63b02e8ce91887ce1a",
                            "data": {
                                "slot": 128,
                                "index": 0,
                                "beacon_block_root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0xa70a35de0706c7042faedd074a8449e4d62de6ba90bc734de8303308a863467ffc0f2c403b38b3d33f1c853ca50f9c4e0ab1289e94c1be7a336a97e00fd64d59294c3a98c12da3f33b309920988831e4ef137fd7efeba3f5f70e404364a97732"
                        },
                        {
                            "aggregation_bits": "0xeb9f45a9c9e0425dbe85b7860185c63ed795e528",
                            "data": {
                                "slot": 138,
                                "index": 1,
                                "beacon_block_root": "0x19c7252f6150f964fa62cc94e7ff9df79b74c552bf3d134b1f7a317c01662c1d",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0x8ff62c7c3eb60b36997dc482f297a01e4e1b5753cf0d27927e63608e622e19d0b1dfabb988fe272d96bda1d8f80e1073014ef2b73fc6dc0e648e6ccb1e73b21b73c3a386eff3b0d43bfd55e234f3e8cb9839c03d25ece7457a0154adcfdea537"
                        },
                        {
                            "aggregation_bits": "0x0100000000002180000008000000000040000020",
                            "data": {
                                "slot": 137,
                                "index": 2,
                                "beacon_block_root": "0x78a43dfde31e3b0a90153536df886b51b633f0be6cd39f79adb10bc45f5bf2a0",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0x8739df9552eb5ec3b25f36ed9da7d5f25c04c86c549998ee75102503e17279724fdb3750a6ce2f8ffa39c69429c8bb390eba265535287e5f136912416c6224690cd29a3e93704a803480ab307d7bd4e39b0b097a464c47741cced15b6efa056d"
                        },
                        {
                            "aggregation_bits": "0x106008020000000000000010f020008120000025",
                            "data": {
                                "slot": 138,
                                "index": 1,
                                "beacon_block_root": "0xe6f12742a1f9dbf90ee3d8af3b0d1813bdb0037356073f5ccc5e771b6816b16e",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0xae8f6361801c165109c1c1163b21add47df17c80a2785a4dfcccb8dfdf8cbf654a987a107120dbc533054f5e633783171920cd05f9771ce6123bb2e9010fadc193d9f370fad0f6bbcd01489d8ffa4e092f315e01aaa39eac2b81b9fd2790d771"
                        },
                        {
                            "aggregation_bits": "0x89e3ae330684069fe001e32c9f27bb17f7f6e720",
                            "data": {
                                "slot": 120,
                                "index": 3,
                                "beacon_block_root": "0x7b4661cf9c7473a3f898efc8ae15397be812470053226de533112806535b6bbe",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 3,
                                    "root": "0x71268ead4838ec83f6852cb87f16a00586db7a85ae995b40d7b365f8c71eff20"
                                }
                            },
                            "signature": "0xb23943d55b3cf203f8b558da251a1bc27d4f09701ac304776a9365517b791e8d1a7fbe813d6d429d8fee5ede3a3ee78b1887f5802ce95f017e7c5c6a0519d552b9c351c7c5ef84a3486de04d5f72f3de659d44122c5179fd634eba13c7a4ec61"
                        },
                        {
                            "aggregation_bits": "0x0000000002008800000020202000080400000020",
                            "data": {
                                "slot": 137,
                                "index": 3,
                                "beacon_block_root": "0x78a43dfde31e3b0a90153536df886b51b633f0be6cd39f79adb10bc45f5bf2a0",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0x911ee768993ca7e50ed736f96a8533a5c86b05cfd5c8189bbb75187d87e935de52b21db32a1b8f1dec7da3362a6809770dca911881fce38177cd17ff4eaaf4c61a02b6ac67131faa3016affef8f38c2d1c4979d77ef5b8e510efd18965b673f3"
                        },
                        {
                            "aggregation_bits": "0x4124cb1a00044607a639920032967084ab8fa233",
                            "data": {
                                "slot": 110,
                                "index": 2,
                                "beacon_block_root": "0x6ec33d460afcca8dac1305eb4e9360e7f62e8b7c893defc074d9281b66b22426",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 3,
                                    "root": "0x71268ead4838ec83f6852cb87f16a00586db7a85ae995b40d7b365f8c71eff20"
                                }
                            },
                            "signature": "0xba0032ba5d49bf5ec21c26136e75f5e13ada96049cc1ba579a75241bb68068796baa6bb90fe257340ed26fc18d918bcf058db0efcd055edc20e178d190f10cf47714e7474af7737b3c381defb4e0f92b37220dbdfb9f1dd1e4c0bb6a13145597"
                        },
                        {
                            "aggregation_bits": "0x5a011572584aac440c8378980542009c6698021a",
                            "data": {
                                "slot": 138,
                                "index": 2,
                                "beacon_block_root": "0x19c7252f6150f964fa62cc94e7ff9df79b74c552bf3d134b1f7a317c01662c1d",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0xb84b845b1aa20e6562b54e92ce1ddbed2bd64c5ab19d8f97d82d888aa2045355df7751f3198fe853496a6eded9d9ce2818eaa54b8865f31189a59f7dffc42680e67213b99f613f341ec15d7093260977b4d2fa0d7712bcfecac72b9094fca6a1"
                        },
                        {
                            "aggregation_bits": "0x1000000000000040000000000000010000000020",
                            "data": {
                                "slot": 107,
                                "index": 2,
                                "beacon_block_root": "0xf7f4b94cf4a56dde6def8f3d17a5c7c226b15b1e16fdced1b3ef07cdd7067a35",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 3,
                                    "root": "0x71268ead4838ec83f6852cb87f16a00586db7a85ae995b40d7b365f8c71eff20"
                                }
                            },
                            "signature": "0x94b46a224a360647ebf33c443ab494f44ff6196d403c086ed6e86ac89546290d5d493831032f8fe20c5c713b1e36a0010bd7fda9c2932a9dd67b81dc007900f8bcc5b7ac5e2145d6c5576bc0182a5fa9e48f6416f6401fbd474c36621fc25157"
                        },
                        {
                            "aggregation_bits": "0x0000000000000000200080000000000000000020",
                            "data": {
                                "slot": 138,
                                "index": 0,
                                "beacon_block_root": "0x9ad72edd1303a10d292bf8ad84360d30b309a85fd0ee9f4143821f5a3ec01da1",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0x82ec8e921485f34636fe1d0720063afb6a3318c5628119ca431a926ebc6d745e7f6ea597fc4da608a46aabd69f4682860f8b2d52377b1581475c031e84001cbbb6a194497baa143fc027688755f0f5f0795f6aed2188aee43de8e726a4120e24"
                        },
                        {
                            "aggregation_bits": "0x022241404608283281c6b1014b90c64a43542524",
                            "data": {
                                "slot": 117,
                                "index": 3,
                                "beacon_block_root": "0x83536b175d6100ebd2c94e3f81ec18cf6dd2de0d01bdec894a9b67918a0b59bb",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 3,
                                    "root": "0x71268ead4838ec83f6852cb87f16a00586db7a85ae995b40d7b365f8c71eff20"
                                }
                            },
                            "signature": "0xb3a602866bda3a47610d34470e95ebde69a510a8cb89e6820e8983629e54fe67c8b9d18f5a2de3417226da5e6bbdab2803ee77dd2783bfd1f106f8b76c06f8807066cc138f416966ea3b23ad26e8af3093970366b56b61d01d3a4b624b2d246f"
                        },
                        {
                            "aggregation_bits": "0x0000800000004000008010004008000000010020",
                            "data": {
                                "slot": 137,
                                "index": 1,
                                "beacon_block_root": "0x78a43dfde31e3b0a90153536df886b51b633f0be6cd39f79adb10bc45f5bf2a0",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0x977b102672dea38e9f3329a5d41eeabbad63459784ed6953fe17b53bb64d6e2ea29b545739874ea985a59ffa058b39fe189625ec9032991bd554710b14c81011b1d3b3739e2cd0b103d88e7d1854bfe5b12f0fe4ff656c0406b854cf24abd823"
                        },
                        {
                            "aggregation_bits": "0x0000400000000004202000000000204000400029",
                            "data": {
                                "slot": 137,
                                "index": 0,
                                "beacon_block_root": "0x78a43dfde31e3b0a90153536df886b51b633f0be6cd39f79adb10bc45f5bf2a0",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0x8e785a724178e30d242ea3f6d47f5da4dcb6165f2fece46220417dd8e996f7d50a9e8adee4e291aa7ea91a01ca67d86005a3115251675b2386b4607d283d865329e0c159483ee15c8b894f44a93a1819424aead27cdacd707e195cf8b9e46202"
                        },
                        {
                            "aggregation_bits": "0x82040300b0412cbf4415406aa0225017960a1220",
                            "data": {
                                "slot": 138,
                                "index": 3,
                                "beacon_block_root": "0x19c7252f6150f964fa62cc94e7ff9df79b74c552bf3d134b1f7a317c01662c1d",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0x8a73d8e52525273fc2cba38880966cd12fb921e2c11ec42e0f025815d50a6665725b4fdfbd804a3c0ebd9c8453aa619002ec847a2e6cb007a1fe10a8926c4f7f05ba5210d50fafc3d15a3547872a192a13cd6168759e98198218dc71d816938d"
                        },
                        {
                            "aggregation_bits": "0x3da1f8c0fca988008a815b8acf44c46b4811b83c",
                            "data": {
                                "slot": 138,
                                "index": 0,
                                "beacon_block_root": "0x19c7252f6150f964fa62cc94e7ff9df79b74c552bf3d134b1f7a317c01662c1d",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0xb1e8075b03cd83e7d4e64b0c7f0745cccaedcf7cb0c280c58a58d2b2c0bc765129ae4960ec764ee9f4531a998ff07ac40ab3bae433bb93a663ef781236dc5eb56c957104532bfe40ebf4670283ffa89ba6c0f7f9414db12f7396a6f5260cc7f2"
                        },
                        {
                            "aggregation_bits": "0x0000000000000080000000000000000000000820",
                            "data": {
                                "slot": 138,
                                "index": 1,
                                "beacon_block_root": "0x9ad72edd1303a10d292bf8ad84360d30b309a85fd0ee9f4143821f5a3ec01da1",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0xae28f4ac2f0039a97c5050568374ea6afec5fc2435dfffb5aab221e16752f21b2e9d422673a3b54c921351276796752a1815bca4cef43acf38ffb9337db9dfffb4828b4b7f275cabfa141a27aa3b80c4af3f2feddd88073fd90f3b9c59012ad6"
                        },
                        {
                            "aggregation_bits": "0xb79ff75597bcf27f42b08ed45378b5d826c39624",
                            "data": {
                                "slot": 127,
                                "index": 2,
                                "beacon_block_root": "0xf5e238fa204ada23f160b2ba53881a37157aa04eaf68acfd426e1cde5da64c3f",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 3,
                                    "root": "0x71268ead4838ec83f6852cb87f16a00586db7a85ae995b40d7b365f8c71eff20"
                                }
                            },
                            "signature": "0x8274e364d6cae881318bcf3689a59b0907aca03f7ebb90d639e898dec4209f6de0ab2a695ac423483671001742c9ac2817783a907a7165dd47bae9e079d5614205a3cf0fd6c8ccf59d7b408b69f3a041a4fd3ce10b3a5b3e0a338d9a3b734c15"
                        },
                        {
                            "aggregation_bits": "0x0008040202002448100400000020288031020220",
                            "data": {
                                "slot": 138,
                                "index": 0,
                                "beacon_block_root": "0xe6f12742a1f9dbf90ee3d8af3b0d1813bdb0037356073f5ccc5e771b6816b16e",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0x99df38fdcad7765f0263ce937d2c983aba4f824ffc0dde471b79f5fdf2ca32ccb4efa5c89634a5d7f45b2e518b04c8eb10d14a602dcb148344b5a36d30479c018a7e1c1d424c536fc79c5b8174bb2b6d788ead87ad30c963690da33b71cb07a2"
                        },
                        {
                            "aggregation_bits": "0x001144e340000100130000800580830000040822",
                            "data": {
                                "slot": 138,
                                "index": 3,
                                "beacon_block_root": "0xe6f12742a1f9dbf90ee3d8af3b0d1813bdb0037356073f5ccc5e771b6816b16e",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0x8bff49e4f543cb8cee1e47fd2adf5027a3551190ed9bbca62a7e7f0367689ef83f69f23a7d95b2d0f758073d52ff4035098e3d1c3370e1fc3fb4be8063c0b9e260beab7bd7c8662af167e8d1aa9e4972df840797f9c18b144763c8804ab51d36"
                        },
                        {
                            "aggregation_bits": "0x80008a0800801200000004000020020008008010",
                            "data": {
                                "slot": 138,
                                "index": 2,
                                "beacon_block_root": "0xe6f12742a1f9dbf90ee3d8af3b0d1813bdb0037356073f5ccc5e771b6816b16e",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0xa3dc151f6b8b48e474bd4d05ff512d47fbf40c4d2a9f370a0e2e8b547084b896676862ea4fd3644a2e48329a7fb8ed3111c80f71bcc3c7216da56bb63a92f897037607996c2f5c88547fa6242674bf498efd7fca79198ac573bcd3775a153586"
                        },
                        {
                            "aggregation_bits": "0xa16c00b60822b3d0a79cb6181426434008228124",
                            "data": {
                                "slot": 119,
                                "index": 3,
                                "beacon_block_root": "0x7b4661cf9c7473a3f898efc8ae15397be812470053226de533112806535b6bbe",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 3,
                                    "root": "0x71268ead4838ec83f6852cb87f16a00586db7a85ae995b40d7b365f8c71eff20"
                                }
                            },
                            "signature": "0xb544dc4fa9cc1cbb5b199e6224aca4df04fb755f3d55d01f66fd414dcedbfc2a77fd16c405aba4693ac26822ad1dd031180da6452191eb91cd9dacffece0efb930f65273e172b9756bcfcd95817f30c02d46378223867e5179ed0c2b82c3f496"
                        },
                        {
                            "aggregation_bits": "0x0000000000000000000000000000000000010010",
                            "data": {
                                "slot": 138,
                                "index": 2,
                                "beacon_block_root": "0x9ad72edd1303a10d292bf8ad84360d30b309a85fd0ee9f4143821f5a3ec01da1",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0x8dfb9571372ac1be545fe2ea5b33a7e1b1973db5a785159a819f1b585fe9698b291720a82ebdf4e4f26644e217d1051e0d038c00779a17c0a2aa9f30f13ed563b978178ba9511d982e818af8488ec84dc31d8828bde6402772f105ab3977b120"
                        },
                        {
                            "aggregation_bits": "0x0008000000000000000000000000000000000020",
                            "data": {
                                "slot": 138,
                                "index": 3,
                                "beacon_block_root": "0x9ad72edd1303a10d292bf8ad84360d30b309a85fd0ee9f4143821f5a3ec01da1",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0xb49d33f2338bd7e5dfa977181b32477696fb514bc368934dd13ce1406802c4d17398bbd47f775872c8ad01d474374da40fea6d65d0a96ad5abfadf9f4df9e5dbdfa68fe350484e284343cdabec65b58598c423d39f99e70aeb1d072b14b7d2f5"
                        },
                        {
                            "aggregation_bits": "0x0000000000100000000000000000000000000020",
                            "data": {
                                "slot": 138,
                                "index": 3,
                                "beacon_block_root": "0x9ad72edd1303a10d292bf8ad84360d30b309a85fd0ee9f4143821f5a3ec01da1",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0x880070d6f6dd688622ffb526f0138194d970f07c7639881f1f689421d4c06e6e02843f106248f58e128af8f9158a9723097869b4261e4e0396c5f09289ab5394af913a8b0901af261dcb1b14eababf91c9ac3232875c14ce1489ab5ea3bfdf4b"
                        },
                        {
                            "aggregation_bits": "0x0000000002000000000000000000000000000020",
                            "data": {
                                "slot": 138,
                                "index": 1,
                                "beacon_block_root": "0x9ad72edd1303a10d292bf8ad84360d30b309a85fd0ee9f4143821f5a3ec01da1",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0x8fd2f48f4e45381060a4c85299d46bf5e83d321325d9fd98adbd3d82aa90286f31129d7d461b293a854b5977b9cb948c1081dbd375b9cb98212b2b574a15b5404a8672f6f9e6cc8af7b660096965160e37748980ae41ff2ef832a0a10535bb07"
                        },
                        {
                            "aggregation_bits": "0x0000000000000000000000000002000000000020",
                            "data": {
                                "slot": 116,
                                "index": 0,
                                "beacon_block_root": "0xd09ab08b00864faf3fe813235ba9e86408813b31f13784ad4d17feadf7abdc98",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 3,
                                    "root": "0x71268ead4838ec83f6852cb87f16a00586db7a85ae995b40d7b365f8c71eff20"
                                }
                            },
                            "signature": "0xb3f0a92f67cea6265b69af6120088d8bf9f7173a197fe7ca2eea64b3445611430f204169fd67022496592148a52e4560064f5cf914fa82e29e89830a9a030397b628043d2a960e45dfca6a50264b47489ca2d88bd9b1449da72eabd1b34503c6"
                        },
                        {
                            "aggregation_bits": "0x0000000000000000000000000000010000000020",
                            "data": {
                                "slot": 138,
                                "index": 1,
                                "beacon_block_root": "0x9ad72edd1303a10d292bf8ad84360d30b309a85fd0ee9f4143821f5a3ec01da1",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0x8c5d80e040ab8aa7b1033f5cd3a8fca0b2070f99d1b63cb3dd32c4eba17ac3da5ff2765d4d7f1391bab698b483a411ee0bbaca856d35e113fe5ed430f0426a18e8e35bb2659a00d3207a6ab1b3f75831fc54f0598593dddfd3eb6383decad56c"
                        },
                        {
                            "aggregation_bits": "0x0000000000000000000000000000000000000220",
                            "data": {
                                "slot": 138,
                                "index": 1,
                                "beacon_block_root": "0x9ad72edd1303a10d292bf8ad84360d30b309a85fd0ee9f4143821f5a3ec01da1",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0xb1a4456a99e991e013bef0dda208ac5899e6b2a51a28d82949bee6d0f81a8298df01b38256b5b7fee193e72fa7344b03046500361f34b41629a3e7d826cbfd9ad4e7d0d96ee3ee5f29640ae7cdc81759af36faf49d4aa3e80f4d8467ac5c346a"
                        },
                        {
                            "aggregation_bits": "0x0000000000000000000000000000000000004020",
                            "data": {
                                "slot": 138,
                                "index": 0,
                                "beacon_block_root": "0x9ad72edd1303a10d292bf8ad84360d30b309a85fd0ee9f4143821f5a3ec01da1",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0x8b04e04b383f9ef0ffe3202cb89c59baccb59b3df93a571f2dfa3b02f81079ec66b015c04f6f17f7e4ee4b2e2494860513d085321eb7f96f9bed925d8e91cc4524c4b22eecb1e87979ac0acea448af95dde24d0e990f440d1488125baa1f33cb"
                        },
                        {
                            "aggregation_bits": "0x0000000000000100000000000000000000000020",
                            "data": {
                                "slot": 138,
                                "index": 0,
                                "beacon_block_root": "0x9ad72edd1303a10d292bf8ad84360d30b309a85fd0ee9f4143821f5a3ec01da1",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0xb2a28232b6c73c95066c084d83b8f9312972af6e52eced4406d31716e42e1cdcefb0da373587ed02029270d8bc5716630acac1644bd98c949816b7bf06f38923c16eaccaa26aa3705bed3d2aecf4be901faab795c941415ad47547f296e1a75e"
                        },
                        {
                            "aggregation_bits": "0x0000000000000000000000000000000800000020",
                            "data": {
                                "slot": 138,
                                "index": 3,
                                "beacon_block_root": "0x9ad72edd1303a10d292bf8ad84360d30b309a85fd0ee9f4143821f5a3ec01da1",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0x8707f29c3d714d56b6fc1d79f4f457d2448068fb785604277b7f7c632d9800a1a397c8ed3398e65c92bab77938a28cab11f528603a524d3d3b577ca3efa1e82f0676f1a2d2aae3ffb3534abca2bc99585ee4c46f8f2e81b257dfedb842f49e4b"
                        },
                        {
                            "aggregation_bits": "0x0000000000000080000000000000000000000010",
                            "data": {
                                "slot": 138,
                                "index": 2,
                                "beacon_block_root": "0x9ad72edd1303a10d292bf8ad84360d30b309a85fd0ee9f4143821f5a3ec01da1",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0x8f3a2872d1f6d9bcab842ac9db73cd6f5f46fa46dd8b14601074e2b3fff80621be8358c10b237cb22842ffcad830863c0b56a37b2db26790a05cf3da2ebfc09a8fe299d1330f7449c3150b2ec2497560c81f6bfc0d7ce9bc1b9527ba18243890"
                        },
                        {
                            "aggregation_bits": "0x0000000000000000400000000000000000000020",
                            "data": {
                                "slot": 138,
                                "index": 1,
                                "beacon_block_root": "0x9ad72edd1303a10d292bf8ad84360d30b309a85fd0ee9f4143821f5a3ec01da1",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0xaa3749c7898cd26bfd7995ee5ed55d09ca3b311ab6979dbeb5ed8f7f5a38e2e31c70d4c1ac43f7ad8513a05cd55e52a707edd1967b784370d60d73f6b7b1009c223fdba292bf7cb2c90f1c340c7b7c8750f7815520754974ef4b82785df104cf"
                        },
                        {
                            "aggregation_bits": "0x0000000000000000008000000000000000000020",
                            "data": {
                                "slot": 138,
                                "index": 3,
                                "beacon_block_root": "0x9ad72edd1303a10d292bf8ad84360d30b309a85fd0ee9f4143821f5a3ec01da1",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0x8b3527b9917feb49562eb4b57fff02586536d20ff1e8ed553842e89e65b26326601e580e782e8cc273afd3aa0ebc662010612cd3789f81721cbb969c5a3bb514e061f19ee8af53eda615ce771d583e94722cc02b991de6c364edc694d3f2026f"
                        },
                        {
                            "aggregation_bits": "0x0000000000000000000000000000000000040010",
                            "data": {
                                "slot": 138,
                                "index": 2,
                                "beacon_block_root": "0x9ad72edd1303a10d292bf8ad84360d30b309a85fd0ee9f4143821f5a3ec01da1",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0x846eb7eac4b2a68804251e4550b710ff05e8cc269fe07e893bd2f70c4237aff64d62f01dcb07d4defd164fa1f50dfb6a127d53c5842b73e7fec40d24e3cd23308f176baabc59a15aae87940a675f49cfade0ac754df7bbec9e26a98ac7c4aeae"
                        },
                        {
                            "aggregation_bits": "0x0000000000000000002000000000000000000020",
                            "data": {
                                "slot": 138,
                                "index": 0,
                                "beacon_block_root": "0x9ad72edd1303a10d292bf8ad84360d30b309a85fd0ee9f4143821f5a3ec01da1",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0xa37c975677743f95bccf24893579815dea4fd921fef78e0d31070f77c5e53d19ca68cba870556502dad024f3aed52ef30e7d1111a8036914d86ecd65797b840b073cf11089912767f03ffa8baad1ac8f56ed0c3bc7db3182c4e32fe75590e5af"
                        },
                        {
                            "aggregation_bits": "0x0000000000000000000000000000000000000120",
                            "data": {
                                "slot": 138,
                                "index": 3,
                                "beacon_block_root": "0x9ad72edd1303a10d292bf8ad84360d30b309a85fd0ee9f4143821f5a3ec01da1",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0xb56f74db3e5473f3f08eda3ac2d1bd9cad9c841301a52b27a97c02e1d8ee627d46c7d2fcc6cc2613ab993d95a9db170008285eae4319ce19990003a487f02a81a3e2633bfca48bfa43eca50b943e0e075606443892ff1b9ad01f91684d00c326"
                        },
                        {
                            "aggregation_bits": "0x0000000000000000000000000000008000000020",
                            "data": {
                                "slot": 108,
                                "index": 3,
                                "beacon_block_root": "0x6ec33d460afcca8dac1305eb4e9360e7f62e8b7c893defc074d9281b66b22426",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 3,
                                    "root": "0x71268ead4838ec83f6852cb87f16a00586db7a85ae995b40d7b365f8c71eff20"
                                }
                            },
                            "signature": "0x828c715eab614a7b0d08e60d2753d179087c26e8d80d254ef4cf27ae4bb0b3bb6a3c6f59e28074cf29d2c50d40ef5d5f01b4f185f9469ca8f0138a70878da475f4ac64e4d52d0d8066c625b1405989cc7b2e5ca20897d49a1f4e3fece80de802"
                        },
                        {
                            "aggregation_bits": "0x0000400000000000000000000000000000000010",
                            "data": {
                                "slot": 138,
                                "index": 2,
                                "beacon_block_root": "0x9ad72edd1303a10d292bf8ad84360d30b309a85fd0ee9f4143821f5a3ec01da1",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0xa4a1547f321cd914a07bd1f77db199e5d4293ddec1f10adb4f5099048035b88e67457a5f0ea7176a8601295a0e2fdc9b0653e9484e2617cb898be182120bce78d54f7dabb87f222231c93bd8e6d5b6eaa609855ee9051bb835dfb9f51b1d521d"
                        },
                        {
                            "aggregation_bits": "0x2000000000000000000000000000000000000010",
                            "data": {
                                "slot": 138,
                                "index": 2,
                                "beacon_block_root": "0x9ad72edd1303a10d292bf8ad84360d30b309a85fd0ee9f4143821f5a3ec01da1",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0xaa01e8c81d435c2fafb0ed470d736c20f991873b51eefa6c46b2ae04b25c870968587fbe0df2f80397cc50432316b28c0d776e0456e1eb675ef2ac666e4151475d86057e370bf75626d59cf17b4290ea2265baff9526ab26b022695f7f385e1d"
                        },
                        {
                            "aggregation_bits": "0x0000000000000000000000000080000000000020",
                            "data": {
                                "slot": 138,
                                "index": 0,
                                "beacon_block_root": "0x9ad72edd1303a10d292bf8ad84360d30b309a85fd0ee9f4143821f5a3ec01da1",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0x9310042dcabbce7fbd00790b0a58f8d405b7414fed38619b8967df7bbfd7bfa540048270145e9a2f1120491e05cd00f1121252d893e6730ea966e5b68389ab23e43c93fb74ebaf41a94e0908c344f7135331bcc71cf81366fab4071bddde3764"
                        },
                        {
                            "aggregation_bits": "0x0000000000000100000000000000000000000020",
                            "data": {
                                "slot": 138,
                                "index": 1,
                                "beacon_block_root": "0x9ad72edd1303a10d292bf8ad84360d30b309a85fd0ee9f4143821f5a3ec01da1",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0x813291df2950b69ee2399b9849057d92456bd4369d5b73eb1333eb455b71fda08c063c795ac1e0e38e00b7ded72b1a3d05d4498ec070285bd860ccd91398c53cfa4cb033f2fac939d0f0e0706a43f4a745274f1dc0358d4f87bb34e3ad6a6e4e"
                        },
                        {
                            "aggregation_bits": "0x0000000000000000000000000002000000000020",
                            "data": {
                                "slot": 138,
                                "index": 1,
                                "beacon_block_root": "0x9ad72edd1303a10d292bf8ad84360d30b309a85fd0ee9f4143821f5a3ec01da1",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0x8c3ed01d1754277ecd3509b13db9abb763a69423d81c6d1de9edba0527ffda71bb0bc25b451a5b376b4b045bba6a482c058b6b4fc75a3e1c64a03b54d61a2cff7c35b26081045d699f5b0b820c71152b1c64fa0928e3f65000dce670b5bde621"
                        },
                        {
                            "aggregation_bits": "0x0010000000000000000000000000000000000010",
                            "data": {
                                "slot": 138,
                                "index": 2,
                                "beacon_block_root": "0x9ad72edd1303a10d292bf8ad84360d30b309a85fd0ee9f4143821f5a3ec01da1",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0xb54b134c1525fee6887668844010979dadd449e74d8c98818c593b8f970a9750a5150e8441d9f2d39ebc5b95eeb51dd315078d51e8bb9bf6420eaa4348139ac6ae8c9113ec0f2e1ee603eab162313908c4c9a8e7bc81af343494bdd35f78af03"
                        },
                        {
                            "aggregation_bits": "0x0000000000000000400000000000000000000020",
                            "data": {
                                "slot": 138,
                                "index": 0,
                                "beacon_block_root": "0x9ad72edd1303a10d292bf8ad84360d30b309a85fd0ee9f4143821f5a3ec01da1",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0xa55b8a173f43967fa0ce323d74c1e65a54943758436141e0c9bd1a35b1d1d2087441c1d58108bd15b4744841469b86aa01c869ddb26530083413135e5d6c1d1fc83a7cfe625508bec61c7ca2ea39b90cc3ed12c6802172504aada32285bb779c"
                        },
                        {
                            "aggregation_bits": "0x0000000000000000000000000000000200000010",
                            "data": {
                                "slot": 138,
                                "index": 2,
                                "beacon_block_root": "0xe6f12742a1f9dbf90ee3d8af3b0d1813bdb0037356073f5ccc5e771b6816b16e",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0xae338676828e4d22a6e7e4e80c41152db82e944df0fc0c1ac885a5bb2d87d16ded789cb98636a78a9f2a8a6b1792f1e70a7de4ba967e6b25d71909d51a4f776528db13d1577cb9a5832c88f90f4c4c24fd8fd73635096bbcd0ec9a82c16a4710"
                        },
                        {
                            "aggregation_bits": "0x0000000000000000000000200000000000000020",
                            "data": {
                                "slot": 138,
                                "index": 0,
                                "beacon_block_root": "0x9ad72edd1303a10d292bf8ad84360d30b309a85fd0ee9f4143821f5a3ec01da1",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0xb1140dd3bf39dc38868aa6ced7bd8570620711b655e790a67ddbbdbee835165b3979d8607be082f3bfab50dba40ea8d2027e420f5fe12bee11e7371cd2d6180cf8ed16d4e4a3270c44063f2efce66e2b9b2dd8f3333b0c7f6c1810a2ad80f7ce"
                        },
                        {
                            "aggregation_bits": "0x0000000000000000000000000000000004000020",
                            "data": {
                                "slot": 138,
                                "index": 0,
                                "beacon_block_root": "0x9ad72edd1303a10d292bf8ad84360d30b309a85fd0ee9f4143821f5a3ec01da1",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0x9180b97b86218a5eb3edcc9ebd2d304d3d1193bd06381f0f434ad7e4519e98fd06dfd7161a2f3f34cadd2c22d5590caa118e5c4adb89560396df2b22c181687bbcd01c1d58366d37db3ddd112daf6c2354b18197ef385eecf4771673aa9d2e04"
                        },
                        {
                            "aggregation_bits": "0x0000000000000000000000000000000000000021",
                            "data": {
                                "slot": 138,
                                "index": 0,
                                "beacon_block_root": "0x9ad72edd1303a10d292bf8ad84360d30b309a85fd0ee9f4143821f5a3ec01da1",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0x964185e7ab9adfc0a26a49dcc0ace2395c956307ccbb0688ded50c283c9d6d9acce96af6ddcee33c216b0529293a9e2f1999fa04800675adec4a0cce9aaf7d40a443d6842f4259ae7c2ee8be804ff8ec88df170bc3db53fa867dfa10a9b9b010"
                        },
                        {
                            "aggregation_bits": "0x0000000000000000000000000000002000000010",
                            "data": {
                                "slot": 138,
                                "index": 2,
                                "beacon_block_root": "0x9ad72edd1303a10d292bf8ad84360d30b309a85fd0ee9f4143821f5a3ec01da1",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0x823f6cf13673fa7bdbe08a8a7277de7d22dd682c0429b52e4aacaef7949ace68f472684ff28ac4d22cdcf56f1237ac3a19821c486825048dfbf1a6642597dfdea638c64fcd9de1ee60ecbf0ce8e3c721865da173126cb070d50b34bb27d769aa"
                        },
                        {
                            "aggregation_bits": "0x0000000000000000000001000000000000000010",
                            "data": {
                                "slot": 138,
                                "index": 2,
                                "beacon_block_root": "0x9ad72edd1303a10d292bf8ad84360d30b309a85fd0ee9f4143821f5a3ec01da1",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0xae1f8d55fcb58d63698fd1cdfc3efe5dc3a4757597ba95043e61f4e6fdcc3f01c5847c1c4d7839d89180eb2dac7272c903ff361959f54e04d5b8dd6957e6c063bc25d6cb7d411c10fa6c804c117ffbe035b6a6b124ca031670344d863553453a"
                        },
                        {
                            "aggregation_bits": "0x0000000000000000000000000000010000000010",
                            "data": {
                                "slot": 138,
                                "index": 2,
                                "beacon_block_root": "0x9ad72edd1303a10d292bf8ad84360d30b309a85fd0ee9f4143821f5a3ec01da1",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0x8ae6fe1e8702487aa2ebf69d37433276ba12e37e0409f75555fc3fdd8ebdb448ba17e77929b7dbcf647b0bac1271d9bb1881f719f035793dcd26d3328d1fbfbbc209c353d127e3ea92cf54cd5e3d38b613711deafc3612e333f833f8efd15a12"
                        },
                        {
                            "aggregation_bits": "0x0000000000000000000000000000000000008020",
                            "data": {
                                "slot": 138,
                                "index": 3,
                                "beacon_block_root": "0x9ad72edd1303a10d292bf8ad84360d30b309a85fd0ee9f4143821f5a3ec01da1",
                                "source": {
                                    "epoch": 0,
                                    "root": "0x0000000000000000000000000000000000000000000000000000000000000000"
                                },
                                "target": {
                                    "epoch": 4,
                                    "root": "0x98485ccb576f552248547106c993ab36150a12c7531061491813ef9f27f9a6d6"
                                }
                            },
                            "signature": "0xacfcb1b84d343854970043fe7c06216d8ffbcd5372dfec349bb52abe9ff6d8deb23da441bd68ac0e6b87df1d4f4c82860b1d727a7e003afa60742c282d3e7746b8e4026362accd265f3259b6fbcad0e03a346411d2a9d1d47e7c18e139bc79d4"
                        }
                    ],
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

### Attester Slashings

### Attestations

### Deposits

### Voluntary Exits

## 
``` SQL
SELECT * FROM mytable;
```
