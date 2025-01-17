-- noinspection SqlResolveForFile
INSERT INTO answer_schema_group (answer_schema_group_uuid, answer_schema_group_code, group_start, group_end)
VALUES ('44444444-4444-4444-5555-444444444444', 'YesNo', '2019-11-14 08:11:53.177108', null),
       ('44444444-4444-4444-5555-444444444445', 'NoSomeSig', '2019-11-14 08:11:53.177108', null),
       ('44444444-4444-4444-5555-444444444446', 'Employment', '2019-11-14 08:11:53.177108', null),
       ('44444444-4444-4444-5555-444444444447', 'EducationProblemAreas', '2019-11-14 08:11:53.177108', null),
       ('44444444-4444-4444-5555-444444444448', 'Qualifications', '2019-11-14 08:11:53.177108', null);


INSERT INTO answer_schema (answer_schema_uuid, answer_schema_code, answer_schema_group_uuid, answer_start, answer_end, value, text)
VALUES  ('44444444-4444-4444-4444-444444444444', 'SR15.1.2.1','44444444-4444-4444-5555-444444444444', '2019-11-14 08:11:53.177108', null, 'Y', 'Yes'),
        ('44444444-4444-4444-4444-444444444445', 'SR15.1.2.2','44444444-4444-4444-5555-444444444444', '2019-11-14 08:11:53.177108', null, 'N', 'No'),
        ('44444444-4444-4444-4444-444444444446', 'missing','44444444-4444-4444-5555-444444444445', '2019-11-14 08:11:53.177108', null, null, 'Missing'),
        ('44444444-4444-4444-4444-444444444447', 'no_problems','44444444-4444-4444-5555-444444444445', '2019-11-14 08:11:53.177108', null, '0', 'No problems'),
        ('44444444-4444-4444-4444-444444444448', 'some_problems','44444444-4444-4444-5555-444444444445', '2019-11-14 08:11:53.177108', null, '1', 'Some problems'),
        ('44444444-4444-4444-4444-444444444449', 'significant_problems','44444444-4444-4444-5555-444444444445', '2019-11-14 08:11:53.177108', null, '2', 'Significant problems'),
        ('44444444-4444-4444-4444-444444444450', 'missing','44444444-4444-4444-5555-444444444446', '2019-11-14 08:11:53.177108', null, null, 'Missing'),
        ('44444444-4444-4444-4444-444444444451', 'employed','44444444-4444-4444-5555-444444444446', '2019-11-14 08:11:53.177108', null, 'employed', 'Employed'),
        ('44444444-4444-4444-4444-444444444452', 'unemployed','44444444-4444-4444-5555-444444444446', '2019-11-14 08:11:53.177108', null, 'unemployed', 'Unemployed'),
        ('44444444-4444-4444-4444-444444444453', 'unavailable','44444444-4444-4444-5555-444444444446', '2019-11-14 08:11:53.177108', null, 'unavailable', 'Unavailable for work'),
        ('44444444-4444-4444-4444-444444444454', 'reading','44444444-4444-4444-5555-444444444447', '2019-11-14 08:11:53.177108', null, 'reading', 'Reading'),
        ('44444444-4444-4444-4444-444444444455', 'writing','44444444-4444-4444-5555-444444444447', '2019-11-14 08:11:53.177108', null, 'writing', 'Writing'),
        ('44444444-4444-4444-4444-444444444456', 'numeracy','44444444-4444-4444-5555-444444444447', '2019-11-14 08:11:53.177108', null, 'numeracy', 'Numeracy'),
        ('44444444-4444-4444-4444-444444444457', 'no_qualifications','44444444-4444-4444-5555-444444444448', '2019-11-14 08:11:53.177108', null, '0', 'No qualifications'),
        ('44444444-4444-4444-4444-444444444458', 'some_qualifications','44444444-4444-4444-5555-444444444448', '2019-11-14 08:11:53.177108', null, '2', 'Some qualifications');


