SELECT nazwa
FROM produkty
LEFT JOIN detal_zamow ON idp=p_id
WHERE p_id IS NULL;