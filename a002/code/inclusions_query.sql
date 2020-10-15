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

SELECT
  COUNT(*)
FROM
  t_attestations
;