INSERT INTO question_schema (question_schema_uuid, question_code, oasys_question_code, question_start, question_end, answer_type, answer_schema_group_uuid, question_text, question_help_text)
VALUES  ('11111111-1111-1111-1111-111111111111', 'SR15.1.1', 'SR15.1', '2019-11-14 08:11:53.177108', null, 'scale',
null, 'Rating', null),
        ('11111111-1111-1111-1111-111111111112', 'SR15.1.2', 'SR15.2', '2019-11-14 08:11:53.177108', null, 'y/n', '44444444-4444-4444-5555-444444444444',  'Critical', null),
        ('11111111-1111-1111-1111-111111111113', 'SR15.1.3', 'SR15.3', '2019-11-14 08:11:53.177108', null, 'freetext', null, 'Comment', null),
        ('11111111-1111-1111-1111-111111111114', 'SR18.1.1', 'SR15.1', '2019-11-14 08:11:53.177108', null, 'scale', null, 'Rating', null),
        ('11111111-1111-1111-1111-111111111115', 'SR18.1.2', 'SR15.2', '2019-11-14 08:11:53.177108', null, 'y/n', '44444444-4444-4444-5555-444444444444', 'Critical', null),
        ('11111111-1111-1111-1111-111111111116', 'SR18.1.3', 'SR15.3', '2019-11-14 08:11:53.177108', null, 'freetext', null, 'Comment', null);

INSERT INTO grouping (group_uuid, group_code, heading, subheading, help_text, group_start, group_end)
VALUES  ('22222222-2222-2222-2222-222222222221', 'SARA', 'SARA', null, null, '2019-11-14 08:11:53.177108', null),
        ('22222222-2222-2222-2222-222222222222', 'SR15', 'Criminal History', 'Past assault of family members', null, '2019-11-14 08:11:53.177108', null),
        ('22222222-2222-2222-2222-222222222223', 'SR18', 'Criminal History', 'Past assault of strangers or acquaintances', null, '2019-11-14 08:11:53.177108', null);

INSERT INTO question_group (question_group_uuid, content_uuid, content_type, group_uuid, display_order, mandatory, validation, read_only)
VALUES  ('33333333-3333-3333-3333-333333333331', '11111111-1111-1111-1111-111111111111', 'question', '22222222-2222-2222-2222-222222222222', 1, true, null, false),
        ('33333333-3333-3333-3333-333333333332', '11111111-1111-1111-1111-111111111112', 'question','22222222-2222-2222-2222-222222222222', 2, true, null, false),
        ('33333333-3333-3333-3333-333333333333', '11111111-1111-1111-1111-111111111113', 'question','22222222-2222-2222-2222-222222222222', 3, true, null, false),
        ('33333333-3333-3333-3333-333333333334', '11111111-1111-1111-1111-111111111114', 'question','22222222-2222-2222-2222-222222222223', 4, true, null, false),
        ('33333333-3333-3333-3333-333333333335', '11111111-1111-1111-1111-111111111115', 'question','22222222-2222-2222-2222-222222222223', 5, true, null, false),
        ('33333333-3333-3333-3333-333333333336', '11111111-1111-1111-1111-111111111116', 'question','22222222-2222-2222-2222-222222222223', 6, true, null, false);


INSERT INTO question_schema (question_schema_uuid, question_code, oasys_question_code, question_start, question_end, answer_type, answer_schema_group_uuid, question_text, question_help_text)
VALUES  ('11111111-1111-1111-1111-111111111201', 'surname', 'CI1', '2019-11-14 08:11:53.177108', null, 'freetext', null, 'Surname', null),
('11111111-1111-1111-1111-111111111202', 'forename', 'CI2', '2019-11-14 08:11:53.177108', null, 'freetext', null, 'Forename', null),
('11111111-1111-1111-1111-111111111203', 's_alias', 'CI3', '2019-11-14 08:11:53.177108', null, 'freetext', null, 'Surname Aliases', null),
('11111111-1111-1111-1111-111111111204', 'f_alias', 'CI4', '2019-11-14 08:11:53.177108', null, 'freetext', null, 'Forename Aliases', null),
('11111111-1111-1111-1111-111111111205', 'dob', 'CI5', '2019-11-14 08:11:53.177108', null, 'freetext', null, 'Date of Birth', null),
('11111111-1111-1111-1111-111111111206', 'dob_alias', 'CI6', '2019-11-14 08:11:53.177108', null, 'freetext', null, 'Date of Birth (Aliases)', null),
('11111111-1111-1111-1111-111111111207', 'gender', 'CI7', '2019-11-14 08:11:53.177108', null, 'freetext', null, 'Gender', null),
('11111111-1111-1111-1111-111111111208', 'religion', 'CI8', '2019-11-14 08:11:53.177108', null, 'freetext', null, 'Religion', null);

