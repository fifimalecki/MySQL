SELECT *
FROM zamow
WHERE dayname(data) = ('Monday' || 'Friday');