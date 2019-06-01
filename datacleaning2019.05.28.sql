CREATE Table ar_impulsive_fmly_early_exposure AS
SELECT
    a.subjectkey AS id,
    (a.interview_age/12) AS teen_age,
    a.sex as teen_sex,
    (a.upps6_y + a.upps7_y + + a.upps11_y+ a.upps12_y+ a.upps15_y+ a.upps16_y+ a.upps17_y+ a.upps18_y+
    a.upps19_y+ a.upps20_y+ a.upps21_y+ a.upps22_y+ a.upps23_y+ a.upps24_y+ a.upps27_y+ a.upps28_y+
    a.upps35_y+ a.upps36_y+ a.upps37_y + a.upps39_y)  AS impulsivity_score,
    (e.fes_youth_q1 + e.fes_youth_q2 + e.fes_youth_q3 + e.fes_youth_q4 + e.fes_youth_q5 + e.fes_youth_q6 + e.fes_youth_q7
    + e.fes_youth_q8 + e.fes_youth_q9) AS fmly_conflt_score,
    b.parent_rules_q1 as dk_rule,
    b.parent_rules_q4 as smk_rule,
    b.parent_rules_q7 as mj_rule,
    c.tlfb_alc_sip as alc_sip,
    c.tlfb_alc_use as alc_use,
    c.tlfb_tob_puff as cig_puff,
    c.tlfb_mj_puff as mj_puff,
    d.demo_prnt_marital_v2 as prnt_marital,
    d.demo_prnt_ed_v2 as prnt_edu,
    d.demo_comb_income_v2 as fmly_income,
   CASE WHEN d.demo_race_a_p___10 = 1 AND d.demo_ethn_v2 != 1 AND demo_race_a_p___11 != 1 THEN 1
        WHEN d.demo_race_a_p___11 = 1 AND d.demo_ethn_v2 != 1 AND demo_race_a_p___10 != 1 THEN 2
        WHEN d.demo_ethn_v2 = 1 THEN 3
        ELSE 4
    END AS teen_race
FROM abcd_impulsivity AS a 
INNER JOIN abcd_substance_fmly_rule AS b on a.subjectkey = b.subjectkey
INNER JOIN abcd_substance_youth AS c on a.subjectkey = c.subjectkey
INNER JOIN abcd_demo AS d on a.subjectkey = d.subjectkey
INNER JOIN abcd_fmly_evnmt as e on a.subjectkey = e.subjectkey
WHERE e.eventname = 'baseline_year_1_arm_1' AND
      b.eventname = 'baseline_year_1_arm_1'

