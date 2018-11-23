-- V1.0 - 02.01.2018 / PA

--DECLARE @IdHotel int = 2


Select 
	distinct(p.Url)
from 
	Picture p
	Left join Room r on r.IdRoom = p.IdRoom
where 
	r.IdHotel = @IdHotel