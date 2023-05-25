class ApiUrls {
  static const baseUrl = 'https://nextjs.webwiders.in/optuae/api/';
      //'https://bluediamondresearch.com/WEB01/provider_app/api/';
  // static const String get_values = baseUrl + 'get_values';
  static const String check_email = baseUrl + 'check-mail';
  static const String app_data = baseUrl + 'app-data';
  static const String get_category = baseUrl + 'get-category?type=';
  static const String get_allcategory = baseUrl + 'get-allcategory?type=';
  static const String hair_color = baseUrl + 'hair-color';
  static const String getUserDetails = baseUrl + 'get-user-by-id?user_id=';
  static const String login = baseUrl + 'login';
  static const String signUp = baseUrl + 'signup';
  static const String language_list = baseUrl + 'get_language';
  static const String activities_list = baseUrl + 'get_activities';
  static const String education_list = baseUrl + 'get_education';
  static const String childcare_list = baseUrl + 'get_childcare';
  static const String health_list = baseUrl + 'get_health';
  static const String qualification_list = baseUrl + 'get_qualification';
  static const String skills_list = baseUrl + 'get_skills';
  static const String updateDeviceToken = baseUrl + 'updateDeviceToken';
  static const String interval = baseUrl + 'interval?user_id=';
  static const String email_check = baseUrl + 'email_check';
  static const String forget_password = baseUrl + 'forget-password';
  static const String change_password = baseUrl + 'change-password';
  static const String edit_profile = baseUrl + 'edit-profile';
  static const String getStripeKey = baseUrl + 'stripe-key';
  static const String getStripeIntent = baseUrl + 'create-PaymentIntent';
  static const String setupStripeIntent = baseUrl + 'getStripeIntent';
  static const String getpaymentMethodFromSecretKey = 'https://api.stripe.com/v1/setup_intents/';
  static const String getplan = baseUrl + 'plan-Management?type=';
  static const String planPurchase = baseUrl + 'plan-purchase';
  static const String profile_search = baseUrl + 'search_provider';
  static const String home_screen_list = baseUrl + 'home-screen-list';
  static const String parents_search = baseUrl + 'search_parent';
  static const String send_hand_shakes = baseUrl + 'send-hand-shakes';
  static const String get_my_handshake = baseUrl + 'get-my-hand-shakes?user_id=';
  static const String device_id = baseUrl + 'update-device-id';
  static const String get_notificatin = baseUrl + 'get-notification?user_id=';
  static const String read_notificatin = baseUrl + 'mark-as-read?user_id=';
  static const String clear_notificatin = baseUrl + 'clear-notifications?user_id=';
  static const String clearSingleNotification = baseUrl + 'ClearSingleNotification?id=';
  static const String chat_list = baseUrl + 'MyChatList?user_id=';
  static const String ChatBetweenUser = baseUrl + 'ChatBetweenUser';
  static const String SendMessage = baseUrl + 'SendMessage';
  static const String questions = baseUrl + 'get-questions?user_id=';
  static const String send_answer = baseUrl + 'user-question-answer';
  static const String addfav = baseUrl + 'is_fav';
  static const String addfavlist = baseUrl + 'fav-list?user_id=';
  static const String ContactUs = baseUrl + 'ContactUs';
  static const String privacypolicy = baseUrl + 'privacy';
  static const String terms = baseUrl + 'terms';
  static const String about = baseUrl + 'about';
  static const String get_out_handshake = baseUrl + 'get_out_handshake?user_id=';
  static const String update_service_price = baseUrl + 'edit-service';
  static const String customer_signup = baseUrl + 'customer-signup';
  static const String editcustomerprofile = baseUrl + 'edit-customer-profile';
  static const String removeservice = baseUrl + 'remove-service';
  static const String removegalleryimage = baseUrl + 'remove-gallery-image?id=';
  static const String upload_images = baseUrl + 'user-gallery';
  static const String set_profile_image = baseUrl + 'set-profile-image';
  static const String get_subcategories = baseUrl + 'get-sub-category?type=';
  static const String search_employee = baseUrl + 'search-employee';
  static const String showdescription = baseUrl + 'show-description?type=';
  static const String booking = baseUrl + 'make-booking';
  static const String alleventlist = baseUrl + 'employee-all-event?emp_id=';
  static const String eventlist = baseUrl + 'event-list?emp_id=';
  static const String addevent = baseUrl + 'add-event';
  static const String editevent = baseUrl + 'edit-event';
  static const String deleteevent = baseUrl + 'delete-event?id=';
  static const String customerbooking = baseUrl + 'customer-booking';
  static const String bookingdetail = baseUrl + 'booking-detail';
  static const String employeebooking = baseUrl + 'employee-booking';
  static const String ClearNotification = baseUrl + 'ClearNotification?user_id=';
  static const String getpostalcode = baseUrl + 'get-postal-code';
  static const String getemployeewithdistance = baseUrl + 'get-employee-with-distance';
  static const String addprivatebookings = baseUrl + 'add-private-bookings';
  static const String editprivatebookings = baseUrl + 'edit-private-bookings';
  static const String Listprivatebookings = baseUrl + 'get-private-bookings?user_id=';
  static const String deleteprivatebookings = baseUrl + 'delete-private-bookings';
  static const String acceptbooking = baseUrl + 'accept-booking?booking_id=';
  static const String rejectbooking = baseUrl + 'reject-booking?booking_id=';
  static const String urgentbooking = baseUrl + 'urgent-booking';
  static const String rating = baseUrl + 'rating';
  static const String employeeratelist = baseUrl + 'employee-rate-list?emp_id=';
  static const String agent_signup = baseUrl + 'agent_signup';
  static const String agent_edit = baseUrl + 'agent_edit';
  static const String addNote = baseUrl + 'add-agent-note';
  static const String note_list = baseUrl + 'get-agent-note?user_id=';
  static const String deleteagentnote = baseUrl + 'delete-agent-note?note_id=';
  static const String applyPromocode = baseUrl + 'apply-coupon';
  static const String accountTerminate = baseUrl + 'delete-account?user_id=';
  static const String home_advertise = baseUrl + 'home_advertise';
  static const String service_detail = baseUrl + 'special_category_detail';
  static const String specialbooking = baseUrl + 'specialbooking';
  static const String getspecialCategory = baseUrl + 'get_special_category';
  static const String getBookinglist = baseUrl + 'get-booking-list?user_id=';
}
