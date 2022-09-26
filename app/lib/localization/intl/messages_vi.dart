// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a vi locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'vi';

  static String m0(courseType, hour, dateMonth) =>
      "Báo nghỉ ${courseType} lúc ${hour} ngày ${dateMonth}";

  static String m1(time) => "Lý do được xác nhận vào ${time}";

  static String m2(userType) =>
      "Giúp ${userType} và bộ phận hỗ trợ nắm thông tin.";

  static String m3(days) => "${days} ngày trước";

  static String m4(selectedItem) =>
      "${selectedItem} đã xoá sẽ không thể khôi phục bạn có chắc muốn xoá?";

  static String m5(courseId) => "Chi tiết của khoá học #${courseId}";

  static String m6(content) => "Nhập ${content}";

  static String m7(name) => "Xin chào ${name}";

  static String m8(hours) => "${hours} giờ trước";

  static String m9(minutes) => "${minutes} phút trước";

  static String m10(content) => "Vui lòng nhập ${content}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "aborted": MessageLookupByLibrary.simpleMessage("Bỏ qua"),
        "about_this_teacher":
            MessageLookupByLibrary.simpleMessage("Về giáo viên này"),
        "absence_at": m0,
        "absence_confirmed_at": m1,
        "absence_course":
            MessageLookupByLibrary.simpleMessage("Báo vắng khóa học"),
        "absence_fail":
            MessageLookupByLibrary.simpleMessage("Báo nghỉ không thành công"),
        "absence_infomation": m2,
        "absence_notice": MessageLookupByLibrary.simpleMessage("Báo vắng"),
        "absence_rule":
            MessageLookupByLibrary.simpleMessage("Quy định báo nghỉ"),
        "absence_unsuccessfully": MessageLookupByLibrary.simpleMessage(
            "Báo nghỉ không thành công! Vui lòng kiểm tra lại thời gian báo nghỉ và thử lại."),
        "accept": MessageLookupByLibrary.simpleMessage("Chấp nhận"),
        "account": MessageLookupByLibrary.simpleMessage("Tài khoản"),
        "account_info":
            MessageLookupByLibrary.simpleMessage("Thông tin tài khoản"),
        "achieved_roadmap":
            MessageLookupByLibrary.simpleMessage("Lộ trình đã đạt"),
        "achievement": MessageLookupByLibrary.simpleMessage("Thành tựu"),
        "add": MessageLookupByLibrary.simpleMessage("Thêm"),
        "add_voucher": MessageLookupByLibrary.simpleMessage("Thêm voucher"),
        "add_your_goal":
            MessageLookupByLibrary.simpleMessage("Thêm mục tiêu của bạn"),
        "address": MessageLookupByLibrary.simpleMessage("Địa chỉ"),
        "afternoon": MessageLookupByLibrary.simpleMessage("Chiều"),
        "age": MessageLookupByLibrary.simpleMessage("Tuổi"),
        "all": MessageLookupByLibrary.simpleMessage("Tất cả"),
        "all_courses": MessageLookupByLibrary.simpleMessage("Tất cả khoá học"),
        "all_sessions": MessageLookupByLibrary.simpleMessage("Tất cả buổi học"),
        "all_teacher": MessageLookupByLibrary.simpleMessage("Tất cả giáo viên"),
        "antoree": MessageLookupByLibrary.simpleMessage("Antoree"),
        "app_version":
            MessageLookupByLibrary.simpleMessage("Phiên bản ứng dụng"),
        "apply": MessageLookupByLibrary.simpleMessage("Áp dụng"),
        "april": MessageLookupByLibrary.simpleMessage("Tháng 4"),
        "april_s": MessageLookupByLibrary.simpleMessage("Apr"),
        "attendance_rate":
            MessageLookupByLibrary.simpleMessage("Tỉ lệ chuyên cần"),
        "august": MessageLookupByLibrary.simpleMessage("Tháng 8"),
        "august_s": MessageLookupByLibrary.simpleMessage("Aug"),
        "available_courses":
            MessageLookupByLibrary.simpleMessage("Khóa học hiện có"),
        "available_slot": MessageLookupByLibrary.simpleMessage("Có thể chọn"),
        "available_time": MessageLookupByLibrary.simpleMessage("Lịch rảnh"),
        "back": MessageLookupByLibrary.simpleMessage("Quay lại"),
        "back_to_home": MessageLookupByLibrary.simpleMessage("Về trang chủ"),
        "begin": MessageLookupByLibrary.simpleMessage("Bắt đầu"),
        "birthday": MessageLookupByLibrary.simpleMessage("Ngày sinh"),
        "book_schedule": MessageLookupByLibrary.simpleMessage("Chọn lịch"),
        "can_not_open": MessageLookupByLibrary.simpleMessage("Không mở được"),
        "cancel": MessageLookupByLibrary.simpleMessage("Huỷ"),
        "cancel_request": MessageLookupByLibrary.simpleMessage("Hủy yêu cầu"),
        "cancel_schedule": MessageLookupByLibrary.simpleMessage("Huỷ lịch"),
        "cancel_selected": MessageLookupByLibrary.simpleMessage("Bỏ chọn"),
        "cancelled": MessageLookupByLibrary.simpleMessage("Đã huỷ"),
        "carer": MessageLookupByLibrary.simpleMessage("người hỗ trợ"),
        "certificate": MessageLookupByLibrary.simpleMessage("bằng cấp"),
        "change_calendar": MessageLookupByLibrary.simpleMessage("Đổi lịch"),
        "change_password": MessageLookupByLibrary.simpleMessage("Đổi mật khẩu"),
        "change_password_successfully": MessageLookupByLibrary.simpleMessage(
            "Thay đổi mật khẩu thành công"),
        "change_teacher": MessageLookupByLibrary.simpleMessage("Đổi giáo viên"),
        "change_topic": MessageLookupByLibrary.simpleMessage("Đổi chủ đề"),
        "child": MessageLookupByLibrary.simpleMessage("Trẻ em"),
        "choose_another_date":
            MessageLookupByLibrary.simpleMessage("Xin hãy chọn ngày khác"),
        "choose_date": MessageLookupByLibrary.simpleMessage("Chọn ngày"),
        "choose_field_of_work":
            MessageLookupByLibrary.simpleMessage("Chọn lĩnh vực"),
        "choose_gender":
            MessageLookupByLibrary.simpleMessage("Hãy chọn giới tính"),
        "choose_nationality":
            MessageLookupByLibrary.simpleMessage("Chon quốc tịch"),
        "choose_session": MessageLookupByLibrary.simpleMessage("Chọn buổi học"),
        "choose_study_program":
            MessageLookupByLibrary.simpleMessage("Hãy chọn chương trình học"),
        "choose_suitable_price":
            MessageLookupByLibrary.simpleMessage("Chọn mức học phí tham gia"),
        "choose_teacher":
            MessageLookupByLibrary.simpleMessage("Chọn giáo viên"),
        "choose_time": MessageLookupByLibrary.simpleMessage("Chọn thời gian"),
        "choose_user": MessageLookupByLibrary.simpleMessage("Chọn người dùng"),
        "close": MessageLookupByLibrary.simpleMessage("Đóng"),
        "closed": MessageLookupByLibrary.simpleMessage("Đã đóng"),
        "closing": MessageLookupByLibrary.simpleMessage("Đang đóng"),
        "coming_soon": MessageLookupByLibrary.simpleMessage("Sắp ra mắt"),
        "common_goal":
            MessageLookupByLibrary.simpleMessage("Mục tiêu thường gặp"),
        "compare_the_results":
            MessageLookupByLibrary.simpleMessage("So sánh kết quả"),
        "complete": MessageLookupByLibrary.simpleMessage("Hoàn thành"),
        "completed": MessageLookupByLibrary.simpleMessage("Đã hoàn thành"),
        "completed_roadmap":
            MessageLookupByLibrary.simpleMessage("Lộ trình hoàn thành"),
        "confirm": MessageLookupByLibrary.simpleMessage("Xác nhận"),
        "confirm_information":
            MessageLookupByLibrary.simpleMessage("Xác nhận thông tin"),
        "confirm_password":
            MessageLookupByLibrary.simpleMessage("Nhập lại mật khẩu"),
        "confirm_session":
            MessageLookupByLibrary.simpleMessage("Xác nhận buổi học"),
        "confirm_voucher":
            MessageLookupByLibrary.simpleMessage("Áp dụng voucher"),
        "confirm_your_request":
            MessageLookupByLibrary.simpleMessage("Xác nhận yêu cầu"),
        "connection_error": MessageLookupByLibrary.simpleMessage("Lỗi kết nối"),
        "connection_lost":
            MessageLookupByLibrary.simpleMessage("Không có kết nối mạng"),
        "contact_antoree":
            MessageLookupByLibrary.simpleMessage("Liên hệ Antoree"),
        "course": MessageLookupByLibrary.simpleMessage("Khóa học"),
        "course_absence_dialog_body": MessageLookupByLibrary.simpleMessage(
            "Các khoá được chọn sẽ tạm hoãn đến khi quý học viên bắt đầu học lại"),
        "course_absence_notice":
            MessageLookupByLibrary.simpleMessage("Báo vắng khóa học"),
        "course_detail":
            MessageLookupByLibrary.simpleMessage("Chi tiết khoá học"),
        "course_duration":
            MessageLookupByLibrary.simpleMessage("Thời lượng khóa học"),
        "course_id": MessageLookupByLibrary.simpleMessage("Mã khoá học"),
        "course_id_s": MessageLookupByLibrary.simpleMessage("ID khoá học"),
        "course_not_found":
            MessageLookupByLibrary.simpleMessage("Không tìm thấy khóa học"),
        "course_policy":
            MessageLookupByLibrary.simpleMessage("Chính sách khóa học"),
        "course_register":
            MessageLookupByLibrary.simpleMessage("Đăng ký khóa học"),
        "course_s": MessageLookupByLibrary.simpleMessage("Khóa"),
        "course_session":
            MessageLookupByLibrary.simpleMessage("Buổi học trong khoá"),
        "course_short": MessageLookupByLibrary.simpleMessage("Khóa"),
        "create_an_account":
            MessageLookupByLibrary.simpleMessage("Tạo tài khoản"),
        "create_profile": MessageLookupByLibrary.simpleMessage("Tạo hồ sơ"),
        "create_session_feedback":
            MessageLookupByLibrary.simpleMessage("Tạo nhận xét buổi học"),
        "create_test_result":
            MessageLookupByLibrary.simpleMessage("Tạo kết quả kiểm tra"),
        "current_password":
            MessageLookupByLibrary.simpleMessage("Mật khẩu hiện tại"),
        "current_password_wrong": MessageLookupByLibrary.simpleMessage(
            "Mật khẩu hiện tại không đúng"),
        "day": MessageLookupByLibrary.simpleMessage("ngày"),
        "day_started": MessageLookupByLibrary.simpleMessage("Ngày bắt đầu"),
        "days": MessageLookupByLibrary.simpleMessage("ngày"),
        "days_relative": m3,
        "december": MessageLookupByLibrary.simpleMessage("Tháng 12"),
        "december_s": MessageLookupByLibrary.simpleMessage("Dec"),
        "delay": MessageLookupByLibrary.simpleMessage("Tạm hoãn"),
        "delete": MessageLookupByLibrary.simpleMessage("Xóa"),
        "delete_account": MessageLookupByLibrary.simpleMessage("Xoá tài khoản"),
        "delete_warning": m4,
        "detail": MessageLookupByLibrary.simpleMessage("Chi tiết"),
        "detail_of_course": m5,
        "detail_reason": MessageLookupByLibrary.simpleMessage("Chi tiết lý do"),
        "dismiss": MessageLookupByLibrary.simpleMessage("Bỏ qua"),
        "do_not_have": MessageLookupByLibrary.simpleMessage("Không có"),
        "done": MessageLookupByLibrary.simpleMessage("Xong"),
        "dont_have_an_account":
            MessageLookupByLibrary.simpleMessage("Không có tài khoản?"),
        "email_or_phone_number":
            MessageLookupByLibrary.simpleMessage("Email hoặc số điện thoại"),
        "empty_absence_history": MessageLookupByLibrary.simpleMessage(
            "Bạn đi học quá chuyên cần chúng tôi không thể tìm thấy được buổi nghỉ nào"),
        "empty_course": MessageLookupByLibrary.simpleMessage(
            "Không có khoá học được tìm thấy"),
        "empty_title":
            MessageLookupByLibrary.simpleMessage("Ở đây hơi trống vắng"),
        "english_for_adult":
            MessageLookupByLibrary.simpleMessage("Tiếng Anh cho người lớn"),
        "english_for_chid_student": MessageLookupByLibrary.simpleMessage(
            "Tiếng anh cho trẻ em, học sinh "),
        "english_for_kid":
            MessageLookupByLibrary.simpleMessage("Tiếng Anh cho bé"),
        "enter_otp_sent_via_your_sms": MessageLookupByLibrary.simpleMessage(
            "Nhập mã OTP đã gửi qua SMS của bạn"),
        "enter_sent_otp": MessageLookupByLibrary.simpleMessage("Nhập mã OTP"),
        "enter_value": m6,
        "enter_your_new_password":
            MessageLookupByLibrary.simpleMessage("Nhập mật khẩu mới"),
        "enter_your_registered_phone_number":
            MessageLookupByLibrary.simpleMessage(
                "Nhập số điện thoại đã đăng ký "),
        "error": MessageLookupByLibrary.simpleMessage("Lỗi"),
        "error_fixing": MessageLookupByLibrary.simpleMessage(
            "Có lỗi xảy ra, chúng tôi đang khắc phục"),
        "evaluate_session":
            MessageLookupByLibrary.simpleMessage("Đánh giá buổi học"),
        "evening": MessageLookupByLibrary.simpleMessage("Tối"),
        "explore_page": MessageLookupByLibrary.simpleMessage("Khám phá"),
        "extend": MessageLookupByLibrary.simpleMessage("Gia hạn thêm"),
        "extend_course":
            MessageLookupByLibrary.simpleMessage("Gia hạn khóa học"),
        "extend_duration_learn":
            MessageLookupByLibrary.simpleMessage("Gia hạn giờ học"),
        "february": MessageLookupByLibrary.simpleMessage("Tháng 2"),
        "february_s": MessageLookupByLibrary.simpleMessage("Feb"),
        "female": MessageLookupByLibrary.simpleMessage("Nữ"),
        "few_seconds_ago":
            MessageLookupByLibrary.simpleMessage("Vài giây trước"),
        "field_of_work":
            MessageLookupByLibrary.simpleMessage("Lĩnh vực làm việc"),
        "find_favorite_teacher":
            MessageLookupByLibrary.simpleMessage("Tìm giáo viên yêu thích"),
        "find_new_teacher_here":
            MessageLookupByLibrary.simpleMessage("Tìm giáo viên mới tại đây"),
        "five_recent_results":
            MessageLookupByLibrary.simpleMessage("5 kết quả gần nhất"),
        "fixed_flexible":
            MessageLookupByLibrary.simpleMessage("Cố định và linh hoạt"),
        "flexible": MessageLookupByLibrary.simpleMessage("Linh động"),
        "flexibleV2": MessageLookupByLibrary.simpleMessage("Linh hoạt"),
        "for_someone": MessageLookupByLibrary.simpleMessage("Dành cho"),
        "for_vietnamese_teachers":
            MessageLookupByLibrary.simpleMessage("Đối với giáo viên Việt Nam"),
        "foreign": MessageLookupByLibrary.simpleMessage("Nước ngoài"),
        "foreign_teacher":
            MessageLookupByLibrary.simpleMessage("Giáo viên Quốc Tế"),
        "forgot_password":
            MessageLookupByLibrary.simpleMessage("Quên mật khẩu?"),
        "free": MessageLookupByLibrary.simpleMessage("Miễn phí"),
        "friday": MessageLookupByLibrary.simpleMessage("Thứ sáu"),
        "friday_s": MessageLookupByLibrary.simpleMessage("T6"),
        "friend_referral":
            MessageLookupByLibrary.simpleMessage("Giới thiệu bạn bè"),
        "full": MessageLookupByLibrary.simpleMessage("Đầy đủ"),
        "full_name": MessageLookupByLibrary.simpleMessage("Họ và tên"),
        "gender": MessageLookupByLibrary.simpleMessage("Giới tính"),
        "get_now": MessageLookupByLibrary.simpleMessage("Nhận ngay"),
        "goal": MessageLookupByLibrary.simpleMessage("Mục tiêu"),
        "grammar": MessageLookupByLibrary.simpleMessage("Ngữ pháp"),
        "group_of_English_teachers":
            MessageLookupByLibrary.simpleMessage("Nhóm giáo viên"),
        "happening": MessageLookupByLibrary.simpleMessage("Đang diễn ra"),
        "hello": MessageLookupByLibrary.simpleMessage("Xin chào"),
        "hello_someone": m7,
        "help_center":
            MessageLookupByLibrary.simpleMessage("Trung tâm trợ giúp"),
        "hide": MessageLookupByLibrary.simpleMessage("Ẩn"),
        "history": MessageLookupByLibrary.simpleMessage("Lịch sử"),
        "home": MessageLookupByLibrary.simpleMessage("Trang chủ"),
        "home_work": MessageLookupByLibrary.simpleMessage("Bài tập về nhà"),
        "homework": MessageLookupByLibrary.simpleMessage("Bài tập về nhà"),
        "homework_summary":
            MessageLookupByLibrary.simpleMessage("Tổng hợp bài tập về nhà"),
        "hour": MessageLookupByLibrary.simpleMessage("giờ"),
        "hours": MessageLookupByLibrary.simpleMessage("giờ"),
        "hours_relative": m8,
        "i_got_it": MessageLookupByLibrary.simpleMessage("Tôi hiểu rồi"),
        "implementing_feature": MessageLookupByLibrary.simpleMessage(
            "Tính năng đang được xây dựng"),
        "implementing_feature_detail": MessageLookupByLibrary.simpleMessage(
            "Chúng tôi đang xây dựng tính năng này"),
        "infomation": MessageLookupByLibrary.simpleMessage("Thông tin"),
        "information_support":
            MessageLookupByLibrary.simpleMessage("Thông tin & Hỗ trợ"),
        "internet_connection_lost":
            MessageLookupByLibrary.simpleMessage("Mất kết nối internet"),
        "invalid_email_or_phone_number": MessageLookupByLibrary.simpleMessage(
            "Email hoặc số điện thoại không hợp lệ"),
        "invalid_format_or_value_error": MessageLookupByLibrary.simpleMessage(
            "Lỗi định dạng hoặc giá trị không đúng"),
        "invalid_password":
            MessageLookupByLibrary.simpleMessage("Mật khẩu hợp lệ"),
        "invalid_phone_number":
            MessageLookupByLibrary.simpleMessage("Số điện thoại không hợp lệ"),
        "january": MessageLookupByLibrary.simpleMessage("Tháng 1"),
        "january_s": MessageLookupByLibrary.simpleMessage("Jan"),
        "join": MessageLookupByLibrary.simpleMessage("Tham gia"),
        "july": MessageLookupByLibrary.simpleMessage("Tháng 7"),
        "july_s": MessageLookupByLibrary.simpleMessage("Jul"),
        "june": MessageLookupByLibrary.simpleMessage("Tháng 6"),
        "june_s": MessageLookupByLibrary.simpleMessage("Jun"),
        "lastest_reviews":
            MessageLookupByLibrary.simpleMessage("Đánh giá mới nhất"),
        "late_night": MessageLookupByLibrary.simpleMessage("Khuya"),
        "later": MessageLookupByLibrary.simpleMessage("Để sau"),
        "learn": MessageLookupByLibrary.simpleMessage("Học"),
        "learn_english_online_1_on_1":
            MessageLookupByLibrary.simpleMessage("Học tiếng Anh 1 kèm 1"),
        "learning_topic": MessageLookupByLibrary.simpleMessage("Chủ đề học"),
        "learnt": MessageLookupByLibrary.simpleMessage("Đã học"),
        "lession": MessageLookupByLibrary.simpleMessage("Bài học"),
        "let_antoree_help_you":
            MessageLookupByLibrary.simpleMessage("Hay để Antoree giúp bạn nào"),
        "let_go": MessageLookupByLibrary.simpleMessage("Bắt đầu"),
        "list_videos": MessageLookupByLibrary.simpleMessage("Danh sách videos"),
        "log_in": MessageLookupByLibrary.simpleMessage("Đăng nhập"),
        "log_out": MessageLookupByLibrary.simpleMessage("Đăng xuất"),
        "log_out_confirmation": MessageLookupByLibrary.simpleMessage(
            "Bạn có muốn đăng xuất khỏi thiết bị này?"),
        "login_failed":
            MessageLookupByLibrary.simpleMessage("Đăng nhập thất bại"),
        "login_failed_incorrect_authentication":
            MessageLookupByLibrary.simpleMessage(
                "Sai tên đăng nhập hoặc mật khẩu"),
        "login_to_continue":
            MessageLookupByLibrary.simpleMessage("Đăng nhập để tiếp tục"),
        "main_course": MessageLookupByLibrary.simpleMessage("Khoá chính"),
        "male": MessageLookupByLibrary.simpleMessage("Nam"),
        "march": MessageLookupByLibrary.simpleMessage("Tháng 3"),
        "march_s": MessageLookupByLibrary.simpleMessage("Mar"),
        "may": MessageLookupByLibrary.simpleMessage("Tháng 5"),
        "may_s": MessageLookupByLibrary.simpleMessage("May"),
        "message": MessageLookupByLibrary.simpleMessage("Tin nhắn"),
        "message_customer_care":
            MessageLookupByLibrary.simpleMessage("Nhắn tin CSKH"),
        "minute": MessageLookupByLibrary.simpleMessage("phút"),
        "minutes": MessageLookupByLibrary.simpleMessage("phút"),
        "minutes_relative": m9,
        "monday": MessageLookupByLibrary.simpleMessage("Thứ hai"),
        "monday_s": MessageLookupByLibrary.simpleMessage("T2"),
        "month": MessageLookupByLibrary.simpleMessage("tháng"),
        "months": MessageLookupByLibrary.simpleMessage("tháng"),
        "more": MessageLookupByLibrary.simpleMessage("Thêm"),
        "morning": MessageLookupByLibrary.simpleMessage("Sáng"),
        "my_profile": MessageLookupByLibrary.simpleMessage("Hồ sơ của tôi"),
        "nationality": MessageLookupByLibrary.simpleMessage("Quốc tịch"),
        "new_password": MessageLookupByLibrary.simpleMessage("Mật khẩu mới"),
        "next": MessageLookupByLibrary.simpleMessage("Tiếp tục"),
        "next_session": MessageLookupByLibrary.simpleMessage("Buổi tiếp theo"),
        "next_sessionV2":
            MessageLookupByLibrary.simpleMessage("Buổi học tiếp theo"),
        "next_session_in":
            MessageLookupByLibrary.simpleMessage("Buổi học sẽ bắt đầu sau "),
        "night": MessageLookupByLibrary.simpleMessage("Tối"),
        "no": MessageLookupByLibrary.simpleMessage("Không"),
        "no_available_teacher":
            MessageLookupByLibrary.simpleMessage("Không tìm thấy giáo viên"),
        "no_available_teacher_prompt": MessageLookupByLibrary.simpleMessage(
            "Không có giáo viên rãnh vào thời gian bạn đã chọn. Xin hãy chọn giờ khác"),
        "no_course": MessageLookupByLibrary.simpleMessage("Không có khóa học"),
        "no_goal_yet": MessageLookupByLibrary.simpleMessage("Chưa có mục tiêu"),
        "no_internet_connectivity":
            MessageLookupByLibrary.simpleMessage("Không có kết nối internet"),
        "no_notification":
            MessageLookupByLibrary.simpleMessage("Không có thông báo"),
        "no_review_from_teacher": MessageLookupByLibrary.simpleMessage(
            "Hiện chưa có đánh giá định kì"),
        "no_session": MessageLookupByLibrary.simpleMessage("Không có buổi học"),
        "no_upcoming_course": MessageLookupByLibrary.simpleMessage(
            "Không có buổi học sắp diễn ra"),
        "not_happened": MessageLookupByLibrary.simpleMessage("Không diễn ra"),
        "note_for_student":
            MessageLookupByLibrary.simpleMessage("Ghi chú cho học viên"),
        "notes": MessageLookupByLibrary.simpleMessage("Ghi chú"),
        "notification": MessageLookupByLibrary.simpleMessage("Thông báo"),
        "november": MessageLookupByLibrary.simpleMessage("Tháng 11"),
        "november_s": MessageLookupByLibrary.simpleMessage("Nov"),
        "now": MessageLookupByLibrary.simpleMessage("Bây giờ"),
        "october": MessageLookupByLibrary.simpleMessage("Tháng 10"),
        "october_s": MessageLookupByLibrary.simpleMessage("Oct"),
        "ok": MessageLookupByLibrary.simpleMessage("Đồng ý"),
        "old_password": MessageLookupByLibrary.simpleMessage("Mật khẩu cũ"),
        "open": MessageLookupByLibrary.simpleMessage("Hoạt động"),
        "opening": MessageLookupByLibrary.simpleMessage("Đang mở"),
        "optional": MessageLookupByLibrary.simpleMessage("Tuỳ chọn"),
        "or": MessageLookupByLibrary.simpleMessage("hoặc"),
        "other": MessageLookupByLibrary.simpleMessage("Khác"),
        "other_error": MessageLookupByLibrary.simpleMessage("Lỗi khác"),
        "other_reason": MessageLookupByLibrary.simpleMessage("Lý do khác"),
        "overview": MessageLookupByLibrary.simpleMessage("Tổng quan"),
        "password": MessageLookupByLibrary.simpleMessage("Mật khẩu"),
        "pending": MessageLookupByLibrary.simpleMessage("Trì hoãn"),
        "personal_infomation":
            MessageLookupByLibrary.simpleMessage("Thông tin cá nhân"),
        "personal_preference":
            MessageLookupByLibrary.simpleMessage("Nhu cầu cá nhân"),
        "personals_goal":
            MessageLookupByLibrary.simpleMessage("Mục tiêu cá nhân"),
        "phone_number": MessageLookupByLibrary.simpleMessage("Số điện thoại"),
        "pick": MessageLookupByLibrary.simpleMessage("chọn"),
        "picked": MessageLookupByLibrary.simpleMessage("Đã chọn"),
        "please_enter": m10,
        "please_enter_signed_phone_number":
            MessageLookupByLibrary.simpleMessage(
                "Vui lòng nhập số điện thoại đã đăng ký"),
        "present": MessageLookupByLibrary.simpleMessage("Bây giờ"),
        "profile": MessageLookupByLibrary.simpleMessage("Hồ sơ"),
        "promo_gift": MessageLookupByLibrary.simpleMessage("Ưu đãi đổi quà"),
        "quick_join": MessageLookupByLibrary.simpleMessage("Tham gia ngay"),
        "reason": MessageLookupByLibrary.simpleMessage("Lý do"),
        "receive": MessageLookupByLibrary.simpleMessage("Nhận"),
        "referral": MessageLookupByLibrary.simpleMessage("Mã giới thiệu"),
        "regions": MessageLookupByLibrary.simpleMessage("Vùng miền"),
        "register": MessageLookupByLibrary.simpleMessage("Đăng ký"),
        "register_duration":
            MessageLookupByLibrary.simpleMessage("thời lượng đăng ký"),
        "register_new_course":
            MessageLookupByLibrary.simpleMessage("Đăng ký khoá mới"),
        "reject": MessageLookupByLibrary.simpleMessage("Từ chối"),
        "rejected": MessageLookupByLibrary.simpleMessage("Đã"),
        "remove_seleted": MessageLookupByLibrary.simpleMessage("Bỏ đã chọn"),
        "request": MessageLookupByLibrary.simpleMessage("Yêu cầu"),
        "request_cancelled_prematurely":
            MessageLookupByLibrary.simpleMessage("Yêu cầu bị hủy sớm"),
        "request_failed": MessageLookupByLibrary.simpleMessage(
            "Yêu cầu bị thất bại, vui lòng thử lại sau ít phút"),
        "request_for_extension":
            MessageLookupByLibrary.simpleMessage("Yêu cầu gia hạn"),
        "required": MessageLookupByLibrary.simpleMessage("Không bỏ trống"),
        "required_field": MessageLookupByLibrary.simpleMessage(
            "Thông tin này không được để trống"),
        "resend_otp_after":
            MessageLookupByLibrary.simpleMessage("Gửi lại mã sau "),
        "reset_account_password":
            MessageLookupByLibrary.simpleMessage("Đặt lại mật khẩu"),
        "result": MessageLookupByLibrary.simpleMessage("Kết quả"),
        "roadmap": MessageLookupByLibrary.simpleMessage("Lộ trình"),
        "saturday": MessageLookupByLibrary.simpleMessage("Thứ bảy"),
        "saturday_s": MessageLookupByLibrary.simpleMessage("T7"),
        "save": MessageLookupByLibrary.simpleMessage("Lưu"),
        "schedule": MessageLookupByLibrary.simpleMessage("Lịch học"),
        "scheduled_session":
            MessageLookupByLibrary.simpleMessage("Buổi học dự kiến"),
        "score": MessageLookupByLibrary.simpleMessage("Điểm"),
        "search": MessageLookupByLibrary.simpleMessage("Tìm kiếm"),
        "see_more": MessageLookupByLibrary.simpleMessage("Xem thêm"),
        "select_all": MessageLookupByLibrary.simpleMessage("Chọn tất cả"),
        "selected": MessageLookupByLibrary.simpleMessage("Đã chọn"),
        "send_feedback": MessageLookupByLibrary.simpleMessage("Gửi phản hồi"),
        "send_notify": MessageLookupByLibrary.simpleMessage("Gửi thông báo"),
        "september": MessageLookupByLibrary.simpleMessage("Tháng 9"),
        "september_s": MessageLookupByLibrary.simpleMessage("Sep"),
        "serrver_error": MessageLookupByLibrary.simpleMessage("Lỗi máy chủ"),
        "service_feedback":
            MessageLookupByLibrary.simpleMessage("Phản hồi dịch vụ"),
        "session": MessageLookupByLibrary.simpleMessage("Buổi học"),
        "session_absence":
            MessageLookupByLibrary.simpleMessage("Báo vắng buổi học"),
        "session_absence_notice":
            MessageLookupByLibrary.simpleMessage("Báo vắng buổi học"),
        "session_content":
            MessageLookupByLibrary.simpleMessage("Nội dung buổi học"),
        "session_not_found":
            MessageLookupByLibrary.simpleMessage("Không tìm thấy buổi học"),
        "session_rating":
            MessageLookupByLibrary.simpleMessage("Mức độ hài lòng của bạn"),
        "session_short": MessageLookupByLibrary.simpleMessage("Buổi"),
        "session_video": MessageLookupByLibrary.simpleMessage("Video buổi học"),
        "show": MessageLookupByLibrary.simpleMessage("Hiển thị"),
        "sign_in": MessageLookupByLibrary.simpleMessage("Đăng nhập"),
        "sign_out": MessageLookupByLibrary.simpleMessage("Đăng xuất"),
        "sign_up": MessageLookupByLibrary.simpleMessage("Đăng ký"),
        "sort_by": MessageLookupByLibrary.simpleMessage("Sắp xếp bằng"),
        "spread_antoree":
            MessageLookupByLibrary.simpleMessage("Lan tỏa Antoree"),
        "submit_home_work":
            MessageLookupByLibrary.simpleMessage("Nộp bài tập về nhà"),
        "submit_home_work_short":
            MessageLookupByLibrary.simpleMessage("Nộp bài tập"),
        "sunday": MessageLookupByLibrary.simpleMessage("Chủ Nhật"),
        "sunday_s": MessageLookupByLibrary.simpleMessage("CN"),
        "support": MessageLookupByLibrary.simpleMessage("Hỗ trợ"),
        "teacher": MessageLookupByLibrary.simpleMessage("Giáo viên"),
        "teacher_attitude":
            MessageLookupByLibrary.simpleMessage("Thái độ giáo viên"),
        "teaching_method":
            MessageLookupByLibrary.simpleMessage("Phương pháp giảng dạy"),
        "terms_of_service":
            MessageLookupByLibrary.simpleMessage("Điều khoản dịch vụ"),
        "test_result": MessageLookupByLibrary.simpleMessage("Kết quả kiểm tra"),
        "thursday": MessageLookupByLibrary.simpleMessage("Thứ năm"),
        "thursday_s": MessageLookupByLibrary.simpleMessage("T5"),
        "times": MessageLookupByLibrary.simpleMessage("Thời gian"),
        "to_continue": MessageLookupByLibrary.simpleMessage("Tiếp tục"),
        "to_pay": MessageLookupByLibrary.simpleMessage("Thanh toán"),
        "today": MessageLookupByLibrary.simpleMessage("Hôm nay"),
        "today_course":
            MessageLookupByLibrary.simpleMessage("Khóa học hôm nay"),
        "today_session":
            MessageLookupByLibrary.simpleMessage("Buổi học hôm nay"),
        "today_sessions":
            MessageLookupByLibrary.simpleMessage("Buổi học hôm nay"),
        "token_session_expired": MessageLookupByLibrary.simpleMessage(
            "Phiên của bạn đã hết hạn, vui lòng đăng nhập lại"),
        "tomorrow": MessageLookupByLibrary.simpleMessage("Ngày mai"),
        "top_favorite_teachers":
            MessageLookupByLibrary.simpleMessage("Giáo viên được yêu thích"),
        "topic": MessageLookupByLibrary.simpleMessage("Chủ đề"),
        "total_score": MessageLookupByLibrary.simpleMessage("Tổng điểm"),
        "transfer": MessageLookupByLibrary.simpleMessage("Chuyển đổi"),
        "trial": MessageLookupByLibrary.simpleMessage("Học thử"),
        "try_again": MessageLookupByLibrary.simpleMessage("Hãy thử lại sau"),
        "tuesday": MessageLookupByLibrary.simpleMessage("Thứ ba"),
        "tuesday_s": MessageLookupByLibrary.simpleMessage("T3"),
        "tuition_levels": MessageLookupByLibrary.simpleMessage("Mức học phí"),
        "unknown": MessageLookupByLibrary.simpleMessage("Không xác định"),
        "unknown_error":
            MessageLookupByLibrary.simpleMessage("Lỗi không xác định"),
        "up_coming": MessageLookupByLibrary.simpleMessage("Sắp diễn ra"),
        "update": MessageLookupByLibrary.simpleMessage("Cập nhật"),
        "updated": MessageLookupByLibrary.simpleMessage("Đã cập nhật"),
        "updating": MessageLookupByLibrary.simpleMessage("Đang cập nhật"),
        "verify_otp_code":
            MessageLookupByLibrary.simpleMessage("Xác nhận mã OTP"),
        "view": MessageLookupByLibrary.simpleMessage("Xem"),
        "view_all_teacher":
            MessageLookupByLibrary.simpleMessage("Xem tất cả giáo viên"),
        "view_detail": MessageLookupByLibrary.simpleMessage("Xem chi tiết"),
        "view_history": MessageLookupByLibrary.simpleMessage("Xem lịch sử"),
        "vocabulary": MessageLookupByLibrary.simpleMessage("Từ vựng"),
        "voice": MessageLookupByLibrary.simpleMessage("Chất giọng"),
        "wednesday": MessageLookupByLibrary.simpleMessage("Thứ tư"),
        "wednesday_s": MessageLookupByLibrary.simpleMessage("T4"),
        "year": MessageLookupByLibrary.simpleMessage("năm"),
        "years": MessageLookupByLibrary.simpleMessage("năm"),
        "yes": MessageLookupByLibrary.simpleMessage("Có"),
        "you_have_learnt":
            MessageLookupByLibrary.simpleMessage("Bạn đã học được"),
        "you_have_no_course":
            MessageLookupByLibrary.simpleMessage("Bạn không có khoá học nào"),
        "you_to_take_notes":
            MessageLookupByLibrary.simpleMessage("Nhập ghi chú của bạn"),
        "your_feedback":
            MessageLookupByLibrary.simpleMessage("Phản hồi của bạn"),
        "your_goal": MessageLookupByLibrary.simpleMessage("Mục tiêu của bạn"),
        "your_profile": MessageLookupByLibrary.simpleMessage("Hồ sơ của bạn"),
        "your_session_has_expired":
            MessageLookupByLibrary.simpleMessage("Phiên của bạn đã hết hạn")
      };
}
