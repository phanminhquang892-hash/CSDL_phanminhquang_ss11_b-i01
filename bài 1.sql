/*
Phần A
CALL CancelAppointment(1);
Giải thích:
Stored Procedure hiện tại không kiểm tra trạng thái status trước khi cập nhật. 
Vì vậy, dù lịch khám đã là Completed vẫn bị cập nhật thành Cancelled, dẫn đến sai lệch dữ liệu.

Phần B 
Câu lệnh xóa thủ tục cũ
DROP PROCEDURE IF EXISTS CancelAppointment;

*/


-- viết lại mã lệnh tạo mới
DELIMITER //

CREATE PROCEDURE CancelAppointment(IN p_appointment_id INT)
BEGIN
    UPDATE Appointments
    SET status = 'Cancelled'
    WHERE appointment_id = p_appointment_id
      AND status = 'Pending';
END //


DELIMITER ;