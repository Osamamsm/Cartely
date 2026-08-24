// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(orderNumber) => "Order #${orderNumber}";

  static String m1(message) => "Error: ${message}";

  static String m2(form, label) =>
      "${Intl.select(form, {'one': 'You have ${label} item to review', 'other': 'You have ${label} items to review'})}";

  static String m3(date) => "Placed on ${date}";

  static String m4(quantity) => "Qty: ${quantity}";

  static String m5(rating) => "${rating}★ & up";

  static String m6(count) =>
      "${Intl.plural(count, zero: 'No reviews', one: '${count} review', other: '${count} reviews')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("About"),
    "account": MessageLookupByLibrary.simpleMessage("Account"),
    "account_information": MessageLookupByLibrary.simpleMessage(
      "Account Information",
    ),
    "account_status": MessageLookupByLibrary.simpleMessage("Account Status"),
    "add_address": MessageLookupByLibrary.simpleMessage("Add Address"),
    "add_address_to_continue_checkout": MessageLookupByLibrary.simpleMessage(
      "Add a shipping address to continue with your order.",
    ),
    "add_new_address": MessageLookupByLibrary.simpleMessage("Add New Address"),
    "add_payment_method": MessageLookupByLibrary.simpleMessage(
      "Add Payment Method",
    ),
    "add_review": MessageLookupByLibrary.simpleMessage("Add Your Review"),
    "add_to_cart": MessageLookupByLibrary.simpleMessage("Add To Cart"),
    "additional_notes": MessageLookupByLibrary.simpleMessage(
      "Additional Notes",
    ),
    "additional_notes_hint_text": MessageLookupByLibrary.simpleMessage(
      "Write any additional details to help the delivery person easily reach the address.",
    ),
    "address_added_successfully": MessageLookupByLibrary.simpleMessage(
      "Address Added Successfully",
    ),
    "address_details": MessageLookupByLibrary.simpleMessage("Address Details"),
    "address_step": MessageLookupByLibrary.simpleMessage("Address"),
    "address_updated_successfully": MessageLookupByLibrary.simpleMessage(
      "Address updated successfully",
    ),
    "all": MessageLookupByLibrary.simpleMessage("All"),
    "apartment_number": MessageLookupByLibrary.simpleMessage(
      "Apartment number",
    ),
    "app_name": MessageLookupByLibrary.simpleMessage("Cartely"),
    "apply": MessageLookupByLibrary.simpleMessage("Apply"),
    "apt_suite_etc": MessageLookupByLibrary.simpleMessage(
      "Apt. Suite, etc. (Optional)",
    ),
    "arabic": MessageLookupByLibrary.simpleMessage("Arabic"),
    "backToHome": MessageLookupByLibrary.simpleMessage("Back to Home"),
    "back_to_address": MessageLookupByLibrary.simpleMessage("Back to Address"),
    "back_to_cart": MessageLookupByLibrary.simpleMessage("Back to Cart"),
    "back_to_payment": MessageLookupByLibrary.simpleMessage("Back to Payment"),
    "building": MessageLookupByLibrary.simpleMessage("Building"),
    "building_details": MessageLookupByLibrary.simpleMessage(
      "Building Details",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "cancelOrder": MessageLookupByLibrary.simpleMessage("Cancel Order"),
    "card_holder": MessageLookupByLibrary.simpleMessage("Card Holder"),
    "card_holder_name": MessageLookupByLibrary.simpleMessage(
      "Card Holder Name",
    ),
    "card_number": MessageLookupByLibrary.simpleMessage("Card Number"),
    "cart": MessageLookupByLibrary.simpleMessage("Cart"),
    "change_email": MessageLookupByLibrary.simpleMessage("Change Email"),
    "change_password": MessageLookupByLibrary.simpleMessage("Change Password"),
    "check_email_for_reset_link_message": MessageLookupByLibrary.simpleMessage(
      "Please check your email for a link to reset your password. The link is valid for a limited time.",
    ),
    "checkout": MessageLookupByLibrary.simpleMessage("Checkout"),
    "city": MessageLookupByLibrary.simpleMessage("City"),
    "clear": MessageLookupByLibrary.simpleMessage("Clear"),
    "clear_cart_confirmation": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to clear all items from your cart?",
    ),
    "color": MessageLookupByLibrary.simpleMessage("Color"),
    "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
    "confirm_new_password": MessageLookupByLibrary.simpleMessage(
      "Confirm New Password",
    ),
    "confirm_new_password_hint": MessageLookupByLibrary.simpleMessage(
      "Confirm your new password",
    ),
    "confirm_password": MessageLookupByLibrary.simpleMessage(
      "Confirm Password",
    ),
    "confirm_password_hint": MessageLookupByLibrary.simpleMessage(
      "Confirm your password",
    ),
    "contact_info": MessageLookupByLibrary.simpleMessage("Contact Info"),
    "contact_us": MessageLookupByLibrary.simpleMessage("Contact Us"),
    "continueShopping": MessageLookupByLibrary.simpleMessage(
      "Continue Shopping",
    ),
    "continue_shopping": MessageLookupByLibrary.simpleMessage(
      "Continue Shopping",
    ),
    "continue_to_payment": MessageLookupByLibrary.simpleMessage(
      "Continue to Payment",
    ),
    "continue_to_review": MessageLookupByLibrary.simpleMessage(
      "Continue to Review",
    ),
    "create_account": MessageLookupByLibrary.simpleMessage("Create Account"),
    "cvv_cvc": MessageLookupByLibrary.simpleMessage("CVV / CVC"),
    "dark": MessageLookupByLibrary.simpleMessage("Dark"),
    "default_": MessageLookupByLibrary.simpleMessage("Default"),
    "delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "delete_review": MessageLookupByLibrary.simpleMessage("Delete Review"),
    "delete_review_confirmation": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete this review?",
    ),
    "deliveryStatus": MessageLookupByLibrary.simpleMessage("Delivery Status"),
    "delivery_address": MessageLookupByLibrary.simpleMessage(
      "DELIVERY ADDRESS",
    ),
    "discount": MessageLookupByLibrary.simpleMessage("Discount"),
    "district": MessageLookupByLibrary.simpleMessage("District"),
    "edit": MessageLookupByLibrary.simpleMessage("Edit"),
    "edit_address": MessageLookupByLibrary.simpleMessage("Edit Address"),
    "edit_profile": MessageLookupByLibrary.simpleMessage("Edit Profile"),
    "edit_review": MessageLookupByLibrary.simpleMessage("Edit Review"),
    "edited": MessageLookupByLibrary.simpleMessage("Edited"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "email_hint": MessageLookupByLibrary.simpleMessage("Enter your email"),
    "emptyCart": MessageLookupByLibrary.simpleMessage("Your cart is empty"),
    "emptyCartDescription": MessageLookupByLibrary.simpleMessage(
      "Looks like you haven\'t added anything yet. Start exploring and add your favorite products.",
    ),
    "empty_wishlist": MessageLookupByLibrary.simpleMessage(
      "Your wishlist is empty",
    ),
    "empty_wishlist_description": MessageLookupByLibrary.simpleMessage(
      "Tap the heart icon on products to save them to your wishlist.",
    ),
    "english": MessageLookupByLibrary.simpleMessage("English"),
    "enter_new_password": MessageLookupByLibrary.simpleMessage(
      "Enter New Password",
    ),
    "enter_new_password_hint": MessageLookupByLibrary.simpleMessage(
      "Enter your new password",
    ),
    "error": MessageLookupByLibrary.simpleMessage("Error"),
    "error_body_subtitle": MessageLookupByLibrary.simpleMessage(
      "Something went wrong. Please try again.",
    ),
    "expires": MessageLookupByLibrary.simpleMessage("Expires"),
    "expiry_date": MessageLookupByLibrary.simpleMessage("Expiry Date"),
    "failed_to_load_profile": MessageLookupByLibrary.simpleMessage(
      "Failed to load profile",
    ),
    "featured_products": MessageLookupByLibrary.simpleMessage(
      "Featured Products",
    ),
    "floor": MessageLookupByLibrary.simpleMessage("Floor"),
    "forgot_password": MessageLookupByLibrary.simpleMessage("Forgot Password?"),
    "forgot_password_subtitle": MessageLookupByLibrary.simpleMessage(
      "Enter your email to reset your password",
    ),
    "full_name": MessageLookupByLibrary.simpleMessage("Full Name"),
    "full_name_hint": MessageLookupByLibrary.simpleMessage(
      "Enter your full name",
    ),
    "general": MessageLookupByLibrary.simpleMessage("General"),
    "goToOrders": MessageLookupByLibrary.simpleMessage("Go to Orders"),
    "go_to_home": MessageLookupByLibrary.simpleMessage("Go to Home"),
    "governorate": MessageLookupByLibrary.simpleMessage("Governorate"),
    "help_center": MessageLookupByLibrary.simpleMessage("Help Center"),
    "home": MessageLookupByLibrary.simpleMessage("Home"),
    "inStock": MessageLookupByLibrary.simpleMessage("In Stock"),
    "label_as": MessageLookupByLibrary.simpleMessage("LABEL AS"),
    "language": MessageLookupByLibrary.simpleMessage("Language"),
    "light": MessageLookupByLibrary.simpleMessage("Light"),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "login_welcome_message": MessageLookupByLibrary.simpleMessage(
      "Welcome back!",
    ),
    "login_welcome_subtitle": MessageLookupByLibrary.simpleMessage(
      "Login to continue your journey",
    ),
    "max": MessageLookupByLibrary.simpleMessage("Max"),
    "member_since": MessageLookupByLibrary.simpleMessage("Member Since"),
    "min": MessageLookupByLibrary.simpleMessage("Min"),
    "minimumRating": MessageLookupByLibrary.simpleMessage("Minimum Rating"),
    "my_addresses": MessageLookupByLibrary.simpleMessage("My Addresses"),
    "my_cart": MessageLookupByLibrary.simpleMessage("My Cart"),
    "my_orders": MessageLookupByLibrary.simpleMessage("My Orders"),
    "my_reviews": MessageLookupByLibrary.simpleMessage("My Reviews"),
    "new_password": MessageLookupByLibrary.simpleMessage("New Password"),
    "no": MessageLookupByLibrary.simpleMessage("No"),
    "noOrdersFound": MessageLookupByLibrary.simpleMessage("No orders found"),
    "no_account": MessageLookupByLibrary.simpleMessage(
      "Don\'t have an account? ",
    ),
    "no_addresses": MessageLookupByLibrary.simpleMessage("No addresses"),
    "no_addresses_found": MessageLookupByLibrary.simpleMessage(
      "No addresses yet",
    ),
    "no_addresses_found_message": MessageLookupByLibrary.simpleMessage(
      "You don\'t have any addresses yet.",
    ),
    "no_changes_done": MessageLookupByLibrary.simpleMessage("No changes done"),
    "no_orders": MessageLookupByLibrary.simpleMessage("No orders"),
    "no_orders_description": MessageLookupByLibrary.simpleMessage(
      "You haven\'t placed any orders yet.",
    ),
    "no_results": MessageLookupByLibrary.simpleMessage("No results"),
    "no_results_description": MessageLookupByLibrary.simpleMessage(
      "No products found matching your search.",
    ),
    "no_reviews": MessageLookupByLibrary.simpleMessage("No reviews"),
    "no_reviews_description": MessageLookupByLibrary.simpleMessage(
      "You haven\'t reviewed any products yet.",
    ),
    "no_reviews_yet": MessageLookupByLibrary.simpleMessage("No reviews yet"),
    "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
    "offers_promotions": MessageLookupByLibrary.simpleMessage(
      "Offers & Promotions",
    ),
    "offers_promotions_subtitle": MessageLookupByLibrary.simpleMessage(
      "Stay updated with the latest offers and discounts",
    ),
    "ok": MessageLookupByLibrary.simpleMessage("Ok"),
    "onSale": MessageLookupByLibrary.simpleMessage("On Sale"),
    "orderDetails": MessageLookupByLibrary.simpleMessage("Order Details"),
    "orderDetailsError": MessageLookupByLibrary.simpleMessage(
      "Unable to load order details",
    ),
    "orderItems": MessageLookupByLibrary.simpleMessage("Items"),
    "orderNumber": m0,
    "orderOnItsWay": MessageLookupByLibrary.simpleMessage("On its way"),
    "orderStatusCancelled": MessageLookupByLibrary.simpleMessage("Cancelled"),
    "orderStatusConfirmed": MessageLookupByLibrary.simpleMessage("Confirmed"),
    "orderStatusDelivered": MessageLookupByLibrary.simpleMessage("Delivered"),
    "orderStatusOutForDelivery": MessageLookupByLibrary.simpleMessage(
      "Out for Delivery",
    ),
    "orderStatusPending": MessageLookupByLibrary.simpleMessage("Pending"),
    "orderStatusProcessing": MessageLookupByLibrary.simpleMessage("Processing"),
    "orderStatusReturned": MessageLookupByLibrary.simpleMessage("Returned"),
    "orderStatusShipped": MessageLookupByLibrary.simpleMessage("Shipped"),
    "order_history": MessageLookupByLibrary.simpleMessage("Order History"),
    "order_number": MessageLookupByLibrary.simpleMessage("Order Number"),
    "order_placed_message": MessageLookupByLibrary.simpleMessage(
      "Your order has been placed successfully!",
    ),
    "order_rejected_message": MessageLookupByLibrary.simpleMessage(
      "Unfortunately, your order was rejected. Please try again or contact support for assistance.",
    ),
    "order_rejected_title": MessageLookupByLibrary.simpleMessage(
      "Order Rejected",
    ),
    "order_summary": MessageLookupByLibrary.simpleMessage("ORDER SUMMARY"),
    "order_updates": MessageLookupByLibrary.simpleMessage("Order Updates"),
    "order_updates_subtitle": MessageLookupByLibrary.simpleMessage(
      "Get notified about your order status",
    ),
    "ordersError": m1,
    "other": MessageLookupByLibrary.simpleMessage("Other"),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "password_hint": MessageLookupByLibrary.simpleMessage(
      "Enter your password",
    ),
    "password_reset_success": MessageLookupByLibrary.simpleMessage(
      "Password reset successfully.",
    ),
    "paymentConfirmationDelayedMessage": MessageLookupByLibrary.simpleMessage(
      "We haven’t received confirmation of your payment yet. Don’t worry — check your orders in a moment, it may still go through.",
    ),
    "paymentConfirmationDelayedTitle": MessageLookupByLibrary.simpleMessage(
      "Confirmation Delayed",
    ),
    "paymentConfirmedMessage": MessageLookupByLibrary.simpleMessage(
      "Your order has been placed successfully.",
    ),
    "paymentConfirmedTitle": MessageLookupByLibrary.simpleMessage(
      "Payment Confirmed!",
    ),
    "paymentConfirmingMessage": MessageLookupByLibrary.simpleMessage(
      "This usually takes just a few seconds. Please don’t close this screen.",
    ),
    "paymentConfirmingTitle": MessageLookupByLibrary.simpleMessage(
      "Confirming your payment...",
    ),
    "paymentFailedMessage": MessageLookupByLibrary.simpleMessage(
      "We couldn’t confirm your payment. Please try again, or use a different payment method.",
    ),
    "paymentFailedTitle": MessageLookupByLibrary.simpleMessage(
      "Payment Failed",
    ),
    "paymentStatus": MessageLookupByLibrary.simpleMessage("Payment Status"),
    "payment_method": MessageLookupByLibrary.simpleMessage("PAYMENT METHOD"),
    "payment_methods": MessageLookupByLibrary.simpleMessage("Payment Methods"),
    "payment_step": MessageLookupByLibrary.simpleMessage("Payment"),
    "pendingReviewsSubtitle": MessageLookupByLibrary.simpleMessage(
      "Tap to rate your recent purchases",
    ),
    "pendingReviewsTitle": m2,
    "personal_details": MessageLookupByLibrary.simpleMessage(
      "Personal Details",
    ),
    "phone_number": MessageLookupByLibrary.simpleMessage("Phone Number"),
    "place_order": MessageLookupByLibrary.simpleMessage("Place Order"),
    "placedOn": m3,
    "placing_order": MessageLookupByLibrary.simpleMessage(
      "Placing Your Order...",
    ),
    "please_wait_while_we_process_your_order":
        MessageLookupByLibrary.simpleMessage(
          "Please wait while we confirm your order. This will only take a moment.",
        ),
    "price": MessageLookupByLibrary.simpleMessage("Price"),
    "priceRange": MessageLookupByLibrary.simpleMessage("Price Range"),
    "privacy_policy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
    "proceed_to_checkout": MessageLookupByLibrary.simpleMessage(
      "Proceed To Checkout",
    ),
    "product_description": MessageLookupByLibrary.simpleMessage(
      "Product Description",
    ),
    "product_info": MessageLookupByLibrary.simpleMessage("Product Information"),
    "product_reviews": MessageLookupByLibrary.simpleMessage("Customer Reviews"),
    "profile": MessageLookupByLibrary.simpleMessage("Profile"),
    "profile_updated_successfully": MessageLookupByLibrary.simpleMessage(
      "Profile updated successfully",
    ),
    "push_notifications": MessageLookupByLibrary.simpleMessage(
      "Push Notifications",
    ),
    "push_notifications_subtitle": MessageLookupByLibrary.simpleMessage(
      "Receive updates about your orders and exclusive offers",
    ),
    "quantity": m4,
    "quick_access": MessageLookupByLibrary.simpleMessage("Quick Access"),
    "rate_this_product": MessageLookupByLibrary.simpleMessage(
      "Rate this product",
    ),
    "rate_your_purchases": MessageLookupByLibrary.simpleMessage(
      "Rate Your Purchases",
    ),
    "rating": MessageLookupByLibrary.simpleMessage("Rating"),
    "ratingAndUp": m5,
    "region": MessageLookupByLibrary.simpleMessage("Region"),
    "register": MessageLookupByLibrary.simpleMessage("Register"),
    "reorder": MessageLookupByLibrary.simpleMessage("Reorder"),
    "reset_password": MessageLookupByLibrary.simpleMessage("Reset Password"),
    "reset_password_success_message": MessageLookupByLibrary.simpleMessage(
      "Password reset successfully.",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("Retry"),
    "review": m6,
    "review_comment_error": MessageLookupByLibrary.simpleMessage(
      "Please enter a comment.",
    ),
    "review_hint_text": MessageLookupByLibrary.simpleMessage(
      "Share your thoughts about this product...",
    ),
    "review_step": MessageLookupByLibrary.simpleMessage("Review"),
    "save": MessageLookupByLibrary.simpleMessage("Save"),
    "save_address": MessageLookupByLibrary.simpleMessage("Save Address"),
    "save_card": MessageLookupByLibrary.simpleMessage("Save Card"),
    "saved_addresses": MessageLookupByLibrary.simpleMessage("Saved Addresses"),
    "search_hint": MessageLookupByLibrary.simpleMessage(
      "Search for products...",
    ),
    "search_order_by_number": MessageLookupByLibrary.simpleMessage(
      "Search by order number",
    ),
    "security": MessageLookupByLibrary.simpleMessage("Security"),
    "see_all_reviews": MessageLookupByLibrary.simpleMessage("See All Reviews"),
    "select_language": MessageLookupByLibrary.simpleMessage("Select Language"),
    "select_rating_error": MessageLookupByLibrary.simpleMessage(
      "Please select a rating.",
    ),
    "select_theme": MessageLookupByLibrary.simpleMessage("Select Theme"),
    "set_as_default": MessageLookupByLibrary.simpleMessage("Set as Default"),
    "set_as_default_address": MessageLookupByLibrary.simpleMessage(
      "Set as default address",
    ),
    "set_as_default_payment_method": MessageLookupByLibrary.simpleMessage(
      "Set as default payment method",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "shipping": MessageLookupByLibrary.simpleMessage("Shipping"),
    "shipping_to": MessageLookupByLibrary.simpleMessage("Shipping To"),
    "shop_by_category": MessageLookupByLibrary.simpleMessage(
      "Shop By Category",
    ),
    "shop_now": MessageLookupByLibrary.simpleMessage("Shop Now"),
    "showDetails": MessageLookupByLibrary.simpleMessage("Show Details"),
    "showProductsRatedAtLeast": MessageLookupByLibrary.simpleMessage(
      "Show products rated at least…",
    ),
    "sign_out": MessageLookupByLibrary.simpleMessage("Sign Out"),
    "sign_out_message": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to sign out?",
    ),
    "sign_up_success_message": MessageLookupByLibrary.simpleMessage(
      "If an account with this email exists, you will receive a verification email.",
    ),
    "size": MessageLookupByLibrary.simpleMessage("Size"),
    "something_went_wrong": MessageLookupByLibrary.simpleMessage(
      "Something went wrong. Please try again.",
    ),
    "sortBy": MessageLookupByLibrary.simpleMessage("Sort By"),
    "sortMostPopular": MessageLookupByLibrary.simpleMessage("Most Popular"),
    "sortNewest": MessageLookupByLibrary.simpleMessage("Newest"),
    "sortPriceHighLow": MessageLookupByLibrary.simpleMessage("Price: High–Low"),
    "sortPriceLowHigh": MessageLookupByLibrary.simpleMessage("Price: Low–High"),
    "sortTopRated": MessageLookupByLibrary.simpleMessage("Top Rated"),
    "startShopping": MessageLookupByLibrary.simpleMessage("Start Shopping"),
    "street": MessageLookupByLibrary.simpleMessage("Street"),
    "street_address": MessageLookupByLibrary.simpleMessage("Street Address"),
    "submit_review": MessageLookupByLibrary.simpleMessage("Submit Review"),
    "subtotal": MessageLookupByLibrary.simpleMessage("Subtotal"),
    "support": MessageLookupByLibrary.simpleMessage("Support"),
    "system": MessageLookupByLibrary.simpleMessage("System"),
    "tax": MessageLookupByLibrary.simpleMessage("Tax"),
    "terms_of_service": MessageLookupByLibrary.simpleMessage(
      "Terms of Service",
    ),
    "theme": MessageLookupByLibrary.simpleMessage("Theme"),
    "total": MessageLookupByLibrary.simpleMessage("Total"),
    "trackOrder": MessageLookupByLibrary.simpleMessage("Track Order"),
    "tryAgain": MessageLookupByLibrary.simpleMessage("Try Again"),
    "try_again": MessageLookupByLibrary.simpleMessage("Try Again"),
    "use_this_address_for_checkout": MessageLookupByLibrary.simpleMessage(
      "Use this address for checkout",
    ),
    "use_this_payment_method_for_checkout":
        MessageLookupByLibrary.simpleMessage(
          "Use this payment method for checkout",
        ),
    "viewOrderDetails": MessageLookupByLibrary.simpleMessage(
      "View Order Details",
    ),
    "view_orders": MessageLookupByLibrary.simpleMessage("View Orders"),
    "wishlist": MessageLookupByLibrary.simpleMessage("Wishlist"),
    "work": MessageLookupByLibrary.simpleMessage("Work"),
    "yes": MessageLookupByLibrary.simpleMessage("Yes"),
    "your_payment_info_is_stored_securely":
        MessageLookupByLibrary.simpleMessage(
          "Your payment info is stored securely",
        ),
  };
}