-- Layer 3 Accommodation
INSERT INTO question_schema (question_schema_uuid, question_code, oasys_question_code, question_start, question_end, answer_type, answer_schema_group_uuid, question_text, question_help_text)
VALUES ('11111111-1111-1111-1111-111111111231', 'no_fixed_abode', '3.3', '2019-11-14 08:11:53.177108', null, 'radio', '44444444-4444-4444-5555-444444444444', 'Currently of no fixed abode or in transient accommodation', null),
('11111111-1111-1111-1111-111111111232', 'accom_suitability', '3.4', '2019-11-14 08:11:53.177108', null, 'radio', '44444444-4444-4444-5555-444444444445', 'Suitability of accommodation', null),
('11111111-1111-1111-1111-111111111233', 'accom_permanence', '3.5', '2019-11-14 08:11:53.177108', null, 'radio', '44444444-4444-4444-5555-444444444445', 'Permanence of accommodation', null),
('11111111-1111-1111-1111-111111111234', 'accom_location', '3.6', '2019-11-14 08:11:53.177108', null, 'radio', '44444444-4444-4444-5555-444444444445', 'Suitability of location of accommodation', null),
('11111111-1111-1111-1111-111111111235', 'accom_issues', '3.97', '2019-11-14 08:11:53.177108', null, 'textarea', null, 'Identify accommodation issues contributing to risk of offending and harm. Please include any positive factors', null),
('11111111-1111-1111-1111-111111111236', 'accom_rosha', '3.98', '2019-11-14 08:11:53.177108', null, 'radio', '44444444-4444-4444-5555-444444444444', 'Accommodation issues linked to risk of serious harm, risks to the individual & other risks', null),
('11111111-1111-1111-1111-111111111237', 'accom_offending', '3.99', '2019-11-14 08:11:53.177108', null, 'radio', '44444444-4444-4444-5555-444444444444', 'Accommodation issues linked to offending behaviour', null),
('11111111-1111-1111-1111-111111111238', 'accom_lowscore', null, '2019-11-14 08:11:53.177108', null, 'radio', '44444444-4444-4444-5555-444444444444', 'Low scoring area need attention', null);

