-- V1.1 - 21.10.2017 / PA

--DECLARE @firstNight date = '2018-01-01'
--DECLARE @lastNight date = '2018-02-05'

SELECT 
	*

FROM
	Room
	
WHERE
	IdRoom not in(
		SELECT
			roo.IdRoom
			
		FROM 
			Room roo
			left join RoomsInReservation rir on roo.IdRoom = rir.IdRoom
			left join Reservation res on rir.IdReservation = res.IdReservation

		WHERE
			(@firstNight between res.FirstNight and res.LastNight
			or @lastNight between res.FirstNight and res.LastNight
			or res.FirstNight between @firstNight and @lastNight
			or res.LastNight between @firstNight and @lastNight)
			and res.Cancelled = 0
	)