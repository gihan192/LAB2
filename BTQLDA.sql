---câu1
SELECT        dbo.NHANVIEN.HONV + ' ' + dbo.NHANVIEN.TENLOT + ' ' + dbo.NHANVIEN.TENNV AS 'Nhân viên lương cao nhất ', dbo.NHANVIEN.LUONG
FROM          dbo.NHANVIEN INNER JOIN
                dbo.PHONGBAN ON dbo.NHANVIEN.PHG = dbo.PHONGBAN.MAPHG
WHERE        (dbo.NHANVIEN.LUONG >=
                             (SELECT        MAX(NHANVIEN_1.LUONG) AS Expr1
                               FROM            dbo.NHANVIEN AS NHANVIEN_1 INNER JOIN
                                                         dbo.PHONGBAN AS PHONGBAN_1 ON NHANVIEN_1.PHG = PHONGBAN_1.MAPHG
                               WHERE        (PHONGBAN_1.TENPHG = N'Quản lý'))) AND (dbo.PHONGBAN.TENPHG = N'Quản lý')
---câu2
SELECT        HONV + ' ' + TENLOT + ' ' + TENNV AS 'Họ tên nhân viên có lương trung bình trên mức lương trung bình của phòng "Nghiên cứu"', LUONG
FROM            dbo.NHANVIEN
WHERE        (LUONG >
                             (SELECT        AVG(NHANVIEN_1.LUONG) AS Expr1
                               FROM            dbo.NHANVIEN AS NHANVIEN_1 INNER JOIN
                                                         dbo.PHONGBAN ON NHANVIEN_1.PHG = dbo.PHONGBAN.MAPHG
                               WHERE        (dbo.PHONGBAN.TENPHG = N'Nghiên cứu')))
---câu3
SELECT        dbo.PHONGBAN.TENPHG, COUNT(dbo.NHANVIEN.MANV) AS [Số lượng nhân viên], AVG(dbo.NHANVIEN.LUONG) AS [Mức lương trung bình trên 30000]
FROM          dbo.NHANVIEN INNER JOIN
                         dbo.PHONGBAN ON dbo.NHANVIEN.PHG = dbo.PHONGBAN.MAPHG
GROUP BY dbo.PHONGBAN.TENPHG
HAVING        (AVG(dbo.NHANVIEN.LUONG) > 30000)
---câu4
SELECT        dbo.PHONGBAN.TENPHG AS [Tên phòng ban là], COUNT(dbo.DEAN.PHONG) AS [Số lượng đề án của phòng ban đó là]
FROM            dbo.NHANVIEN INNER JOIN
                         dbo.PHONGBAN ON dbo.NHANVIEN.MANV = dbo.PHONGBAN.TRPHG INNER JOIN
                         dbo.DEAN ON dbo.PHONGBAN.MAPHG = dbo.DEAN.PHONG
GROUP BY dbo.PHONGBAN.TENPHG, dbo.NHANVIEN.HONV + ' ' + dbo.NHANVIEN.TENLOT + ' ' + dbo.NHANVIEN.TENNV