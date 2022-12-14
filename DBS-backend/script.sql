USE [dentist]
GO
SET IDENTITY_INSERT [dbo].[Province] ON 

INSERT [dbo].[Province] ([id], [name]) VALUES (3, N'Đà Nẵng')
INSERT [dbo].[Province] ([id], [name]) VALUES (4, N'Đồng Nai')
INSERT [dbo].[Province] ([id], [name]) VALUES (2, N'Hà Nội')
INSERT [dbo].[Province] ([id], [name]) VALUES (5, N'Hải Phòng')
INSERT [dbo].[Province] ([id], [name]) VALUES (1, N'TP Hồ Chí Minh')
SET IDENTITY_INSERT [dbo].[Province] OFF
GO
SET IDENTITY_INSERT [dbo].[District] ON 

INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (1, N'Quận 1', 1)
INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (2, N'Quận 2', 1)
INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (3, N'Quận 3', 1)
INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (4, N'Quận 4', 1)
INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (5, N'Quận 5', 1)
INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (6, N'Ba Đình', 2)
INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (7, N'Cầu Giấy', 2)
INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (8, N'Đống Đa', 2)
INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (9, N'Hà Đông', 2)
INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (10, N'Hai Bà Trưng', 2)
INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (11, N'Cẩm Lê', 3)
INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (12, N'Hải Châu', 3)
INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (13, N'Liên Chiểu', 3)
INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (14, N'Biên Hòa', 4)
INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (15, N'Cẩm Mỹ', 4)
INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (16, N'Định Quán', 4)
INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (17, N'Đồ Sơn', 5)
INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (18, N'Dương Kinh', 5)
INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (19, N'Hải An', 5)
SET IDENTITY_INSERT [dbo].[District] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([id], [name]) VALUES (1, N'ROLE_ADMIN')
INSERT [dbo].[Role] ([id], [name]) VALUES (2, N'ROLE_USER')
INSERT [dbo].[Role] ([id], [name]) VALUES (3, N'ROLE_STAFF')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [date_of_birth], [email], [full_name], [gender], [password], [phone], [status], [district_id], [role_id]) VALUES (1, CAST(N'2001-09-09' AS Date), N'', N'Bảo Admin', 1, N'$2a$10$95poxOVWF5hdbV.EDGeZMuze3ustiKwHyEsMn4vjsD/NTS5yd0Vla', N'0111111111', CAST(1 AS Decimal(1, 0)), 1, 1)
INSERT [dbo].[Account] ([id], [date_of_birth], [email], [full_name], [gender], [password], [phone], [status], [district_id], [role_id]) VALUES (2, CAST(N'2001-09-27' AS Date), N'', N'Hiếu Staff', 2, N'$2a$10$95poxOVWF5hdbV.EDGeZMuze3ustiKwHyEsMn4vjsD/NTS5yd0Vla', N'0222222222', CAST(1 AS Decimal(1, 0)), 1, 3)
INSERT [dbo].[Account] ([id], [date_of_birth], [email], [full_name], [gender], [password], [phone], [status], [district_id], [role_id]) VALUES (3, CAST(N'2001-03-03' AS Date), N'', N'Anh Staff', 1, N'$2a$10$95poxOVWF5hdbV.EDGeZMuze3ustiKwHyEsMn4vjsD/NTS5yd0Vla', N'0333333333', CAST(1 AS Decimal(1, 0)), 1, 3)
INSERT [dbo].[Account] ([id], [date_of_birth], [email], [full_name], [gender], [password], [phone], [status], [district_id], [role_id]) VALUES (4, CAST(N'2001-06-15' AS Date), N'', N'Phạm Xuân Kiên', 1, N'$2a$10$95poxOVWF5hdbV.EDGeZMuze3ustiKwHyEsMn4vjsD/NTS5yd0Vla', N'0444444444', CAST(1 AS Decimal(1, 0)), 6, 2)
INSERT [dbo].[Account] ([id], [date_of_birth], [email], [full_name], [gender], [password], [phone], [status], [district_id], [role_id]) VALUES (5, CAST(N'2001-07-16' AS Date), N'', N'Nguyễn Trung Hiếu', 1, N'$2a$10$95poxOVWF5hdbV.EDGeZMuze3ustiKwHyEsMn4vjsD/NTS5yd0Vla', N'0555555555', CAST(1 AS Decimal(1, 0)), 8, 2)
INSERT [dbo].[Account] ([id], [date_of_birth], [email], [full_name], [gender], [password], [phone], [status], [district_id], [role_id]) VALUES (6, CAST(N'2001-08-17' AS Date), N'', N'Nguyễn Phan Quỳnh Anh', 2, N'$2a$10$95poxOVWF5hdbV.EDGeZMuze3ustiKwHyEsMn4vjsD/NTS5yd0Vla', N'0666666666', CAST(1 AS Decimal(1, 0)), 15, 2)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Branch] ON 