-- Layer 3 Employment
INSERT INTO question_schema (question_schema_uuid, question_code, oasys_question_code, question_start, question_end, answer_type, answer_schema_group_uuid, question_text, question_help_text)
VALUES
('11111111-1111-1111-1111-111111111240', 'employment', '4.2', '2019-11-14 08:11:53.177108', null, 'radio', '44444444-4444-4444-5555-444444444446', 'Is the person unemployed, or will be unemployed on release?', null),
('11111111-1111-1111-1111-111111111241', 'em_history', '4.3', '2019-11-14 08:11:53.177108', null, 'radio', '44444444-4444-4444-5555-444444444445', 'Employment history', null),
('11111111-1111-1111-1111-111111111242', 'em_skills', '4.4', '2019-11-14 08:11:53.177108', null, 'radio', '44444444-4444-4444-5555-444444444445', 'Work related skills', null),
('11111111-1111-1111-1111-111111111243', 'em_attitude', '4.5', '2019-11-14 08:11:53.177108', null, 'radio', '44444444-4444-4444-5555-444444444445', 'Attitudes to employment', null),
('11111111-1111-1111-1111-111111111244', 'em_school', '4.6', '2019-11-14 08:11:53.177108', null, 'radio', '44444444-4444-4444-5555-444444444445', 'School attendance', null),
('11111111-1111-1111-1111-111111111245', 'em_problems', '4.7', '2019-11-14 08:11:53.177108', null, 'radio', '44444444-4444-4444-5555-444444444445', 'Has problems with reading, writing, or numeracy', null),
('11111111-1111-1111-1111-111111111246', 'em_issues', '4.94', '2019-11-14 08:11:53.177108', null, 'textarea', null, 'Identify education, training, and employability issues contributing to risks of offending and harm. Please include any positive factors', null),
('11111111-1111-1111-1111-111111111247', 'em_rosha', '4.96', '2019-11-14 08:11:53.177108', null, 'radio', '44444444-4444-4444-5555-444444444444', 'Education/training/employability issues linked to risk of serious harm, risks to the individual & other risks', null),
('11111111-1111-1111-1111-111111111248', 'em_offending', '4.98', '2019-11-14 08:11:53.177108', null, 'radio', '44444444-4444-4444-5555-444444444444', 'Education/training/employability issues linked to offending behaviour', null),
('11111111-1111-1111-1111-111111111249', 'em_edu_attitude', '4.10', '2019-11-14 08:11:53.177108', null, 'radio', '44444444-4444-4444-5555-444444444445', 'Attitude to education / training (optional)', null),
('11111111-1111-1111-1111-111111111250', 'em_issues_areas', '4.7.1', '2019-11-14 08:11:53.177108', null, 'checkbox', null, 'Indicate problem areas', 'More than one can be selected '),
('11111111-1111-1111-1111-111111111251', 'em_difficulties', '4.8', '2019-11-14 08:11:53.177108', null, 'radio', '44444444-4444-4444-5555-444444444444', 'Has learning difficulties (optional)', null),
('11111111-1111-1111-1111-111111111252', 'em_qualifications', '4.9', '2019-11-14 08:11:53.177108', null, 'radio', '44444444-4444-4444-5555-444444444448', 'Any educational or formal professional / vocational qualifications  (optional)', null),
('11111111-1111-1111-1111-111111111253', 'em_basic_skills', '4.91', '2019-11-14 08:11:53.177108', null, 'textarea', null, 'Enter Basic Skills scores where available', null),
('11111111-1111-1111-1111-111111111254', 'em_initial_skills', '4.92', '2019-11-14 08:11:53.177108', null, 'radio', '44444444-4444-4444-5555-444444444444', 'Enter Initial Skills Checker Score', 'Skills Checker tool'),
('11111111-1111-1111-1111-111111111255', 'em_lowscore', null, '2019-11-14 08:11:53.177108', null, 'radio', '44444444-4444-4444-5555-444444444444', 'Low scoring area need attention', null);


INSERT INTO grouping (group_uuid, group_code, heading, subheading, help_text, group_start, group_end)
VALUES  ('22222222-2222-2222-2222-222222222201', 'oasys', 'Long Form', null, null, '2019-11-14 08:11:53.177108', null),
('22222222-2222-2222-2222-222222222202', 'oasys_case_id', 'Case Identification', null, null, '2019-11-14 08:11:53.177108', null),
('22222222-2222-2222-2222-222222222203', 'bcst', 'Brief Form', 'Basic Custody Screen Tool', null, '2019-11-14 08:11:53.177108', null),
('22222222-2222-2222-2222-222222222204', 'bcst_case_id', 'Case Identification', null, 'Offender and sentence details', '2019-11-14 08:11:53.177108', null),
('22222222-2222-2222-2222-222222222230', 'oasys_accommodation', 'Accommodation', null, null, '2019-11-14 08:11:53.177108', null),
('22222222-2222-2222-2222-222222222231', 'oasys_employment', 'Employment, training, employment', null, null, '2019-11-14 08:11:53.177108', null),
('22222222-2222-2222-2222-222222222240', 'overview', 'Overview', null, null, '2019-11-14 08:11:53.177108', null),
('22222222-2222-2222-2222-222222222242', 'risk_positives', 'Risks and Positive Factors', null, null, '2019-11-14 08:11:53.177108', null);

