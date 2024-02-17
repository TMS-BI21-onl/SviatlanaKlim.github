
SELECT C.[PassportID], D.[DeliveryType], P.[PayType], PR.[Name], S.[Status], V.[WebURL],[Quantity],[Orderdate],[TotalPrice],[StatusChange]
FROM [dbo].[Orders] O
JOIN [dbo].[Client] C ON O.[ClientID] = C.[ClientID]
JOIN [dbo].[Delivery] D ON O.[DeliveryID] = D.[DeliveryID]
JOIN [dbo].[Pay] P ON O.[PayTypeID] = P.[PayTypeID]
JOIN [dbo].[Product] PR ON O.[ProductID] = PR.[ProductID]
JOIN [dbo].[Status] S ON O.[StatusID] = S.[StatusID]
JOIN [dbo].[Vendor] V ON O.[VendorID] = V.[VendorID]
WHERE O.[OrderID] IN ('100635', '18338', '100630', '270854', '1000000', '77556', '954213', '95873', '996532', '248757')


Удаляла, строки, т.к. ошиблась
delete
FROM [dbo].[Orders]
WHERE [OrderID] >= 1000015


SELECT * FROM [dbo].[Orders]
WHERE [OrderID] > 1000010


SELECT COUNT (1)
FROM [dbo].[Orders]




