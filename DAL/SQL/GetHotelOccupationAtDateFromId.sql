-- V1.1 - 31.12.2017 / PA

--DECLARE @date date = '2018-01-01'
--DECLARE @IdHotel int = 3
SELECT 
	1.0-(
	--nbr of empty room
	CAST (count(*) as float) /
	-- nbr of rooms in hotel
	(Select count (*) from Room where idHotel = @IdHotel))

FROM
	Room r
	
WHERE
	r.IdRoom not in(
		SELECT
			roo.IdRoom
			
		FROM 
			Room roo
			left join RoomsInReservation rir on roo.IdRoom = rir.IdRoom
			left join Reservation res on rir.IdReservation = res.IdReservation

		WHERE
			@Date between res.FirstNight and res.LastNight
			and res.Cancelled = 0
	)
	and r.idHotel = @IdHotel