-- Layer 3 Case Identification
INSERT INTO question_group (question_group_uuid, content_uuid, content_type, group_uuid, display_order, mandatory, validation, read_only)
VALUES  ('33333333-3333-3333-3333-333333333201', '11111111-1111-1111-1111-111111111201', 'question', '22222222-2222-2222-2222-222222222202', '2', 'no', null, false),
('33333333-3333-3333-3333-333333333202', '11111111-1111-1111-1111-111111111202', 'question', '22222222-2222-2222-2222-222222222202', '1', 'no', null, false),
('33333333-3333-3333-3333-333333333203', '11111111-1111-1111-1111-111111111203', 'question', '22222222-2222-2222-2222-222222222202', '4', 'no', null, false),
('33333333-3333-3333-3333-333333333204', '11111111-1111-1111-1111-111111111204', 'question', '22222222-2222-2222-2222-222222222202', '3', 'no', null, false),
('33333333-3333-3333-3333-333333333205', '11111111-1111-1111-1111-111111111205', 'question', '22222222-2222-2222-2222-222222222202', '5', 'no', null, false),
('33333333-3333-3333-3333-333333333206', '11111111-1111-1111-1111-111111111206', 'question', '22222222-2222-2222-2222-222222222202', '6', 'no', null, false),
('33333333-3333-3333-3333-333333333207', '11111111-1111-1111-1111-111111111207', 'question', '22222222-2222-2222-2222-222222222202', '7', 'no', null, false),
('33333333-3333-3333-3333-333333333208', '11111111-1111-1111-1111-111111111208', 'question', '22222222-2222-2222-2222-222222222202', '8', 'no', null, false);

-- BCST Case Identification
INSERT INTO question_group (question_group_uuid, content_uuid, content_type, group_uuid, display_order, mandatory, validation, read_only)
VALUES  ('33333333-3333-3333-3333-333333333209', '11111111-1111-1111-1111-111111111201', 'question', '22222222-2222-2222-2222-222222222204', '2', 'no', null, false),
('33333333-3333-3333-3333-333333333210', '11111111-1111-1111-1111-111111111202', 'question', '22222222-2222-2222-2222-222222222204', '1', 'no', null, false),
('33333333-3333-3333-3333-333333333211', '11111111-1111-1111-1111-111111111205', 'question', '22222222-2222-2222-2222-222222222204', '3', 'no', null, false),
('33333333-3333-3333-3333-333333333212', '11111111-1111-1111-1111-111111111207', 'question', '22222222-2222-2222-2222-222222222204', '4', 'no', null, false);

-- Layer 3
INSERT INTO question_group (question_group_uuid, content_uuid, content_type, group_uuid, display_order, mandatory, validation, read_only)
VALUES ('33333333-3333-3333-3333-333333333301', '22222222-2222-2222-2222-222222222202', 'group', '22222222-2222-2222-2222-222222222201', '1', 'yes', null, false);

-- Accommodation
INSERT INTO question_group (question_group_uuid, content_uuid, content_type, group_uuid, display_order, mandatory, validation, read_only)
VALUES ('33333333-3333-3333-3333-333333333341', '11111111-1111-1111-1111-111111111231', 'question', '22222222-2222-2222-2222-222222222230', '1', 'no', null, false),
('33333333-3333-3333-3333-333333333342', '11111111-1111-1111-1111-111111111232', 'question', '22222222-2222-2222-2222-222222222230', '1', 'no', null, false),
('33333333-3333-3333-3333-333333333343', '11111111-1111-1111-1111-111111111233', 'question', '22222222-2222-2222-2222-222222222230', '2', 'no', null, false),
('33333333-3333-3333-3333-333333333344', '11111111-1111-1111-1111-111111111234', 'question', '22222222-2222-2222-2222-222222222230', '3', 'no', null, false),
('33333333-3333-3333-3333-333333333345', '11111111-1111-1111-1111-111111111235', 'question', '22222222-2222-2222-2222-222222222230', '4', 'no', null, false),
('33333333-3333-3333-3333-333333333346', '11111111-1111-1111-1111-111111111236', 'question', '22222222-2222-2222-2222-222222222230', '5', 'no', null, false),
('33333333-3333-3333-3333-333333333347', '11111111-1111-1111-1111-111111111237', 'question', '22222222-2222-2222-2222-222222222230', '6', 'no', null, false),
('33333333-3333-3333-3333-333333333348', '11111111-1111-1111-1111-111111111238', 'question', '22222222-2222-2222-2222-222222222230', '7', 'no', null, false),
('33333333-3333-3333-3333-333333333349', '22222222-2222-2222-2222-222222222230', 'group', '22222222-2222-2222-2222-222222222201', '8', 'yes', null, false);

