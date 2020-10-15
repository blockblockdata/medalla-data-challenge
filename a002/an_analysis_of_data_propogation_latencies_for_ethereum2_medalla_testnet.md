# An Analysis of Data Propogation Latencies in Ethereum 2.0 Medalla Testnet

Joseph Kholodenko, Gurdal Ertek

![](./images/beacon-block-artistic-photo.png)

**Summary:** Ethereum 2.0 is the new version of the Ethereum blockchain, where consensus (agreement of which data and blocks will be added) is to be achieved through proof-of-stake (PoS). 
Coordination of consensus and many other processes in Ethereum 2.0 will be carried out by a chain referred to as the "beacon chain".
The Medalla testnet provides ample data on the Ethereum 2.0 network, which can be analyzed for measuring and improving the performance of the network.
This article presents a visual analysis of data propogation latencies (delays) in the Medalla testnet, focusing on the average inclusion distance in each epoch. 
As a methodological contribution, our article demonstrates how network data can be visually analyzed, with a focus on latencies with respect to including attestations, i.e, *inclusion distances (delays)*. The data analytics methodology presented here can be applied not only in analyzing data from the Ethereum 2.0 mainnet, but also for analyzing data from any blockchain network.

> *Every second is of infinite value."* ***Johann Wolfgang von Goethe***


