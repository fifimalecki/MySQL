SELECT DISTINCT produkty.nazwa,(SELECT IFNULL(SUM(SZTUK),0) FROM detal_zamow WHERE produkty.idp = detal_zamow.p_id) as Laczna_liczba_sztuk FROM produkty LEFT JOIN detal_zamow ON idp=p_id ORDER BY nazwa;