-- Employment
INSERT INTO question_group (question_group_uuid, content_uuid, content_type, group_uuid, display_order, mandatory, validation, read_only)
VALUES ('33333335-5333-3333-3333-333333333540', '11111111-1111-1111-1111-111111111240', 'question', '22222222-2222-2222-2222-222222222231', '1', 'no', null, false),
('33333335-5333-3333-3333-333333333541', '11111111-1111-1111-1111-111111111241', 'question', '22222222-2222-2222-2222-222222222231', '1', 'no', null, false),
('33333335-5333-3333-3333-333333333542', '11111111-1111-1111-1111-111111111242', 'question', '22222222-2222-2222-2222-222222222231', '1', 'no', null, false),
('33333335-5333-3333-3333-333333333543', '11111111-1111-1111-1111-111111111243', 'question', '22222222-2222-2222-2222-222222222231', '1', 'no', null, false),
('33333335-5333-3333-3333-333333333544', '11111111-1111-1111-1111-111111111244', 'question', '22222222-2222-2222-2222-222222222231', '1', 'no', null, false),
('33333335-5333-3333-3333-333333333545', '11111111-1111-1111-1111-111111111245', 'question', '22222222-2222-2222-2222-222222222231', '1', 'no', null, false),
('33333335-5333-3333-3333-333333333546', '11111111-1111-1111-1111-111111111246', 'question', '22222222-2222-2222-2222-222222222231', '1', 'no', null, false),
('33333335-5333-3333-3333-333333333547', '11111111-1111-1111-1111-111111111247', 'question', '22222222-2222-2222-2222-222222222231', '1', 'no', null, false),
('33333335-5333-3333-3333-333333333548', '11111111-1111-1111-1111-111111111248', 'question', '22222222-2222-2222-2222-222222222231', '1', 'no', null, false),
('33333333-3333-3333-3333-333333333549', '22222222-2222-2222-2222-222222222231', 'group', '22222222-2222-2222-2222-222222222201', '3', 'yes', null, false),
('33333335-5333-3333-3333-333333333550', '11111111-1111-1111-1111-111111111249', 'question', '22222222-2222-2222-2222-222222222231', '1', 'no', null, false),
('33333335-5333-3333-3333-333333333551', '11111111-1111-1111-1111-111111111250', 'question', '22222222-2222-2222-2222-222222222231', '1', 'no', null, false),
('33333335-5333-3333-3333-333333333552', '11111111-1111-1111-1111-111111111251', 'question', '22222222-2222-2222-2222-222222222231', '1', 'no', null, false),
('33333335-5333-3333-3333-333333333553', '11111111-1111-1111-1111-111111111252', 'question', '22222222-2222-2222-2222-222222222231', '1', 'no', null, false),
('33333335-5333-3333-3333-333333333554', '11111111-1111-1111-1111-111111111253', 'question', '22222222-2222-2222-2222-222222222231', '1', 'no', null, false),
('33333335-5333-3333-3333-333333333555', '11111111-1111-1111-1111-111111111254', 'question', '22222222-2222-2222-2222-222222222231', '1', 'no', null, false),
('33333335-5333-3333-3333-333333333556', '11111111-1111-1111-1111-111111111255', 'question', '22222222-2222-2222-2222-222222222231', '1', 'no', null, false);


-- BCST
INSERT INTO question_group (question_group_uuid, content_uuid, content_type, group_uuid, display_order, mandatory, validation, read_only)
VALUES  ('33333333-3333-3333-3333-333333333303', '22222222-2222-2222-2222-222222222204', 'group', '22222222-2222-2222-2222-222222222203', '1', 'yes', null, false);

-- Risks and Positive Factors
INSERT INTO question_group (question_group_uuid, content_uuid, content_type, group_uuid, display_order, mandatory, validation, read_only)
VALUES  ('33333333-3333-3333-3333-333333333250', '11111111-1111-1111-1111-111111111235', 'question', '22222222-2222-2222-2222-222222222242', '1', 'no', null, false),
('33333335-5333-3333-3333-333333333251', '11111111-1111-1111-1111-111111111246', 'question', '22222222-2222-2222-2222-222222222242', '2', 'no', null, false),
('33333335-5333-3333-3333-333333333252', '22222222-2222-2222-2222-222222222242', 'group', '22222222-2222-2222-2222-222222222240', '1', 'yes', null, false);


