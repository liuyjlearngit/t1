UPDATE dims_mm_entitytype
  SET
    name=SUBSTR(specialityname, 5) || ' ' || name,
    specialityname='核心网'
  WHERE
    specialityname like '核心网_%';
