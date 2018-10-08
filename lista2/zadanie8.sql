SELECT nazwa
FROM klienci LEFT JOIN ZAMOW ON idk=k_id
WHERE k_id IS NULL;