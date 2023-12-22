const String baseUrl = 'https://elwekala.onrender.com';
class ApiConstants {
  static const loginApi = '$baseUrl/user/login';
  static const registerApi = '$baseUrl/user/register';
  static const forgetPasswordApi = '$baseUrl/user/forget-password';
  static const profileApi = '$baseUrl/user/profile';
  static const editProfile = '$baseUrl/user/update';
  static const getUsersApi = '$baseUrl/user/display';
  static const deleteUserApi = '$baseUrl/user/delete';
  static const chatApi = '$baseUrl/chat/';
  static const homeLaptopApi = '$baseUrl/product/inCart/Laptops';
  static const homeSmartPhoneApi = '$baseUrl/product/inCart/Smart Phones';
  static const homeSmartWatchApi = '$baseUrl/product/inCart/Smart Watches';
  static const homeSmartTvsApi = '$baseUrl/product/inCart/Smart TVs';
  static const homeAccApi = '$baseUrl/product/inCart/PC and laptop accessories';
  static const favoriteApi = '$baseUrl/favorite';
  static const addToCartApi = 'https://elwekala.onrender.com/cart/add';
  static const geyMyCartApi = 'https://elwekala.onrender.com/cart/allProducts';
  static const getTotalPriceApi = 'https://elwekala.onrender.com/cart/total';
  static const deleteCartApi = 'https://elwekala.onrender.com/cart/delete';
  static const updateQuantityApi = 'https://elwekala.onrender.com/cart';
  static const logoutApi= 'https://elwekala.onrender.com/user/logout';
  static const deleteReviewApi='https://elwekala.onrender.com/review';
  static const addReviewApi = 'https://elwekala.onrender.com/review';
  static const getAllReviewApi = 'https://elwekala.onrender.com/review/allreviews';
 static const  searchApi='https://elwekala.onrender.com/product/get/search';
 static const getAllProductsApi= 'https://elwekala.onrender.com/product/get/search';
 static const String baseUrlPayment = 'https://accept.paymob.com/api';
  static const String getAuthToken = '/auth/tokens';
  static String idCard = '3293535';
  static String visaUrl =
      '$baseUrlPayment/acceptance/iframes/722023?payment_token=$finalToken';
  static const getOrderId = '/ecommerce/orders';
  static const getPaymentKey = '/acceptance/payment_keys';
  static const paymentApiKey =
      'ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SnVZVzFsSWpvaWFXNXBkR2xoYkNJc0luQnliMlpwYkdWZmNHc2lPalkzTkRnek1Td2lZMnhoYzNNaU9pSk5aWEpqYUdGdWRDSjkuYzg3dG1oTi1IMi1RNWlEZ1BBdEFZUUZnbUJWTFRrLWRlYTF1OG1TMVlmNU1hTVotOUJGMUNmRTJYZElaQzFzYkhSVl8xTWZLa3dCdmRpNlNPbWdfS0E=';
}
var authToken;
var orderPaymentId;
var finalToken;