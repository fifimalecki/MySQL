SELECT nazwa, sztuk
FROM produkty
produkty JOIN detal_zamow ON idp=p_id
ORDER BY idd;