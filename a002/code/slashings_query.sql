-- slot #
-- is the block missing in the slot?
-- root
-- num_proposers_slashed_per_slot (from proposer slashings table)
-- num_attesters_slashed_per_slot (from attester slashings table)
-- num_voluntary_exits_per_slot (from voluntary exits slashings table)
-- num_deposits_per_slot
-- in a particular slot, in which blocks does a softfork happen?

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