INSERT [dbo].[Branch] ([id], [close_time], [name], [open_time], [status], [url], [district_id]) VALUES (1, CAST(N'18:00:00' AS Time), N'Chi nhánh 1', CAST(N'07:00:00' AS Time), CAST(1 AS Decimal(1, 0)), N'174In8lBDntk5svw_wfWQJ0HMzztp91CR', 14)
INSERT [dbo].[Branch] ([id], [close_time], [name], [open_time], [status], [url], [district_id]) VALUES (2, CAST(N'19:00:00' AS Time), N'Chi nhánh 2', CAST(N'08:00:00' AS Time), CAST(1 AS Decimal(1, 0)), N'1F8oal-H8l44usjfRBORO7YOWt142DKzr', 3)
SET IDENTITY_INSERT [dbo].[Branch] OFF
GO
SET IDENTITY_INSERT [dbo].[Doctor] ON 

INSERT [dbo].[Doctor] ([id], [description], [name], [status], [url], [branch_id]) VALUES (1, N'Chuyên về các dịch vụ nhổ răng', N'Nguyễn Phan Quỳnh Anh', CAST(1 AS Decimal(1, 0)), N'100-lEx2cOokPvMcwaSET0x6qwAQPeVd9', 1)
INSERT [dbo].[Doctor] ([id], [description], [name], [status], [url], [branch_id]) VALUES (2, N'40 năm kinh nghiệm, chuyên về các dịch vụ trám răng', N'Nguyễn Quốc Bảo', CAST(1 AS Decimal(1, 0)), N'1kbK1M4AWgffySqv8TsrbGy6oFIunTg-_', 1)
INSERT [dbo].[Doctor] ([id], [description], [name], [status], [url], [branch_id]) VALUES (3, N'30 năm kinh nghiệm, chuyên về các dịch vụ nhổ răng', N'Phạm Xuân Kiên', CAST(1 AS Decimal(1, 0)), N'1xjj8DDcXJh2TfvnKpib3O2Jl2uOZqft9', 2)
INSERT [dbo].[Doctor] ([id], [description], [name], [status], [url], [branch_id]) VALUES (4, N'Chuyên đa khoa', N'Nguyễn Trung Hiếu', CAST(1 AS Decimal(1, 0)), N'12f5fVsAO1E3wHwaEkBvvFQP93BnthzTE', 2)
SET IDENTITY_INSERT [dbo].[Doctor] OFF
GO
SET IDENTITY_INSERT [dbo].[Appointment] ON 

INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (1, CAST(N'2022-07-14' AS Date), N'12:00-13:30', N'Phát hiện thêm răng khôn sắp nhú lên, hẹn tái khám để nhổ', CAST(5 AS Decimal(1, 0)), CAST(N'2022-07-15T02:51:40.1160000' AS DateTime2), 4, 1, 1)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (2, CAST(N'2022-07-15' AS Date), N'10:00-11:00', N'Đã xử lý xong răng khôn hẹn tái khám để khử trùng vết thương', CAST(1 AS Decimal(1, 0)), CAST(N'2022-07-15T02:57:06.7440000' AS DateTime2), 4, 1, 1)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (3, CAST(N'2022-07-15' AS Date), N'13:00-14:00', NULL, CAST(5 AS Decimal(1, 0)), CAST(N'2022-07-15T03:00:59.4020000' AS DateTime2), 5, 2, 4)
SET IDENTITY_INSERT [dbo].[Appointment] OFF
GO
SET IDENTITY_INSERT [dbo].[Notification] ON 

INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (1, CAST(N'2022-07-15' AS Date), N'Khuyến mãi mới Khai trương Chi nhánh 2 trong thời gian giới hạn! Bắt đầu từ 15/07/2022 đến 03/09/2022! Ưu đãi 20.0% áp dụng cho dịch vụ: Nhổ răng khôn, Trám răng cao cấp. Chi tiết khuyến mãi: Nhân dịp khai trương chi nhánh 2, RaDe dành tặng đến các khách hàng khuyến mãi 20% cho 1 số dịch vụ, áp dụng cho tất cả chi nhánh trong cả nước', NULL)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (2, CAST(N'2022-07-15' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 12:00 ngày 15-07-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (3, CAST(N'2022-07-15' AS Date), N'Phản hồi của bạn đã được gửi tới trung tâm, cảm ơn bạn đã để lại đánh giá cho RaDe.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (4, CAST(N'2022-07-15' AS Date), N'Phản hồi cho lịch hẹn vào lúc 12:00 ngày 14-07-2022 tại trung tâm nha khoa RaDe Chi nhánh 1 đã được phê duyệt, xin cảm ơn quý khách đã để lại phản hồi tới trung tâm nha khoa RaDe.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (5, CAST(N'2022-07-15' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 13:00 ngày 15-07-2022 tại trung tâm nha khoa RaDe Chi nhánh 2. Nhớ đến đúng giờ nhé <3.', 5)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (6, CAST(N'2022-07-15' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 13:00 ngày 15-07-2022 tại trung tâm nha khoa RaDe Chi nhánh 2. Nhớ đến đúng giờ nhé <3.', 5)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (7, CAST(N'2022-07-15' AS Date), N'Phản hồi của bạn đã được gửi tới trung tâm, cảm ơn bạn đã để lại đánh giá cho RaDe.', 5)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (8, CAST(N'2022-07-15' AS Date), N'Phản hồi cho lịch hẹn vào lúc 13:00 ngày 15-07-2022 tại trung tâm nha khoa RaDe Chi nhánh 2 đã được phê duyệt, xin cảm ơn quý khách đã để lại phản hồi tới trung tâm nha khoa RaDe.', 5)
SET IDENTITY_INSERT [dbo].[Notification] OFF
GO
SET IDENTITY_INSERT [dbo].[Discount] ON 

INSERT [dbo].[Discount] ([id], [description], [end_date], [name], [percentage], [start_date], [status]) VALUES (1, N'Nhân dịp khai trương chi nhánh 2, RaDe dành tặng đến các khách hàng khuyến mãi 20% cho 1 số dịch vụ, áp dụng cho tất cả chi nhánh trong cả nước', CAST(N'2022-09-03' AS Date), N'Khai trương Chi nhánh 2', 20, CAST(N'2022-07-15' AS Date), CAST(1 AS Decimal(1, 0)))
SET IDENTITY_INSERT [dbo].[Discount] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceType] ON 

INSERT [dbo].[ServiceType] ([id], [description], [name]) VALUES (1, N'Các dịch vụ nhổ răng', N'Nhổ răng')
INSERT [dbo].[ServiceType] ([id], [description], [name]) VALUES (2, N'Các dịch vụ trám răng', N'Trám răng')
INSERT [dbo].[ServiceType] ([id], [description], [name]) VALUES (3, N'Các dịch vụ trồng răng, cấy ghép', N'Trồng răng')
INSERT [dbo].[ServiceType] ([id], [description], [name]) VALUES (4, N'Các dịch vụ chỉnh răng, niềng răng', N'Chỉnh răng')
INSERT [dbo].[ServiceType] ([id], [description], [name]) VALUES (5, N'Các dịch vụ phục hồi, chỉnh lại hàm', N'Phục hình hàm')
INSERT [dbo].[ServiceType] ([id], [description], [name]) VALUES (6, N'Các dịch vụ cạo vôi, tẩy trắng răng', N'Khác')
SET IDENTITY_INSERT [dbo].[ServiceType] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([id], [description], [estimated_time], [max_price], [min_price], [name], [status], [url], [service_type_id]) VALUES (1, N'Kỹ thuật nhổ răng là kỹ thuật cơ bản trong lĩnh vực nha khoa. Việc sâu răng hàm và phải thực hiện nhổ răng sẽ khiến cho chức năng nhai, nghiền thức ăn bị ảnh hưởng rất nhiều. Vì thế, nhổ răng sâu hàm trên cần phải cân nhắc thật kỹ và không được tự ý xử lý khi chưa có chỉ định từ bác sĩ. Sau đây là những trường hợp cần phải nhổ răng hàm trên: Răng bị lung lay do bị chấn thương va chạm khiến không thể trở về vị trí như ban đầu được; Răng hàm trên bị sâu nặng ăn đến tủy khiến viêm nhiễm tủy, áp xe chân răng, tiêu xương, tủy chết; Răng khôn mọc ngược, bị lệch đâm vào lợi gây đau nhức.', 0.5, 150000, 100000, N'Nhổ răng sâu', CAST(1 AS Decimal(1, 0)), N'19ybgS94JDVX4ZVh7gGqGD8g7NUMoLo88', 1)
INSERT [dbo].[Service] ([id], [description], [estimated_time], [max_price], [min_price], [name], [status], [url], [service_type_id]) VALUES (2, N'Bước đầu tiên và cũng rất quan trọng trong quy trình nhổ răng khôn chính là tiến hành thăm khám, chụp X-quang răng để đánh giá sự phát triển của răng khôn bao gồm vị trí, kích thước, hướng mọc răng khôn. Khi đó, người bệnh cũng cần khai báo rõ tình trạng sức khỏe, làm các xét nghiệm cần thiết theo chỉ định của bác sĩ để có phương án nhổ răng khôn và xử lý phù hợp. Khi người bệnh đã đáp ứng đầy đủ các tiêu chí về mặt sức khỏe thì sẽ được chỉ định nhổ răng khôn. Tiếp đó, bác sĩ sẽ tiến hành vệ sinh, làm sạch khoang miệng bằng nước súc miệng chuyên dụng để đảm bảo yếu tố vô trùng trong quy trình nhổ răng khôn.', 1, 800000, 500000, N'Nhổ răng khôn', CAST(1 AS Decimal(1, 0)), N'1Hw2Fksh9hR18a7Q6ebLyK4UQJHPN9by-', 1)
INSERT [dbo].[Service] ([id], [description], [estimated_time], [max_price], [min_price], [name], [status], [url], [service_type_id]) VALUES (3, N'Tuỳ theo độ lớn của lỗ sâu, vị trí lỗ sâu, số lượng lỗ sâu và số lượng răng sâu cần trám, bác sĩ sẽ thông báo cụ thể cho bạn thời gian cần thiết để hoàn thành một miếng trám. Trung bình thời gian trám cho một lỗ sâu là 15-20 phút. Nếu các lỗ sâu gần nhau thì có thể trám nhiều răng, do tiết kiệm được thời gian chuẩn bị, thay đổi vị trí các dụng cụ bảo vệ (khuôn trám, đê cao su). Tuy nhiên, há miệng trong một thời gian dài (thường trên 30 phút) có thể ảnh huởng đến hệ thống thái dương hàm như đau khớp, mỏi cơ; vì vậy, các bác sĩ có xu hướng chia ra thành nhiều buổi hẹn để hạn chế áp lực liên tục lên khớp thái dương hàm trong thời gian dài.', 0.5, 500000, 300000, N'Trám răng', CAST(1 AS Decimal(1, 0)), N'1oglU928Upk4Nlc8m-gglpPBzUV77CqzM', 2)
INSERT [dbo].[Service] ([id], [description], [estimated_time], [max_price], [min_price], [name], [status], [url], [service_type_id]) VALUES (4, N'Đây là bước đầu tiên của quy trình trồng răng sứ. Để có thể đưa ra lời tư vấn và lộ trình điều trị chính xác, nha sĩ sẽ phải kiểm tra tình trạng răng miệng hiện tại của người bệnh. Không chỉ kiểm tra bên ngoài, nha sĩ sẽ phải chụp phim để thấy được chiều dài chân răng, chân răng có nhiễm trùng không và mô nha chu. Cần chữa tủy trong trường hợp viêm nhiễm chân răng. Nha sĩ tư vấn cho bạn về loại sứ thích hợp để bạn trồng răng. Lựa chọn 1 trong 4 loại răng sứ đã nêu ở phần trên để tiến hành lấy dấu hàm răng và chế tác răng. Dựa trên dấu hàm răng, bác sĩ sẽ làm răng tạm trong lúc bạn chờ đợi răng sứ được hoàn thiện.', 1, 800000, 600000, N'Trám răng cao cấp', CAST(1 AS Decimal(1, 0)), N'1n5O_52Yl0I3E5FK2pcYLoYkoHFt2gifM', 2)
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (1, 1, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (1, 2, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (2, 2, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (3, 4, 1)
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([id], [content], [status], [time], [appointment_id]) VALUES (1, N'Làm việc rất tận tâm, cũng may có bác sĩ nên phát hiện sớm được cái răng khôn sắp nhú', CAST(1 AS Decimal(1, 0)), CAST(N'2022-07-15' AS Date), 1)
INSERT [dbo].[Feedback] ([id], [content], [status], [time], [appointment_id]) VALUES (2, N'Làm rất kĩ, nhanh gọn lẹ mà giá cả cũng phải chăng, còn có giảm giá nữa', CAST(1 AS Decimal(1, 0)), CAST(N'2022-07-15' AS Date), 3)
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
INSERT [dbo].[Discount_Service] ([discount_id], [service_id]) VALUES (1, 2)
INSERT [dbo].[Discount_Service] ([discount_id], [service_id]) VALUES (1, 4)
GO