## Ethereum and Ethereum 2.0
The Ethereum blockchain, initially envisioned by [Vitalik Buterin](https://medium.com/@VitalikButerin), is the first [triple-entry ledger system](https://hackernoon.com/why-everyone-missed-the-most-important-invention-in-the-last-500-years-c90b0151c169) in human history to serve as an enabling platform for smart contracts.
Ethereum 1.0, the Ethereum blockchain that achieves consensus through proof-of-work (PoW), is already the second most powerful computing platform on the face of earth.

An existentially inevitable milestone in Ethereum's journey to become ["The Infinite Machine"](https://www.amazon.com/Infinite-Machine-Crypto-Hackers-Building-Internet/dp/B07XJ7WKXL/ref=sr_1_1?dchild=1&keywords=infinite+machine&qid=1602161947&s=books&sr=1-1) 
is Ethereum's version 2.0, , i.e, Ethereum 2.0. 
Upon the completion of the three Phases of Ethereum 2.0, namely Phase 0, Phase 1, and Phase 2, Ethereum blockchain will be fully functional without any dependence to any other "Layer 2" solution. A comprehensive list of resources on Ethereum 2.0 are provided [here](https://hackmd.io/@benjaminion/eth2_info).

The focus of this article is the delays in inclusion of attestation aggregations in the Ethereum 2.0 network on the Beacon Chain. *Beacon chain* is the primary chain in Ethereum 2.0, which will go live with Phase 0. For Ethereum 2.0 core development, this was shared to be a [high priority](https://www.notion.so/Wishlist-The-Eth2-Medalla-Data-Challenge-69fe10ffe83748bc87faa0e2586ba857) analysis, that can help improve the performance of the network. 

Our analysis is built on data from the Medalla testnet extracted using [´chaind´ API](https://github.com/wealdtech/chaind) and shared in the form of an PostgreSQL dump, whose latest version can be [accessed from here](http://mdc.mcdee.net/chain-487600.dmp). The data was kindly shared by [Jim McDonald](https://github.com/mcdee?tab=overview&from=2014-12-01&to=2014-12-31) on [ethstaker Discord channel, under #medalla-data-challenge hashtag](https://discord.com/channels/694822223575384095/752638638189445220). 

While the analysis in this article focuses on data from the Medalla testnet of Ethereum 2.0, the presented visual analytics methodology, together with [other analysis methodologies,](https://github.com/bluepintail/medalla_analysis/blob/master/medalla_analysis.ipynb) can serve as a guiding example of how blockchain network data can be analyzed by blockchain engineers and data scientists.

## Beacon Chain and Attestations
Central to Ethereum 2.0's architectural design is the beacon chain, which coordinates the Proof-of-Staking (PoS) consensus protocol. An [insightful article by Ben Edgington](https://media.consensys.net/state-of-ethereum-protocol-2-the-beacon-chain-c6b6a9a69129) explains the functionality and working mechanism of the beacon chain. Our earlier article we prepared for submission to the [Medalla Data Challenge](https://blockblockdata.github.io/medalla-data-challenge/a001/the_ethereum_2_beacon_block_data_schema_and_visual_documentation.html) provides a visual documentation of the data produced and stored for each beacon block on the beacon chain. As further reference, an excellent list of definitions for the various Ethereum 2.0 terms are provided by [Alethio here](https://medium.com/alethio/ethereum-2-a-validators-journey-through-the-beacon-chain-843f70aaab2e). 

Consensus on the Ethereum 2.0 blockchain will be achieved through the participation of *validators*, which are in essence client software running in parallel on a distributed network of computers. The [journey of a validator](https://medium.com/alethio/ethereum-2-a-validators-journey-through-the-beacon-chain-843f70aaab2e) begins by the installation of the client software, deposit of at least 32 ETH (Ethereum) coins to the node's wallet, and joining a waiting queue to be admitted. The atomic time unit in Ethereum 2.0 is a *slot*, which is issued every 12 seconds. Every 32 slots (about 6,5 minutes) constitute an *epoch*.  Once a validator is admitted, at each slot, there are two main roles that it may be assigned to by the network, namely role of *(block) proposer* and the role of *(block) attester*. A proposer (a validator with the proposer hat on) proposes blocks to be added to the blockchain. An attester (a validator with the attestor hat on) votes on whether the block is valid and should be appended to the network, as the proposer suggests. Attesters vote within one of multiple *committees*, where committees are formed freshly at every epoch. Each validator is invited every epoch exactly once to serve in one of the many committees. As many details exist, we refer interested readers to two fascinating articles by [Ben Edgington](https://media.consensys.net/state-of-ethereum-protocol-2-the-beacon-chain-c6b6a9a69129) and [Jim McDonald](https://www.attestant.io/posts/understanding-the-validator-lifecycle/) which describe the working mechanics of the beacon chain and Ethereum 2.0 overall. 

The system incentivizes compliant behavior on the part of the validators through various [rewards and penalties](https://codefi.consensys.net/blog/rewards-and-penalties-on-ethereum-20-phase-0), while keeping them in the network. Yet, if a validator, in the role of proposer *or* attester, is proven to commit fraud, it is *slashed*, meaning that it is involuntarily and forcefully removed by the system from the network. Slashed validator are *not* allowed to participate in the network again.

Ethereum 2.0's Proof-of-Stake (PoS) consensus protocol includes blocks on the blockchain not simultaneously, but only after evaluating *attestations*, which are aggregated as *attestation aggregations*. For each slot, the attestations from different committees are *included* in the blockchain only after a certain delay, which can be referred to as *inclusion distance, inclusion delay, inclusion latency*, or other another similar term. In this article, to have consistency with the [amazing analysis and article by bluepintail](https://github.com/bluepintail/medalla_analysis/blob/master/medalla_analysis.ipynb), from now on, we will refer to this latency as *inclusion distance*. The block for a slot can be immutably written/registered only after *all* the attestations for that slot have been included. Therefore, for each slot, the eventual inclusion distance is the maximum inclusion distance over all attestation aggregations over all committees who participated in the consensus for that slot.


## Medalla Testnet
Medalla is the final long-lasting testnet of Ethereum 2.0 Phase 0. 

The [technical specification document under Ethereum's GitHub repository](https://github.com/ethereum/eth2.0-specs/blob/v0.12.1/specs/phase0/beacon-chain.md) is a primary document in the community that lists the specifications of Ethereum 2.0. Furthermore, the [annotated technical specification for the Beacon Chain by (Ben Edgington)](https://benjaminion.xyz/eth2-annotated-spec/phase0/beacon-chain/#beaconblockbody) provides the descriptions of the data fields in the beacon chain and the processes executed on the chain. Both these documentations sources, as well as those listed under the [latter]((https://benjaminion.xyz/eth2-annotated-spec/phase0/beacon-chain/#beaconblockbody)) are quite comprehensive in scope. Yet, since the mentioned documents are mainly in text format, our article aims to provide a visual communication of the speficiations with sample data from the Medalla testnet.

The data schema that we present here represents the data that can be retrieved by [Lighthose https API](https://lighthouse-book.sigmaprime.io/http.html). 
While the Lighthouse API allows the retrieval of an extensive array of data, our focus in this article is the ['/beacon/block/ endpoint'](https://lighthouse-book.sigmaprime.io/http/beacon.html#beaconblock).
The Lighthouse API documentation also provides sample data, yet sample data is not complete for all the fields and data types.
A useful information available in our diagram is the parsing of the data in /beacon/block/ into tables of a relational database. 
The database schema also provides the [data types for MySQL](https://www.javatpoint.com/sql-data-types#:~:text=SQL%20Data%20Types%201%20String%20Data%20types%202,Data%20types%203%20Date%20and%20time%20Data%20types), 
the key attributes of each table, and the foreign keys that relate the tables to each other.
For the sake of simplicity, all bigint data types of Ethereum 2.0 have been represented as INT(255) and all hash strings -while many of them require much less memory- have been represented as TINYTEXT.

## Data Extraction

``` SQL
SELECT
  f_slot,
  COUNT(f_inclusion_index) AS cnt_attesters_in_slot,
  MIN(f_inclusion_slot) AS min_inc_slot_over_committees,
  MAX(f_inclusion_slot) AS max_inc_slot_over_committees,
  MAX(f_inclusion_slot) - f_slot AS slot_diff_over_committees,
  MIN(f_source_epoch) AS min_src_epoch,  
  MAX(f_target_epoch) AS max_targ_epoch,
  MAX(f_target_epoch) - MIN(f_source_epoch) AS epoch_diff_over_committees
FROM
  t_attestations
GROUP BY
  1
;
``` 


``` SQL
SELECT
  f_proposer_index,
  f_root,
  f_slot,
  CASE WHEN f_slot IN (SELECT f_inclusion_slot FROM t_proposer_slashings) THEN 1 ELSE 0 END AS proposer_slashings,
  CASE WHEN f_slot IN (SELECT f_inclusion_slot FROM t_attester_slashings) THEN 1 ELSE 0 END AS attester_slashings,
  CASE WHEN f_slot IN (SELECT f_inclusion_slot FROM t_voluntary_exits) THEN 1 ELSE 0 END AS voluntary_exits,
  ps.f_header_1_slot AS ps_header_1_slot,
  ps.f_header_1_proposer_index AS header_1_proposer_index,
  ps.f_header_2_slot AS ps_f_header_2_slot,
  ps.f_header_2_proposer_index AS header_2_proposer_index,
  b.f_slot - ps.f_header_1_slot AS delay_reporting_proposer_slashings,
  atts.f_attestation_1_slot AS atts_slot_1,
  atts.f_attestation_2_slot AS atts_slot_2,
  atts.f_attestation_2_slot - atts.f_attestation_1_slot AS delay_atts_committees,
  b.f_slot - atts.f_attestation_1_slot AS delay_reporting_atts_1_slashings,
  b.f_slot - atts.f_attestation_2_slot AS delay_reporting_atts_2_slashings,
  atts.f_attestation_1_source_epoch AS atts_1_source_epoch,
  atts.f_attestation_1_target_epoch AS atts_1_target_epoch,
  atts.f_attestation_2_source_epoch AS atts_2_source_epoch,
  atts.f_attestation_2_target_epoch AS atts_2_target_epoch,
  ve.f_validator_index AS ve_index,
  ve.f_epoch AS ve_epoch,
  ve.f_inclusion_slot AS ve_slots,
  b.f_slot - ve.f_inclusion_slot AS delay_reporting_ve
FROM
  t_blocks b
LEFT JOIN
  t_proposer_slashings ps
ON
  b.f_slot = ps.f_inclusion_slot
LEFT JOIN
  t_attester_slashings atts
ON
  b.f_slot = atts.f_inclusion_slot
LEFT JOIN
  t_voluntary_exits ve
ON
  b.f_slot = ve.f_inclusion_slot
;
``` 

## Data Preparation



## Analytics Methodology



## Univariate Analysis



## Correlations



## Patterns Over Epochs



## Relationships Between Attributes



## Software Stack



## Acknowledgements

The authors thank the authors of all the resources used in the article, as well as the Ethereum Community and Foundation. The authors especially thank [Ben Eddington](https://www.linkedin.com/in/benedgington/) for his rigorous documentation, [Jim McDonald](https://www.linkedin.com/in/jimgmcdonald/) for sharing the data used in the article, and [bluepintail](https://github.com/bluepintail) for openly sharing his/her analysis with the ethstaker community. The authors also thank [Ivan Liljeqvist](https://www.linkedin.com/in/ivan-liljeqvist-697824198/) and the [Ivan on Tech](https://academy.ivanontech.com/a/27786/pVrJMEtL) team for creating a thriving community and motivating blockchain content. 

## Authors

<table>
  <tr>
    <td width=150px><a href="https://www.linkedin.com/in/josephkholodenko/" target="_blank"><img src="images/joseph-kholodenko.png" alt="Joseph Kholodenko"></a></td>
    <td><b>Joseph Kholodenko</b> is a freelance data science consultant. In the past he has worked as a Data Scientist at Google and taught at the Flatiron School as a Senior Lead Data Science Instructor. He is currently pursuing his MS in Computer Science with a specialization in machine learning at Georgia Institute of Technology.
    </td>
  </tr>
  <tr>
    <td width=150px><a href="https://www.linkedin.com/in/gurdalertek/" target="_blank"><img src="images/gurdal-ertek.png" alt="Gurdal Ertek"></a></td>
    <td><b>Gürdal Ertek</b> is an Associate Professor at UAE University (UAEU), Al Ain, UAE. He received his Ph.D. from Georgia Institute of Technology, Atlanta, GA, in 2001. Dr. Ertek served in educational and research organizations in Turkey, USA, Singapore, Kuwait and UAE, as well as an on-site reviewer for 50+ industrial R&D projects. His research and teaching areas include applied data science, business analytics, supply chain management, project management, and R&D management.</td>
  </tr>
</table>

