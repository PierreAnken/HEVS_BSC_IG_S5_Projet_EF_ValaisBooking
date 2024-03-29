
/****** Object:  User [admin]    Script Date: 23.11.2018 13:21:26 ******/
CREATE USER [admin] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[db_accessadmin]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 23.11.2018 13:21:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[IdHotel] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[Location] [nvarchar](50) NOT NULL,
	[Category] [int] NOT NULL,
	[HasWifi] [bit] NOT NULL,
	[HasParking] [bit] NOT NULL,
	[Phone] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[Website] [varchar](100) NULL,
	[Overview] [nvarchar](max) NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[IdHotel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Picture]    Script Date: 23.11.2018 13:21:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Picture](
	[IdPicture] [int] NOT NULL,
	[Url] [nvarchar](max) NOT NULL,
	[IdRoom] [int] NOT NULL,
 CONSTRAINT [PK_Picture] PRIMARY KEY CLUSTERED 
(
	[IdPicture] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 23.11.2018 13:21:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[IdReservation] [int] IDENTITY(1,1) NOT NULL,
	[IdUser] [int] NOT NULL,
	[FirstNight] [date] NOT NULL,
	[LastNight] [date] NOT NULL,
	[Cancelled] [bit] NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_Reservation] PRIMARY KEY CLUSTERED 
(
	[IdReservation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 23.11.2018 13:21:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[IdRoom] [int] NOT NULL,
	[Number] [int] NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[Type] [int] NOT NULL,
	[Price] [numeric](5, 2) NOT NULL,
	[HasTV] [bit] NOT NULL,
	[HasHairDryer] [bit] NOT NULL,
	[IdHotel] [int] NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[IdRoom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomsInReservation]    Script Date: 23.11.2018 13:21:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomsInReservation](
	[Id] [int] IDENTITY(1,1) PRIMARY KEY,
	[IdRoom] [int] NOT NULL,
	[IdReservation] [int] NOT NULL,
 )
GO
/****** Object:  Table [dbo].[UserData]    Script Date: 23.11.2018 13:21:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserData](
	[IdUser] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[PasswordMd5] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Hotel] ([IdHotel], [Name], [Description], [Location], [Category], [HasWifi], [HasParking], [Phone], [Email], [Website], [Overview]) VALUES (1, N'Octodure', N'<p>Rénové en 2015, l''Hôtel Octodure est idéalement situé au cœur de Martigny, à 5 minutes à pied de la gare. Il propose des chambres lumineuses et une connexion Wi-Fi gratuite.</p><p>Vous pourrez déguster de délicieux plats suisses au restaurant de l''hôtel, ouvert récemment.</p><p>De nombreux magasins, bars et restaurants sont facilement accessibles à pied depuis l''Hotel Octodure.</p><p>Les couples apprécient particulièrement l''emplacement de cet établissement. Ils lui donnent la note de 8,7 pour un séjour à deux.</p><p>Si vous souhaitez lui demander quelque chose en particulier, vous pourrez le faire à la prochaine étape, juste avant de réserver. Une fois la réservation effectuée, nous vous communiquerons les coordonnées de l''établissement pour que vous puissiez le contacter directement.</p><p>Nous parlons votre langue !</p>', N'Martigny', 4, 1, 1, N'+41277220000', N'info@octodure.ch', N'www.octodure.ch', N'1.jpg')
INSERT [dbo].[Hotel] ([IdHotel], [Name], [Description], [Location], [Category], [HasWifi], [HasParking], [Phone], [Email], [Website], [Overview]) VALUES (2, N'Constantin Palace', N'<p>Situé à seulement 100 mètres de la gare de Martigny-Croix, le Constantin Palace met gratuitement à votre disposition une connexion Wi-Fi.</p><p>Insonorisées, toutes les chambres de l''hôtel Le Constantin Palace comprennent une télévision par câble à écran plat et une salle de bains.</p><p>Ouvert pour le dîner, le restaurant La Toscana sert une cuisine italienne aromatique. Vous aurez également la possibilité de déguster une cuisine locale pour le déjeuner au restaurant La Brasserie. De plus, vous profiterez d''une terrasse en été.</p><p>Depuis la gare de Martigny-Croix, vous pourrez facilement rejoindre Verbier. Le bus s''arrêtant en face de l''hôtel vous permettra de vous rendre rapidement dans le centre-ville de Martigny. Enfin, l''autoroute A9 se trouve à 4 km.</p><p>Cet établissement a également été bien noté pour son excellent emplacement à Martigny-Croix ! Les clients en sont plus satisfaits en comparaison avec d''autres établissements dans cette ville.</p><p>Cet établissement a également été bien noté pour son excellent rapport qualité/prix à Martigny-Croix ! Les clients en ont plus pour leur argent en comparaison avec d''autres établissements dans cette ville.</p><p>Si vous souhaitez lui demander quelque chose en particulier, vous pourrez le faire à la prochaine étape, juste avant de réserver. Une fois la réservation effectuée, nous vous communiquerons les coordonnées de l''établissement pour que vous puissiez le contacter directement.</p><p>Nous parlons votre langue !</p>', N'Martigny', 5, 1, 0, N'+41277220001', N'info@constantinpalace.ch', N'www.constantinpalace.ch', N'2.jpg')
INSERT [dbo].[Hotel] ([IdHotel], [Name], [Description], [Location], [Category], [HasWifi], [HasParking], [Phone], [Email], [Website], [Overview]) VALUES (3, N'Valais Palace', N'<p>Situé au calme, dans le centre de Sion, le Valais Palace offre des vues panoramiques sur les Alpes valaisannes et la basilique de Valère. Le restaurant, qui possède une terrasse, sert une cuisine suisse traditionnelle. De plus, une connexion Wi-Fi est accessible gratuitement.</p><p>Les spacieuses chambres sont dotées d''une télévision par câble à écran plat, d''un coin salon, d''un coffre-fort pour ordinateur portable, d''un minibar et d''un plateau/bouilloire. Leur salle de bains privative est pourvue d''articles de toilette et d''un sèche-cheveux.</p><p>Le Valais Palace se trouve à 500 mètres de la gare de Sion et à 2 km du parcours de golf de la ville. Veysonnaz se situe à 14 km.</p><p>Vous pourrez vous garer sur le parking Étoile/Coop, en dessous de l''établissement, moyennant des frais supplémentaires.</p><p>Cet établissement a également été bien noté pour son excellent emplacement à Sion ! Les clients en sont plus satisfaits en comparaison avec d''autres établissements dans cette ville.</p><p>Les couples apprécient particulièrement l''emplacement de cet établissement. Ils lui donnent la note de 9,1 pour un séjour à deux.</p><p>Si vous souhaitez lui demander quelque chose en particulier, vous pourrez le faire à la prochaine étape, juste avant de réserver. Une fois la réservation effectuée, nous vous communiquerons les coordonnées de l''établissement pour que vous puissiez le contacter directement.</p><p>Nous parlons votre langue !</p>', N'Sion', 3, 0, 0, N'+41273220000', N'info@valaispalace.ch', N'www.valaispalace.ch', N'3.jpg')
INSERT [dbo].[Hotel] ([IdHotel], [Name], [Description], [Location], [Category], [HasWifi], [HasParking], [Phone], [Email], [Website], [Overview]) VALUES (4, N'Grand Duc', N'<p>Rénové en 2014, l''Hotel Grand Duc est situé juste en dessous du château de Tourbillon, à 4 minutes à pied du centre de Sion. Une connexion Wi-Fi est disponible gratuitement.</p><p>Toutes les chambres offrent une vue sur la montagne et comprennent un minibar, une télévision par câble à écran plat ainsi qu''une salle de bains.</p><p>L''Hotel Grand Duc possède un restaurant de style brasserie avec un bar. Sa grande terrasse est pourvue d''une aire de jeux pour enfants.</p><p>Par ailleurs, vous bénéficierez d''un parking privé gratuit sur place. La gare de Sion est accessible en 15 minutes à pied tandis que le parcours de golf de la ville se trouve à 5 minutes en voiture.</p><p>Les couples apprécient particulièrement l''emplacement de cet établissement. Ils lui donnent la note de 8,1 pour un séjour à deux.</p><p>Si vous souhaitez lui demander quelque chose en particulier, vous pourrez le faire à la prochaine étape, juste avant de réserver. Une fois la réservation effectuée, nous vous communiquerons les coordonnées de l''établissement pour que vous puissiez le contacter directement.</p><p>Nous parlons votre langue !</p>', N'Sion', 5, 1, 1, N'+41273220001', N'info@duc.ch', N'www.duc.ch', N'4.jpg')
INSERT [dbo].[Hotel] ([IdHotel], [Name], [Description], [Location], [Category], [HasWifi], [HasParking], [Phone], [Email], [Website], [Overview]) VALUES (5, N'Walliser Palace', N'<p>Direkt gegenüber der Matterhorn-Gotthard-Bahn und dem Glacier-Express erwartet Sie das Hotel Walliser Palace. Sie wohnen 200 m vom Zentrum des Ortes Brig entfernt. Kostenfrei profitieren Sie von dem Parkmöglichkeiten vor Ort und vom WLAN.</p><p>Die Zimmer im Hotel Walliser Palace verfügen alle über ein eigenes Bad mit Haartrockner.</p><p>Kostenfrei können Sie außerdem Fahrräder und Motorräder in der Garage abstellen.</p><p>Das Hotel eignet sich gut als Ausgangspunkt für Ausflüge nach Zermatt, Saas Fee und ins Skigebiet Aletsch.</p><p>Paare schätzen die Lage besonders – sie haben diese mit 8,9 für einen Aufenthalt zu zweit bewertet.</p><p>Laut Paaren, die Zeit in der Unterkunft verbracht haben, bekommen Sie hier ein gutes Preis-Leistungs-Verhältnis. Sie bewerten es mit 8,0.</p><p>Wenn Sie eine besondere Anfrage stellen möchten, können Sie das im nächsten Schritt tun, vor der Buchung. Sobald Sie gebucht haben, erhalten Sie die Kontaktinformationen, so dass Sie sich direkt mit der Unterkunft in Verbindung setzen können.</p><p>Wir sprechen Ihre Sprache!</p>', N'Brig', 2, 0, 1, N'+41279220000', N'info@walliserpalace.ch', N'www.walliserpalace.ch', N'5.jpg')
INSERT [dbo].[Hotel] ([IdHotel], [Name], [Description], [Location], [Category], [HasWifi], [HasParking], [Phone], [Email], [Website], [Overview]) VALUES (6, N'Matterhorn', N'<p>Das familiengeführte Hotel Matterhorn empfängt Sie in ruhiger und zentraler Lage, nur 200 m vom Bahnhof in Brig entfernt. WLAN und die Privatparkplätze nutzen Sie kostenfrei.</p><p>Das Hotel Matterhorn bietet eine moderne Infrastruktur und ein hervorragendes Gault & Millau-Restaurant, in dem Ihnen vorwiegend französische und Schweizer Spezialitäten serviert werden.</p><p>Die Zimmer und Suiten vereinen ein traditionelles Ambiente mit modernem Komfort. Sie sind mit schallisolierten Fenstern und norwegischen Boxspring-Betten ausgestattet.</p><p>Paare schätzen die Lage besonders – sie haben diese mit 8,9 für einen Aufenthalt zu zweit bewertet.</p><p>Laut Paaren, die Zeit in der Unterkunft verbracht haben, bekommen Sie hier ein gutes Preis-Leistungs-Verhältnis. Sie bewerten es mit 8,1.</p><p>Wenn Sie eine besondere Anfrage stellen möchten, können Sie das im nächsten Schritt tun, vor der Buchung. Sobald Sie gebucht haben, erhalten Sie die Kontaktinformationen, so dass Sie sich direkt mit der Unterkunft in Verbindung setzen können.</p><p>Wir sprechen Ihre Sprache!</p>', N'Brig', 5, 1, 1, N'+41279220001', N'info@matterhorn.ch', N'www.matterhorn.ch', N'6.jpg')
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (1, N'http://new.hotelvatelconnect.com/files/1448890384_vatel_Single3.jpg', 1)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (2, N'http://new.hotelvatelconnect.com/files/1448890401_vatel_Single4.jpg', 1)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (3, N'http://new.hotelvatelconnect.com/files/1448890225_vatel_AJC_8630.jpg', 1)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (4, N'http://new.hotelvatelconnect.com/files/1448890384_vatel_Single3.jpg', 2)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (5, N'http://new.hotelvatelconnect.com/files/1448890401_vatel_Single4.jpg', 2)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (6, N'http://new.hotelvatelconnect.com/files/1448890225_vatel_AJC_8630.jpg', 2)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (7, N'http://new.hotelvatelconnect.com/files/1448890384_vatel_Single3.jpg', 3)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (8, N'http://new.hotelvatelconnect.com/files/1448890401_vatel_Single4.jpg', 3)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (9, N'http://new.hotelvatelconnect.com/files/1448890225_vatel_AJC_8630.jpg', 3)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (10, N'http://new.hotelvatelconnect.com/files/1448890384_vatel_Single3.jpg', 4)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (11, N'http://new.hotelvatelconnect.com/files/1448890401_vatel_Single4.jpg', 4)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (12, N'http://new.hotelvatelconnect.com/files/1448890225_vatel_AJC_8630.jpg', 4)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (13, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/10-chambre.jpg', 5)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (14, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/11-chambre.jpg', 5)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (15, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/_DAN2102.JPG', 5)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (16, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/10-chambre.jpg', 6)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (17, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/11-chambre.jpg', 6)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (18, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/_DAN2102.JPG', 6)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (19, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/10-chambre.jpg', 7)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (20, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/11-chambre.jpg', 7)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (21, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/_DAN2102.JPG', 7)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (22, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/10-chambre.jpg', 8)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (23, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/11-chambre.jpg', 8)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (24, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/_DAN2102.JPG', 8)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (25, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/10-chambre.jpg', 9)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (26, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/11-chambre.jpg', 9)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (27, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/_DAN2102.JPG', 9)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (28, N'http://new.hotelvatelconnect.com/files/1448890384_vatel_Single3.jpg', 10)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (29, N'http://new.hotelvatelconnect.com/files/1448890401_vatel_Single4.jpg', 10)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (30, N'http://new.hotelvatelconnect.com/files/1448890225_vatel_AJC_8630.jpg', 10)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (31, N'http://new.hotelvatelconnect.com/files/1448890384_vatel_Single3.jpg', 11)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (32, N'http://new.hotelvatelconnect.com/files/1448890401_vatel_Single4.jpg', 11)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (33, N'http://new.hotelvatelconnect.com/files/1448890225_vatel_AJC_8630.jpg', 11)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (34, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/10-chambre.jpg', 12)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (35, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/11-chambre.jpg', 12)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (36, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/_DAN2102.JPG', 12)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (37, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/10-chambre.jpg', 13)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (38, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/11-chambre.jpg', 13)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (39, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/_DAN2102.JPG', 13)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (40, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/10-chambre.jpg', 14)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (41, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/11-chambre.jpg', 14)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (42, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/_DAN2102.JPG', 14)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (43, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/10-chambre.jpg', 15)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (44, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/11-chambre.jpg', 15)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (45, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/_DAN2102.JPG', 15)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (46, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/10-chambre.jpg', 16)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (47, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/11-chambre.jpg', 16)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (48, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/_DAN2102.JPG', 16)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (49, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/10-chambre.jpg', 17)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (50, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/11-chambre.jpg', 17)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (51, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/_DAN2102.JPG', 17)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (52, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/10-chambre.jpg', 18)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (53, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/11-chambre.jpg', 18)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (54, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/_DAN2102.JPG', 18)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (55, N'http://new.hotelvatelconnect.com/files/1448890384_vatel_Single3.jpg', 19)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (56, N'http://new.hotelvatelconnect.com/files/1448890401_vatel_Single4.jpg', 19)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (57, N'http://new.hotelvatelconnect.com/files/1448890225_vatel_AJC_8630.jpg', 19)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (58, N'http://new.hotelvatelconnect.com/files/1448890384_vatel_Single3.jpg', 20)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (59, N'http://new.hotelvatelconnect.com/files/1448890401_vatel_Single4.jpg', 20)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (60, N'http://new.hotelvatelconnect.com/files/1448890225_vatel_AJC_8630.jpg', 20)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (61, N'http://new.hotelvatelconnect.com/files/1448890384_vatel_Single3.jpg', 21)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (62, N'http://new.hotelvatelconnect.com/files/1448890401_vatel_Single4.jpg', 21)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (63, N'http://new.hotelvatelconnect.com/files/1448890225_vatel_AJC_8630.jpg', 21)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (64, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/10-chambre.jpg', 22)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (65, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/11-chambre.jpg', 22)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (66, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/_DAN2102.JPG', 22)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (67, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/10-chambre.jpg', 23)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (68, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/11-chambre.jpg', 23)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (69, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/_DAN2102.JPG', 23)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (70, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/10-chambre.jpg', 24)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (71, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/11-chambre.jpg', 24)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (72, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/_DAN2102.JPG', 24)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (73, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/10-chambre.jpg', 25)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (74, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/11-chambre.jpg', 25)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (75, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/_DAN2102.JPG', 25)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (76, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/10-chambre.jpg', 26)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (77, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/11-chambre.jpg', 26)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (78, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/_DAN2102.JPG', 26)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (79, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/10-chambre.jpg', 27)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (80, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/11-chambre.jpg', 27)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (81, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/_DAN2102.JPG', 27)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (82, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/10-chambre.jpg', 28)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (83, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/11-chambre.jpg', 28)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (84, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/_DAN2102.JPG', 28)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (85, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/10-chambre.jpg', 29)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (86, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/11-chambre.jpg', 29)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (87, N'http://www.hoteldesvignes.ch/hoteldesvignes-media/img/_DAN2102.JPG', 29)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (88, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_einzelzimmer_2.jpg', 30)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (89, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_einzelzimmer2.jpg', 30)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (90, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_doppelzimmer_2.jpg', 30)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (91, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_einzelzimmer_2.jpg', 31)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (92, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_einzelzimmer2.jpg', 31)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (93, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_doppelzimmer_2.jpg', 31)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (94, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_einzelzimmer_2.jpg', 32)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (95, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_einzelzimmer2.jpg', 32)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (96, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_doppelzimmer_2.jpg', 32)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (97, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_einzelzimmer_2.jpg', 33)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (98, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_einzelzimmer2.jpg', 33)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (99, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_doppelzimmer_2.jpg', 33)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (100, N'http://www.ambassador-brig.ch/wp-content/uploads/2017/04/Hotel-Ambassador_Doppelzimmer_deluxe_1.jpg', 34)
GO
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (101, N'http://www.ambassador-brig.ch/wp-content/uploads/2017/04/Hotel-Ambassador_Doppelzimmer_deluxe_2.jpg', 34)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (102, N'http://www.ambassador-brig.ch/wp-content/uploads/2017/04/Hotel-Ambassador_Doppelzimmer_deluxe_Badezimmer.jpg', 34)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (103, N'http://www.ambassador-brig.ch/wp-content/uploads/2017/04/Hotel-Ambassador_Doppelzimmer_deluxe_1.jpg', 35)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (104, N'http://www.ambassador-brig.ch/wp-content/uploads/2017/04/Hotel-Ambassador_Doppelzimmer_deluxe_2.jpg', 35)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (105, N'http://www.ambassador-brig.ch/wp-content/uploads/2017/04/Hotel-Ambassador_Doppelzimmer_deluxe_Badezimmer.jpg', 35)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (106, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_einzelzimmer_2.jpg', 36)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (107, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_einzelzimmer2.jpg', 36)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (108, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_doppelzimmer_2.jpg', 36)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (109, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_einzelzimmer_2.jpg', 37)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (110, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_einzelzimmer2.jpg', 37)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (111, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_doppelzimmer_2.jpg', 37)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (112, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_einzelzimmer_2.jpg', 38)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (113, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_einzelzimmer2.jpg', 38)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (114, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_doppelzimmer_2.jpg', 38)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (115, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_einzelzimmer_2.jpg', 39)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (116, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_einzelzimmer2.jpg', 39)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (117, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_doppelzimmer_2.jpg', 39)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (118, N'http://www.ambassador-brig.ch/wp-content/uploads/2017/04/Hotel-Ambassador_Doppelzimmer_deluxe_1.jpg', 40)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (119, N'http://www.ambassador-brig.ch/wp-content/uploads/2017/04/Hotel-Ambassador_Doppelzimmer_deluxe_2.jpg', 40)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (120, N'http://www.ambassador-brig.ch/wp-content/uploads/2017/04/Hotel-Ambassador_Doppelzimmer_deluxe_Badezimmer.jpg', 40)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (121, N'http://www.ambassador-brig.ch/wp-content/uploads/2017/04/Hotel-Ambassador_Doppelzimmer_deluxe_1.jpg', 41)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (122, N'http://www.ambassador-brig.ch/wp-content/uploads/2017/04/Hotel-Ambassador_Doppelzimmer_deluxe_2.jpg', 41)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (123, N'http://www.ambassador-brig.ch/wp-content/uploads/2017/04/Hotel-Ambassador_Doppelzimmer_deluxe_Badezimmer.jpg', 41)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (124, N'http://www.ambassador-brig.ch/wp-content/uploads/2017/04/Hotel-Ambassador_Doppelzimmer_deluxe_1.jpg', 42)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (125, N'http://www.ambassador-brig.ch/wp-content/uploads/2017/04/Hotel-Ambassador_Doppelzimmer_deluxe_2.jpg', 42)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (126, N'http://www.ambassador-brig.ch/wp-content/uploads/2017/04/Hotel-Ambassador_Doppelzimmer_deluxe_Badezimmer.jpg', 42)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (127, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_einzelzimmer_2.jpg', 43)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (128, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_einzelzimmer2.jpg', 43)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (129, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_doppelzimmer_2.jpg', 43)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (130, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_einzelzimmer_2.jpg', 44)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (131, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_einzelzimmer2.jpg', 44)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (132, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_doppelzimmer_2.jpg', 44)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (133, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_einzelzimmer_2.jpg', 45)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (134, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_einzelzimmer2.jpg', 45)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (135, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_doppelzimmer_2.jpg', 45)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (136, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_einzelzimmer_2.jpg', 46)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (137, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_einzelzimmer2.jpg', 46)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (138, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_doppelzimmer_2.jpg', 46)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (139, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_einzelzimmer_2.jpg', 47)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (140, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_einzelzimmer2.jpg', 47)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (141, N'https://images.seekda.net/CH_VS_0559/slice-1000-565-hotel_europe_brig_doppelzimmer_2.jpg', 47)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (142, N'http://www.ambassador-brig.ch/wp-content/uploads/2017/04/Hotel-Ambassador_Doppelzimmer_deluxe_1.jpg', 48)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (143, N'http://www.ambassador-brig.ch/wp-content/uploads/2017/04/Hotel-Ambassador_Doppelzimmer_deluxe_2.jpg', 48)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (144, N'http://www.ambassador-brig.ch/wp-content/uploads/2017/04/Hotel-Ambassador_Doppelzimmer_deluxe_Badezimmer.jpg', 48)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (145, N'http://www.ambassador-brig.ch/wp-content/uploads/2017/04/Hotel-Ambassador_Doppelzimmer_deluxe_1.jpg', 49)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (146, N'http://www.ambassador-brig.ch/wp-content/uploads/2017/04/Hotel-Ambassador_Doppelzimmer_deluxe_2.jpg', 49)
INSERT [dbo].[Picture] ([IdPicture], [Url], [IdRoom]) VALUES (147, N'http://www.ambassador-brig.ch/wp-content/uploads/2017/04/Hotel-Ambassador_Doppelzimmer_deluxe_Badezimmer.jpg', 49)
SET IDENTITY_INSERT [dbo].[Reservation] ON 

INSERT [dbo].[Reservation] ([IdReservation], [IdUser], [FirstNight], [LastNight], [Cancelled], [Price]) VALUES (22, 1, CAST(N'2018-01-07' AS Date), CAST(N'2018-01-11' AS Date), 1, 1100)
INSERT [dbo].[Reservation] ([IdReservation], [IdUser], [FirstNight], [LastNight], [Cancelled], [Price]) VALUES (23, 1, CAST(N'2018-01-07' AS Date), CAST(N'2018-01-10' AS Date), 1, 1100)
INSERT [dbo].[Reservation] ([IdReservation], [IdUser], [FirstNight], [LastNight], [Cancelled], [Price]) VALUES (24, 1, CAST(N'2018-01-07' AS Date), CAST(N'2018-01-12' AS Date), 0, 408)
INSERT [dbo].[Reservation] ([IdReservation], [IdUser], [FirstNight], [LastNight], [Cancelled], [Price]) VALUES (25, 1, CAST(N'2018-01-07' AS Date), CAST(N'2018-01-09' AS Date), 1, 840)
INSERT [dbo].[Reservation] ([IdReservation], [IdUser], [FirstNight], [LastNight], [Cancelled], [Price]) VALUES (26, 1, CAST(N'2018-01-06' AS Date), CAST(N'2018-01-06' AS Date), 0, 280)
INSERT [dbo].[Reservation] ([IdReservation], [IdUser], [FirstNight], [LastNight], [Cancelled], [Price]) VALUES (27, 1, CAST(N'2018-01-06' AS Date), CAST(N'2018-01-06' AS Date), 0, 160)
INSERT [dbo].[Reservation] ([IdReservation], [IdUser], [FirstNight], [LastNight], [Cancelled], [Price]) VALUES (28, 1, CAST(N'2018-01-06' AS Date), CAST(N'2018-01-06' AS Date), 0, 360)
INSERT [dbo].[Reservation] ([IdReservation], [IdUser], [FirstNight], [LastNight], [Cancelled], [Price]) VALUES (29, 1, CAST(N'2018-01-06' AS Date), CAST(N'2018-01-06' AS Date), 0, 350)
INSERT [dbo].[Reservation] ([IdReservation], [IdUser], [FirstNight], [LastNight], [Cancelled], [Price]) VALUES (30, 1, CAST(N'2018-01-09' AS Date), CAST(N'2018-01-11' AS Date), 0, 900)
INSERT [dbo].[Reservation] ([IdReservation], [IdUser], [FirstNight], [LastNight], [Cancelled], [Price]) VALUES (31, 1, CAST(N'2018-01-07' AS Date), CAST(N'2018-01-07' AS Date), 0, 120)
INSERT [dbo].[Reservation] ([IdReservation], [IdUser], [FirstNight], [LastNight], [Cancelled], [Price]) VALUES (32, 1, CAST(N'2018-01-07' AS Date), CAST(N'2018-01-07' AS Date), 0, 120)
INSERT [dbo].[Reservation] ([IdReservation], [IdUser], [FirstNight], [LastNight], [Cancelled], [Price]) VALUES (37, 7, CAST(N'2018-01-07' AS Date), CAST(N'2018-01-07' AS Date), 0, 360)
INSERT [dbo].[Reservation] ([IdReservation], [IdUser], [FirstNight], [LastNight], [Cancelled], [Price]) VALUES (39, 8, CAST(N'2018-01-07' AS Date), CAST(N'2018-01-07' AS Date), 0, 240)
INSERT [dbo].[Reservation] ([IdReservation], [IdUser], [FirstNight], [LastNight], [Cancelled], [Price]) VALUES (40, 8, CAST(N'2018-01-07' AS Date), CAST(N'2018-01-07' AS Date), 0, 280)
INSERT [dbo].[Reservation] ([IdReservation], [IdUser], [FirstNight], [LastNight], [Cancelled], [Price]) VALUES (41, 9, CAST(N'2018-01-07' AS Date), CAST(N'2018-01-07' AS Date), 0, 48)
INSERT [dbo].[Reservation] ([IdReservation], [IdUser], [FirstNight], [LastNight], [Cancelled], [Price]) VALUES (42, 1, CAST(N'2018-11-23' AS Date), CAST(N'2018-11-23' AS Date), 0, 270)
SET IDENTITY_INSERT [dbo].[Reservation] OFF
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (1, 1001, N'<p>Les chambres standards mesurent 25m2 et ont été rénovées en 2015. Elles ouvrent leurs fenêtres sur les vignes et sont équipées de salle de bain avec douche et sèche-cheveux, télévision, radio, téléphone, accès internet gratuit, mini-bar et coffre-fort. Chaque chambre dispose également d''un set pour la préparation du thé en chambre. Pour voir les disponibilités et prix actuels, veuillez consulter notre système de réservation en ligne.</p>', 1, CAST(100.00 AS Numeric(5, 2)), 1, 0, 1)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (2, 1002, N'<p>Les chambres standards mesurent 25m2 et ont été rénovées en 2015. Elles ouvrent leurs fenêtres sur les vignes et sont équipées de salle de bain avec douche et sèche-cheveux, télévision, radio, téléphone, accès internet gratuit, mini-bar et coffre-fort. Chaque chambre dispose également d''un set pour la préparation du thé en chambre. Pour voir les disponibilités et prix actuels, veuillez consulter notre système de réservation en ligne.</p>', 1, CAST(100.00 AS Numeric(5, 2)), 1, 0, 1)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (3, 1003, N'<p>Les chambres standards mesurent 25m2 et ont été rénovées en 2015. Elles ouvrent leurs fenêtres sur les vignes et sont équipées de salle de bain avec douche et sèche-cheveux, télévision, radio, téléphone, accès internet gratuit, mini-bar et coffre-fort. Chaque chambre dispose également d''un set pour la préparation du thé en chambre. Pour voir les disponibilités et prix actuels, veuillez consulter notre système de réservation en ligne.</p>', 1, CAST(100.00 AS Numeric(5, 2)), 1, 0, 1)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (4, 1004, N'<p>Les chambres standards mesurent 25m2 et ont été rénovées en 2015. Elles ouvrent leurs fenêtres sur les vignes et sont équipées de salle de bain avec douche et sèche-cheveux, télévision, radio, téléphone, accès internet gratuit, mini-bar et coffre-fort. Chaque chambre dispose également d''un set pour la préparation du thé en chambre. Pour voir les disponibilités et prix actuels, veuillez consulter notre système de réservation en ligne.</p>', 1, CAST(100.00 AS Numeric(5, 2)), 1, 0, 1)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (5, 1011, N'<p>D''une surface de 25m2, cette chambre est équipée de deux lits simples de 90cm, d''une salle de bain avec douche, d''un minibar, d''un coffre-fort, d''une connexion internet sans fil gratuite et d''un plateau de courtoisie avec du thé et du café à volonté.</p>', 2, CAST(170.00 AS Numeric(5, 2)), 1, 1, 1)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (6, 1012, N'<p>D''une surface de 25m2, cette chambre est équipée de deux lits simples de 90cm, d''une salle de bain avec douche, d''un minibar, d''un coffre-fort, d''une connexion internet sans fil gratuite et d''un plateau de courtoisie avec du thé et du café à volonté.</p>', 2, CAST(170.00 AS Numeric(5, 2)), 1, 1, 1)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (7, 1013, N'<p>D''une surface de 25m2, cette chambre est équipée de deux lits simples de 90cm, d''une salle de bain avec douche, d''un minibar, d''un coffre-fort, d''une connexion internet sans fil gratuite et d''un plateau de courtoisie avec du thé et du café à volonté.</p>', 2, CAST(170.00 AS Numeric(5, 2)), 1, 1, 1)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (8, 1014, N'<p>D''une surface de 25m2, cette chambre est équipée de deux lits simples de 90cm, d''une salle de bain avec douche, d''un minibar, d''un coffre-fort, d''une connexion internet sans fil gratuite et d''un plateau de courtoisie avec du thé et du café à volonté.</p>', 2, CAST(170.00 AS Numeric(5, 2)), 1, 1, 1)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (9, 1015, N'<p>D''une surface de 25m2, cette chambre est équipée de deux lits simples de 90cm, d''une salle de bain avec douche, d''un minibar, d''un coffre-fort, d''une connexion internet sans fil gratuite et d''un plateau de courtoisie avec du thé et du café à volonté.</p>', 2, CAST(170.00 AS Numeric(5, 2)), 1, 1, 1)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (10, 2001, N'<p>Les chambres standards mesurent 25m2 et ont été rénovées en 2015. Elles ouvrent leurs fenêtres sur les vignes et sont équipées de salle de bain avec douche et sèche-cheveux, télévision, radio, téléphone, accès internet gratuit, mini-bar et coffre-fort. Chaque chambre dispose également d''un set pour la préparation du thé en chambre. Pour voir les disponibilités et prix actuels, veuillez consulter notre système de réservation en ligne.</p>', 1, CAST(150.00 AS Numeric(5, 2)), 0, 1, 2)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (11, 2002, N'<p>Les chambres standards mesurent 25m2 et ont été rénovées en 2015. Elles ouvrent leurs fenêtres sur les vignes et sont équipées de salle de bain avec douche et sèche-cheveux, télévision, radio, téléphone, accès internet gratuit, mini-bar et coffre-fort. Chaque chambre dispose également d''un set pour la préparation du thé en chambre. Pour voir les disponibilités et prix actuels, veuillez consulter notre système de réservation en ligne.</p>', 1, CAST(150.00 AS Numeric(5, 2)), 0, 1, 2)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (12, 2011, N'<p>D''une surface de 25m2, cette chambre est équipée de deux lits simples de 90cm, d''une salle de bain avec douche, d''un minibar, d''un coffre-fort, d''une connexion internet sans fil gratuite et d''un plateau de courtoisie avec du thé et du café à volonté.</p>', 2, CAST(200.00 AS Numeric(5, 2)), 1, 1, 2)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (13, 2012, N'<p>D''une surface de 25m2, cette chambre est équipée de deux lits simples de 90cm, d''une salle de bain avec douche, d''un minibar, d''un coffre-fort, d''une connexion internet sans fil gratuite et d''un plateau de courtoisie avec du thé et du café à volonté.</p>', 2, CAST(200.00 AS Numeric(5, 2)), 1, 1, 2)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (14, 2013, N'<p>D''une surface de 25m2, cette chambre est équipée de deux lits simples de 90cm, d''une salle de bain avec douche, d''un minibar, d''un coffre-fort, d''une connexion internet sans fil gratuite et d''un plateau de courtoisie avec du thé et du café à volonté.</p>', 2, CAST(200.00 AS Numeric(5, 2)), 1, 1, 2)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (15, 2014, N'<p>D''une surface de 25m2, cette chambre est équipée de deux lits simples de 90cm, d''une salle de bain avec douche, d''un minibar, d''un coffre-fort, d''une connexion internet sans fil gratuite et d''un plateau de courtoisie avec du thé et du café à volonté.</p>', 2, CAST(200.00 AS Numeric(5, 2)), 1, 1, 2)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (16, 2015, N'<p>D''une surface de 25m2, cette chambre est équipée de deux lits simples de 90cm, d''une salle de bain avec douche, d''un minibar, d''un coffre-fort, d''une connexion internet sans fil gratuite et d''un plateau de courtoisie avec du thé et du café à volonté.</p>', 2, CAST(200.00 AS Numeric(5, 2)), 1, 1, 2)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (17, 2016, N'<p>D''une surface de 25m2, cette chambre est équipée de deux lits simples de 90cm, d''une salle de bain avec douche, d''un minibar, d''un coffre-fort, d''une connexion internet sans fil gratuite et d''un plateau de courtoisie avec du thé et du café à volonté.</p>', 2, CAST(200.00 AS Numeric(5, 2)), 1, 1, 2)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (18, 2017, N'<p>D''une surface de 25m2, cette chambre est équipée de deux lits simples de 90cm, d''une salle de bain avec douche, d''un minibar, d''un coffre-fort, d''une connexion internet sans fil gratuite et d''un plateau de courtoisie avec du thé et du café à volonté.</p>', 2, CAST(200.00 AS Numeric(5, 2)), 1, 1, 2)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (19, 3001, N'<p>Les chambres standards mesurent 25m2 et ont été rénovées en 2015. Elles ouvrent leurs fenêtres sur les vignes et sont équipées de salle de bain avec douche et sèche-cheveux, télévision, radio, téléphone, accès internet gratuit, mini-bar et coffre-fort. Chaque chambre dispose également d''un set pour la préparation du thé en chambre. Pour voir les disponibilités et prix actuels, veuillez consulter notre système de réservation en ligne.</p>', 1, CAST(80.00 AS Numeric(5, 2)), 0, 0, 3)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (20, 3002, N'<p>Les chambres standards mesurent 25m2 et ont été rénovées en 2015. Elles ouvrent leurs fenêtres sur les vignes et sont équipées de salle de bain avec douche et sèche-cheveux, télévision, radio, téléphone, accès internet gratuit, mini-bar et coffre-fort. Chaque chambre dispose également d''un set pour la préparation du thé en chambre. Pour voir les disponibilités et prix actuels, veuillez consulter notre système de réservation en ligne.</p>', 1, CAST(80.00 AS Numeric(5, 2)), 0, 0, 3)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (21, 3003, N'<p>Les chambres standards mesurent 25m2 et ont été rénovées en 2015. Elles ouvrent leurs fenêtres sur les vignes et sont équipées de salle de bain avec douche et sèche-cheveux, télévision, radio, téléphone, accès internet gratuit, mini-bar et coffre-fort. Chaque chambre dispose également d''un set pour la préparation du thé en chambre. Pour voir les disponibilités et prix actuels, veuillez consulter notre système de réservation en ligne.</p>', 1, CAST(80.00 AS Numeric(5, 2)), 0, 0, 3)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (22, 3011, N'<p>D''une surface de 25m2, cette chambre est équipée de deux lits simples de 90cm, d''une salle de bain avec douche, d''un minibar, d''un coffre-fort, d''une connexion internet sans fil gratuite et d''un plateau de courtoisie avec du thé et du café à volonté.</p>', 2, CAST(120.00 AS Numeric(5, 2)), 1, 0, 3)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (23, 3012, N'<p>D''une surface de 25m2, cette chambre est équipée de deux lits simples de 90cm, d''une salle de bain avec douche, d''un minibar, d''un coffre-fort, d''une connexion internet sans fil gratuite et d''un plateau de courtoisie avec du thé et du café à volonté.</p>', 2, CAST(120.00 AS Numeric(5, 2)), 1, 0, 3)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (24, 3013, N'<p>D''une surface de 25m2, cette chambre est équipée de deux lits simples de 90cm, d''une salle de bain avec douche, d''un minibar, d''un coffre-fort, d''une connexion internet sans fil gratuite et d''un plateau de courtoisie avec du thé et du café à volonté.</p>', 2, CAST(120.00 AS Numeric(5, 2)), 1, 0, 3)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (25, 3014, N'<p>D''une surface de 25m2, cette chambre est équipée de deux lits simples de 90cm, d''une salle de bain avec douche, d''un minibar, d''un coffre-fort, d''une connexion internet sans fil gratuite et d''un plateau de courtoisie avec du thé et du café à volonté.</p>', 2, CAST(120.00 AS Numeric(5, 2)), 1, 0, 3)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (26, 3015, N'<p>D''une surface de 25m2, cette chambre est équipée de deux lits simples de 90cm, d''une salle de bain avec douche, d''un minibar, d''un coffre-fort, d''une connexion internet sans fil gratuite et d''un plateau de courtoisie avec du thé et du café à volonté.</p>', 2, CAST(120.00 AS Numeric(5, 2)), 1, 0, 3)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (27, 3016, N'<p>D''une surface de 25m2, cette chambre est équipée de deux lits simples de 90cm, d''une salle de bain avec douche, d''un minibar, d''un coffre-fort, d''une connexion internet sans fil gratuite et d''un plateau de courtoisie avec du thé et du café à volonté.</p>', 2, CAST(120.00 AS Numeric(5, 2)), 1, 0, 3)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (28, 3017, N'<p>D''une surface de 25m2, cette chambre est équipée de deux lits simples de 90cm, d''une salle de bain avec douche, d''un minibar, d''un coffre-fort, d''une connexion internet sans fil gratuite et d''un plateau de courtoisie avec du thé et du café à volonté.</p>', 2, CAST(120.00 AS Numeric(5, 2)), 1, 0, 3)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (29, 3018, N'<p>D''une surface de 25m2, cette chambre est équipée de deux lits simples de 90cm, d''une salle de bain avec douche, d''un minibar, d''un coffre-fort, d''une connexion internet sans fil gratuite et d''un plateau de courtoisie avec du thé et du café à volonté.</p>', 2, CAST(120.00 AS Numeric(5, 2)), 1, 0, 3)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (30, 4001, N'<p>Einzelzimmer mit Dusche, WC, Haarföhn, Telefon, Radio, Flachbildfernseher, gratis W-LAN Internet Zugang. Wertsachen können bei der Rezeption abgegeben werden, damit diese im Hauptsafe eingeschlossen werden.</p>', 1, CAST(85.00 AS Numeric(5, 2)), 1, 0, 4)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (31, 4002, N'<p>Einzelzimmer mit Dusche, WC, Haarföhn, Telefon, Radio, Flachbildfernseher, gratis W-LAN Internet Zugang. Wertsachen können bei der Rezeption abgegeben werden, damit diese im Hauptsafe eingeschlossen werden.</p>', 1, CAST(85.00 AS Numeric(5, 2)), 1, 0, 4)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (32, 4003, N'<p>Einzelzimmer mit Dusche, WC, Haarföhn, Telefon, Radio, Flachbildfernseher, gratis W-LAN Internet Zugang. Wertsachen können bei der Rezeption abgegeben werden, damit diese im Hauptsafe eingeschlossen werden.</p>', 1, CAST(85.00 AS Numeric(5, 2)), 1, 0, 4)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (33, 4004, N'<p>Einzelzimmer mit Dusche, WC, Haarföhn, Telefon, Radio, Flachbildfernseher, gratis W-LAN Internet Zugang. Wertsachen können bei der Rezeption abgegeben werden, damit diese im Hauptsafe eingeschlossen werden.</p>', 1, CAST(85.00 AS Numeric(5, 2)), 1, 0, 4)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (34, 4011, N'<p>Unsere grosszügigen Familienzimmer mit Doppelbett für die Eltern und einem Sofabett für Ihre Kinder. Bei Reisen mit Kleinkindern (unter 2 Jahren) empfehlen wir Ihnen unsere Doppelzimmer, in denen wir Ihnen gern Kinderbetten bereitstellen</p>', 2, CAST(125.00 AS Numeric(5, 2)), 1, 1, 4)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (35, 4012, N'<p>Unsere grosszügigen Familienzimmer mit Doppelbett für die Eltern und einem Sofabett für Ihre Kinder. Bei Reisen mit Kleinkindern (unter 2 Jahren) empfehlen wir Ihnen unsere Doppelzimmer, in denen wir Ihnen gern Kinderbetten bereitstellen</p>', 2, CAST(125.00 AS Numeric(5, 2)), 1, 1, 4)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (36, 5001, N'<p>Einzelzimmer mit Dusche, WC, Haarföhn, Telefon, Radio, Flachbildfernseher, gratis W-LAN Internet Zugang. Wertsachen können bei der Rezeption abgegeben werden, damit diese im Hauptsafe eingeschlossen werden.</p>', 1, CAST(40.00 AS Numeric(5, 2)), 0, 0, 5)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (37, 5002, N'<p>Einzelzimmer mit Dusche, WC, Haarföhn, Telefon, Radio, Flachbildfernseher, gratis W-LAN Internet Zugang. Wertsachen können bei der Rezeption abgegeben werden, damit diese im Hauptsafe eingeschlossen werden.</p>', 1, CAST(40.00 AS Numeric(5, 2)), 0, 0, 5)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (38, 5003, N'<p>Einzelzimmer mit Dusche, WC, Haarföhn, Telefon, Radio, Flachbildfernseher, gratis W-LAN Internet Zugang. Wertsachen können bei der Rezeption abgegeben werden, damit diese im Hauptsafe eingeschlossen werden.</p>', 1, CAST(40.00 AS Numeric(5, 2)), 0, 0, 5)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (39, 5004, N'<p>Einzelzimmer mit Dusche, WC, Haarföhn, Telefon, Radio, Flachbildfernseher, gratis W-LAN Internet Zugang. Wertsachen können bei der Rezeption abgegeben werden, damit diese im Hauptsafe eingeschlossen werden.</p>', 1, CAST(40.00 AS Numeric(5, 2)), 0, 0, 5)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (40, 5011, N'<p>Unsere grosszügigen Familienzimmer mit Doppelbett für die Eltern und einem Sofabett für Ihre Kinder. Bei Reisen mit Kleinkindern (unter 2 Jahren) empfehlen wir Ihnen unsere Doppelzimmer, in denen wir Ihnen gern Kinderbetten bereitstellen</p>', 2, CAST(60.00 AS Numeric(5, 2)), 0, 0, 5)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (41, 5012, N'<p>Unsere grosszügigen Familienzimmer mit Doppelbett für die Eltern und einem Sofabett für Ihre Kinder. Bei Reisen mit Kleinkindern (unter 2 Jahren) empfehlen wir Ihnen unsere Doppelzimmer, in denen wir Ihnen gern Kinderbetten bereitstellen</p>', 2, CAST(60.00 AS Numeric(5, 2)), 0, 0, 5)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (42, 5013, N'<p>Unsere grosszügigen Familienzimmer mit Doppelbett für die Eltern und einem Sofabett für Ihre Kinder. Bei Reisen mit Kleinkindern (unter 2 Jahren) empfehlen wir Ihnen unsere Doppelzimmer, in denen wir Ihnen gern Kinderbetten bereitstellen</p>', 2, CAST(60.00 AS Numeric(5, 2)), 0, 0, 5)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (43, 6001, N'<p>Einzelzimmer mit Dusche, WC, Haarföhn, Telefon, Radio, Flachbildfernseher, gratis W-LAN Internet Zugang. Wertsachen können bei der Rezeption abgegeben werden, damit diese im Hauptsafe eingeschlossen werden.</p>', 1, CAST(170.00 AS Numeric(5, 2)), 1, 1, 6)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (44, 6002, N'<p>Einzelzimmer mit Dusche, WC, Haarföhn, Telefon, Radio, Flachbildfernseher, gratis W-LAN Internet Zugang. Wertsachen können bei der Rezeption abgegeben werden, damit diese im Hauptsafe eingeschlossen werden.</p>', 1, CAST(170.00 AS Numeric(5, 2)), 1, 1, 6)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (45, 6003, N'<p>Einzelzimmer mit Dusche, WC, Haarföhn, Telefon, Radio, Flachbildfernseher, gratis W-LAN Internet Zugang. Wertsachen können bei der Rezeption abgegeben werden, damit diese im Hauptsafe eingeschlossen werden.</p>', 1, CAST(170.00 AS Numeric(5, 2)), 1, 1, 6)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (46, 6004, N'<p>Einzelzimmer mit Dusche, WC, Haarföhn, Telefon, Radio, Flachbildfernseher, gratis W-LAN Internet Zugang. Wertsachen können bei der Rezeption abgegeben werden, damit diese im Hauptsafe eingeschlossen werden.</p>', 1, CAST(170.00 AS Numeric(5, 2)), 1, 1, 6)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (47, 6005, N'<p>Einzelzimmer mit Dusche, WC, Haarföhn, Telefon, Radio, Flachbildfernseher, gratis W-LAN Internet Zugang. Wertsachen können bei der Rezeption abgegeben werden, damit diese im Hauptsafe eingeschlossen werden.</p>', 1, CAST(170.00 AS Numeric(5, 2)), 1, 1, 6)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (48, 6011, N'<p>Unsere grosszügigen Familienzimmer mit Doppelbett für die Eltern und einem Sofabett für Ihre Kinder. Bei Reisen mit Kleinkindern (unter 2 Jahren) empfehlen wir Ihnen unsere Doppelzimmer, in denen wir Ihnen gern Kinderbetten bereitstellen</p>', 2, CAST(220.00 AS Numeric(5, 2)), 1, 1, 6)
INSERT [dbo].[Room] ([IdRoom], [Number], [Description], [Type], [Price], [HasTV], [HasHairDryer], [IdHotel]) VALUES (49, 6012, N'<p>Unsere grosszügigen Familienzimmer mit Doppelbett für die Eltern und einem Sofabett für Ihre Kinder. Bei Reisen mit Kleinkindern (unter 2 Jahren) empfehlen wir Ihnen unsere Doppelzimmer, in denen wir Ihnen gern Kinderbetten bereitstellen</p>', 2, CAST(220.00 AS Numeric(5, 2)), 1, 1, 6)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (1, 30)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (2, 30)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (3, 30)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (4, 42)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (5, 42)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (11, 29)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (12, 29)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (20, 27)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (20, 40)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (21, 27)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (21, 40)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (22, 37)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (23, 28)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (23, 37)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (24, 28)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (24, 37)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (25, 28)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (25, 39)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (26, 39)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (27, 40)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (36, 22)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (36, 23)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (36, 25)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (36, 26)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (36, 31)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (37, 22)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (37, 23)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (37, 25)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (37, 26)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (37, 31)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (38, 22)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (38, 23)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (38, 25)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (38, 26)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (38, 31)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (39, 22)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (39, 23)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (39, 25)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (39, 26)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (39, 41)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (40, 22)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (40, 23)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (40, 25)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (40, 26)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (40, 32)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (41, 24)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (41, 26)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (42, 25)
INSERT [dbo].[RoomsInReservation] ([IdRoom], [IdReservation]) VALUES (42, 32)
SET IDENTITY_INSERT [dbo].[UserData] ON 

INSERT [dbo].[UserData] ([IdUser], [FirstName], [LastName], [PasswordMd5], [Email]) VALUES (1, N'Pierre', N'Anken', N'827ccb0eea8a706c4c34a16891f84e7b', N'pierre.anken@gmail.com')
INSERT [dbo].[UserData] ([IdUser], [FirstName], [LastName], [PasswordMd5], [Email]) VALUES (2, N'John', N'Doe', N'827ccb0eea8a706c4c34a16891f84e7b', N'JohnDoe@gmail.com')
INSERT [dbo].[UserData] ([IdUser], [FirstName], [LastName], [PasswordMd5], [Email]) VALUES (3, N'Jean', N'Petit', N'827ccb0eea8a706c4c34a16891f84e7b', N'jean.petit@gmail.com')
INSERT [dbo].[UserData] ([IdUser], [FirstName], [LastName], [PasswordMd5], [Email]) VALUES (4, N'Raoul', N'Bornet', N'827ccb0eea8a706c4c34a16891f84e7b', N'raoul.bornet@gmail.com')
INSERT [dbo].[UserData] ([IdUser], [FirstName], [LastName], [PasswordMd5], [Email]) VALUES (5, N'David', N'Suard', N'827ccb0eea8a706c4c34a16891f84e7b', N'david.suard@gmail.com')
INSERT [dbo].[UserData] ([IdUser], [FirstName], [LastName], [PasswordMd5], [Email]) VALUES (6, N'Sophie', N'Vocat', N'827ccb0eea8a706c4c34a16891f84e7b', N'sophie.vocat@me.com')
INSERT [dbo].[UserData] ([IdUser], [FirstName], [LastName], [PasswordMd5], [Email]) VALUES (7, N'Charlotte', N'Grand', N'827ccb0eea8a706c4c34a16891f84e7b', N'charlotte.grand@me.com')
INSERT [dbo].[UserData] ([IdUser], [FirstName], [LastName], [PasswordMd5], [Email]) VALUES (8, N'Norbert', N'Grosjean', N'827ccb0eea8a706c4c34a16891f84e7b', N'norbet.grosjean@icloud.com')
INSERT [dbo].[UserData] ([IdUser], [FirstName], [LastName], [PasswordMd5], [Email]) VALUES (9, N'Laurent', N'Fasel', N'827ccb0eea8a706c4c34a16891f84e7b', N'Laurent.fasel@me.com')
SET IDENTITY_INSERT [dbo].[UserData] OFF
ALTER TABLE [dbo].[Reservation] ADD  DEFAULT ((0)) FOR [Cancelled]
GO
ALTER TABLE [dbo].[Reservation] ADD  DEFAULT ((0.0)) FOR [Price]
GO
ALTER TABLE [dbo].[Picture]  WITH CHECK ADD  CONSTRAINT [FK_Picture_Room] FOREIGN KEY([IdRoom])
REFERENCES [dbo].[Room] ([IdRoom])
GO
ALTER TABLE [dbo].[Picture] CHECK CONSTRAINT [FK_Picture_Room]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[UserData] ([IdUser])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_User]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_Hotel] FOREIGN KEY([IdHotel])
REFERENCES [dbo].[Hotel] ([IdHotel])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_Hotel]
GO
ALTER TABLE [dbo].[RoomsInReservation]  WITH CHECK ADD  CONSTRAINT [FK_RoomsInReservation_Reservation] FOREIGN KEY([IdReservation])
REFERENCES [dbo].[Reservation] ([IdReservation])
GO
ALTER TABLE [dbo].[RoomsInReservation] CHECK CONSTRAINT [FK_RoomsInReservation_Reservation]
GO
ALTER TABLE [dbo].[RoomsInReservation]  WITH CHECK ADD  CONSTRAINT [FK_RoomsInReservation_Room] FOREIGN KEY([IdRoom])
REFERENCES [dbo].[Room] ([IdRoom])
GO
ALTER TABLE [dbo].[RoomsInReservation] CHECK CONSTRAINT [FK_RoomsInReservation_Room]
GO
