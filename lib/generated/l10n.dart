// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Search for products...`
  String get search_hint {
    return Intl.message(
      'Search for products...',
      name: 'search_hint',
      desc: '',
      args: [],
    );
  }

  /// `Shop By Category`
  String get shop_by_category {
    return Intl.message(
      'Shop By Category',
      name: 'shop_by_category',
      desc: '',
      args: [],
    );
  }

  /// `Featured Products`
  String get featured_products {
    return Intl.message(
      'Featured Products',
      name: 'featured_products',
      desc: '',
      args: [],
    );
  }

  /// `Add To Cart`
  String get add_to_cart {
    return Intl.message('Add To Cart', name: 'add_to_cart', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Welcome back!`
  String get login_welcome_message {
    return Intl.message(
      'Welcome back!',
      name: 'login_welcome_message',
      desc: '',
      args: [],
    );
  }

  /// `Login to continue your journey`
  String get login_welcome_subtitle {
    return Intl.message(
      'Login to continue your journey',
      name: 'login_welcome_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Enter your email`
  String get email_hint {
    return Intl.message(
      'Enter your email',
      name: 'email_hint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Enter your password`
  String get password_hint {
    return Intl.message(
      'Enter your password',
      name: 'password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgot_password {
    return Intl.message(
      'Forgot Password?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get no_account {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'no_account',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Create Account`
  String get create_account {
    return Intl.message(
      'Create Account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get full_name {
    return Intl.message('Full Name', name: 'full_name', desc: '', args: []);
  }

  /// `Enter your full name`
  String get full_name_hint {
    return Intl.message(
      'Enter your full name',
      name: 'full_name_hint',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm your password`
  String get confirm_password_hint {
    return Intl.message(
      'Confirm your password',
      name: 'confirm_password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email to reset your password`
  String get forgot_password_subtitle {
    return Intl.message(
      'Enter your email to reset your password',
      name: 'forgot_password_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get reset_password {
    return Intl.message(
      'Reset Password',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message('Cart', name: 'cart', desc: '', args: []);
  }

  /// `My Cart`
  String get my_cart {
    return Intl.message('My Cart', name: 'my_cart', desc: '', args: []);
  }

  /// `Color`
  String get color {
    return Intl.message('Color', name: 'color', desc: '', args: []);
  }

  /// `Size`
  String get size {
    return Intl.message('Size', name: 'size', desc: '', args: []);
  }

  /// `Subtotal`
  String get subtotal {
    return Intl.message('Subtotal', name: 'subtotal', desc: '', args: []);
  }

  /// `Shipping`
  String get shipping {
    return Intl.message('Shipping', name: 'shipping', desc: '', args: []);
  }

  /// `Tax`
  String get tax {
    return Intl.message('Tax', name: 'tax', desc: '', args: []);
  }

  /// `Discount`
  String get discount {
    return Intl.message('Discount', name: 'discount', desc: '', args: []);
  }

  /// `Total`
  String get total {
    return Intl.message('Total', name: 'total', desc: '', args: []);
  }

  /// `Proceed To Checkout`
  String get proceed_to_checkout {
    return Intl.message(
      'Proceed To Checkout',
      name: 'proceed_to_checkout',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, =0{No reviews} =1{{count} review} other{{count} reviews}}`
  String review(num count) {
    return Intl.plural(
      count,
      zero: 'No reviews',
      one: '$count review',
      other: '$count reviews',
      name: 'review',
      desc: '',
      args: [count],
    );
  }

  /// `Product Description`
  String get product_description {
    return Intl.message(
      'Product Description',
      name: 'product_description',
      desc: '',
      args: [],
    );
  }

  /// `Customer Reviews`
  String get product_reviews {
    return Intl.message(
      'Customer Reviews',
      name: 'product_reviews',
      desc: '',
      args: [],
    );
  }

  /// `Add Your Review`
  String get add_review {
    return Intl.message(
      'Add Your Review',
      name: 'add_review',
      desc: '',
      args: [],
    );
  }

  /// `Share your thoughts about this product...`
  String get review_hint_text {
    return Intl.message(
      'Share your thoughts about this product...',
      name: 'review_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Submit Review`
  String get submit_review {
    return Intl.message(
      'Submit Review',
      name: 'submit_review',
      desc: '',
      args: [],
    );
  }

  /// `See All Reviews`
  String get see_all_reviews {
    return Intl.message(
      'See All Reviews',
      name: 'see_all_reviews',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Ok`
  String get ok {
    return Intl.message('Ok', name: 'ok', desc: '', args: []);
  }

  /// `If an account with this email exists, you will receive a verification email.`
  String get sign_up_success_message {
    return Intl.message(
      'If an account with this email exists, you will receive a verification email.',
      name: 'sign_up_success_message',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get new_password {
    return Intl.message(
      'New Password',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter New Password`
  String get enter_new_password {
    return Intl.message(
      'Enter New Password',
      name: 'enter_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your new password`
  String get enter_new_password_hint {
    return Intl.message(
      'Enter your new password',
      name: 'enter_new_password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirm_new_password {
    return Intl.message(
      'Confirm New Password',
      name: 'confirm_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm your new password`
  String get confirm_new_password_hint {
    return Intl.message(
      'Confirm your new password',
      name: 'confirm_new_password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Password reset successfully.`
  String get reset_password_success_message {
    return Intl.message(
      'Password reset successfully.',
      name: 'reset_password_success_message',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Please check your email for a link to reset your password. The link is valid for a limited time.`
  String get check_email_for_reset_link_message {
    return Intl.message(
      'Please check your email for a link to reset your password. The link is valid for a limited time.',
      name: 'check_email_for_reset_link_message',
      desc: '',
      args: [],
    );
  }

  /// `Password reset successfully.`
  String get password_reset_success {
    return Intl.message(
      'Password reset successfully.',
      name: 'password_reset_success',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Order History`
  String get order_history {
    return Intl.message(
      'Order History',
      name: 'order_history',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get sign_out {
    return Intl.message('Sign Out', name: 'sign_out', desc: '', args: []);
  }

  /// `Saved Addresses`
  String get saved_addresses {
    return Intl.message(
      'Saved Addresses',
      name: 'saved_addresses',
      desc: '',
      args: [],
    );
  }

  /// `Wishlist`
  String get wishlist {
    return Intl.message('Wishlist', name: 'wishlist', desc: '', args: []);
  }

  /// `Payment Methods`
  String get payment_methods {
    return Intl.message(
      'Payment Methods',
      name: 'payment_methods',
      desc: '',
      args: [],
    );
  }

  /// `My Addresses`
  String get my_addresses {
    return Intl.message(
      'My Addresses',
      name: 'my_addresses',
      desc: '',
      args: [],
    );
  }

  /// `Default`
  String get default_ {
    return Intl.message('Default', name: 'default_', desc: '', args: []);
  }

  /// `Set as Default`
  String get set_as_default {
    return Intl.message(
      'Set as Default',
      name: 'set_as_default',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Add New Address`
  String get add_new_address {
    return Intl.message(
      'Add New Address',
      name: 'add_new_address',
      desc: '',
      args: [],
    );
  }

  /// `LABEL AS`
  String get label_as {
    return Intl.message('LABEL AS', name: 'label_as', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Work`
  String get work {
    return Intl.message('Work', name: 'work', desc: '', args: []);
  }

  /// `Other`
  String get other {
    return Intl.message('Other', name: 'other', desc: '', args: []);
  }

  /// `Contact Info`
  String get contact_info {
    return Intl.message(
      'Contact Info',
      name: 'contact_info',
      desc: '',
      args: [],
    );
  }

  /// `Address Details`
  String get address_details {
    return Intl.message(
      'Address Details',
      name: 'address_details',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Street Address`
  String get street_address {
    return Intl.message(
      'Street Address',
      name: 'street_address',
      desc: '',
      args: [],
    );
  }

  /// `Apt. Suite, etc. (Optional)`
  String get apt_suite_etc {
    return Intl.message(
      'Apt. Suite, etc. (Optional)',
      name: 'apt_suite_etc',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `Save Address`
  String get save_address {
    return Intl.message(
      'Save Address',
      name: 'save_address',
      desc: '',
      args: [],
    );
  }

  /// `Set as default address`
  String get set_as_default_address {
    return Intl.message(
      'Set as default address',
      name: 'set_as_default_address',
      desc: '',
      args: [],
    );
  }

  /// `Use this address for checkout`
  String get use_this_address_for_checkout {
    return Intl.message(
      'Use this address for checkout',
      name: 'use_this_address_for_checkout',
      desc: '',
      args: [],
    );
  }

  /// `Edit Address`
  String get edit_address {
    return Intl.message(
      'Edit Address',
      name: 'edit_address',
      desc: '',
      args: [],
    );
  }

  /// `Card Holder`
  String get card_holder {
    return Intl.message('Card Holder', name: 'card_holder', desc: '', args: []);
  }

  /// `Expires`
  String get expires {
    return Intl.message('Expires', name: 'expires', desc: '', args: []);
  }

  /// `Add Payment Method`
  String get add_payment_method {
    return Intl.message(
      'Add Payment Method',
      name: 'add_payment_method',
      desc: '',
      args: [],
    );
  }

  /// `Save Card`
  String get save_card {
    return Intl.message('Save Card', name: 'save_card', desc: '', args: []);
  }

  /// `Card Number`
  String get card_number {
    return Intl.message('Card Number', name: 'card_number', desc: '', args: []);
  }

  /// `Card Holder Name`
  String get card_holder_name {
    return Intl.message(
      'Card Holder Name',
      name: 'card_holder_name',
      desc: '',
      args: [],
    );
  }

  /// `Expiry Date`
  String get expiry_date {
    return Intl.message('Expiry Date', name: 'expiry_date', desc: '', args: []);
  }

  /// `CVV / CVC`
  String get cvv_cvc {
    return Intl.message('CVV / CVC', name: 'cvv_cvc', desc: '', args: []);
  }

  /// `Set as default payment method`
  String get set_as_default_payment_method {
    return Intl.message(
      'Set as default payment method',
      name: 'set_as_default_payment_method',
      desc: '',
      args: [],
    );
  }

  /// `Use this payment method for checkout`
  String get use_this_payment_method_for_checkout {
    return Intl.message(
      'Use this payment method for checkout',
      name: 'use_this_payment_method_for_checkout',
      desc: '',
      args: [],
    );
  }

  /// `Your payment info is stored securely`
  String get your_payment_info_is_stored_securely {
    return Intl.message(
      'Your payment info is stored securely',
      name: 'your_payment_info_is_stored_securely',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get edit_profile {
    return Intl.message(
      'Edit Profile',
      name: 'edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `Account Information`
  String get account_information {
    return Intl.message(
      'Account Information',
      name: 'account_information',
      desc: '',
      args: [],
    );
  }

  /// `Personal Details`
  String get personal_details {
    return Intl.message(
      'Personal Details',
      name: 'personal_details',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get my_orders {
    return Intl.message('My Orders', name: 'my_orders', desc: '', args: []);
  }

  /// `Quick Access`
  String get quick_access {
    return Intl.message(
      'Quick Access',
      name: 'quick_access',
      desc: '',
      args: [],
    );
  }

  /// `Security`
  String get security {
    return Intl.message('Security', name: 'security', desc: '', args: []);
  }

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Account`
  String get account {
    return Intl.message('Account', name: 'account', desc: '', args: []);
  }

  /// `Member Since`
  String get member_since {
    return Intl.message(
      'Member Since',
      name: 'member_since',
      desc: '',
      args: [],
    );
  }

  /// `Account Status`
  String get account_status {
    return Intl.message(
      'Account Status',
      name: 'account_status',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load profile`
  String get failed_to_load_profile {
    return Intl.message(
      'Failed to load profile',
      name: 'failed_to_load_profile',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }

  /// `E-Commerce App`
  String get app_name {
    return Intl.message('E-Commerce App', name: 'app_name', desc: '', args: []);
  }

  /// `Profile updated successfully`
  String get profile_updated_successfully {
    return Intl.message(
      'Profile updated successfully',
      name: 'profile_updated_successfully',
      desc: '',
      args: [],
    );
  }

  /// `No changes done`
  String get no_changes_done {
    return Intl.message(
      'No changes done',
      name: 'no_changes_done',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get general {
    return Intl.message('General', name: 'general', desc: '', args: []);
  }

  /// `Are you sure you want to sign out?`
  String get sign_out_message {
    return Intl.message(
      'Are you sure you want to sign out?',
      name: 'sign_out_message',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `About`
  String get about {
    return Intl.message('About', name: 'about', desc: '', args: []);
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get support {
    return Intl.message('Support', name: 'support', desc: '', args: []);
  }

  /// `Privacy Policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Service`
  String get terms_of_service {
    return Intl.message(
      'Terms of Service',
      name: 'terms_of_service',
      desc: '',
      args: [],
    );
  }

  /// `Help Center`
  String get help_center {
    return Intl.message('Help Center', name: 'help_center', desc: '', args: []);
  }

  /// `Contact Us`
  String get contact_us {
    return Intl.message('Contact Us', name: 'contact_us', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Select Language`
  String get select_language {
    return Intl.message(
      'Select Language',
      name: 'select_language',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message('Theme', name: 'theme', desc: '', args: []);
  }

  /// `Select Theme`
  String get select_theme {
    return Intl.message(
      'Select Theme',
      name: 'select_theme',
      desc: '',
      args: [],
    );
  }

  /// `Push Notifications`
  String get push_notifications {
    return Intl.message(
      'Push Notifications',
      name: 'push_notifications',
      desc: '',
      args: [],
    );
  }

  /// `Receive updates about your orders and exclusive offers`
  String get push_notifications_subtitle {
    return Intl.message(
      'Receive updates about your orders and exclusive offers',
      name: 'push_notifications_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Order Updates`
  String get order_updates {
    return Intl.message(
      'Order Updates',
      name: 'order_updates',
      desc: '',
      args: [],
    );
  }

  /// `Get notified about your order status`
  String get order_updates_subtitle {
    return Intl.message(
      'Get notified about your order status',
      name: 'order_updates_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Offers & Promotions`
  String get offers_promotions {
    return Intl.message(
      'Offers & Promotions',
      name: 'offers_promotions',
      desc: '',
      args: [],
    );
  }

  /// `Stay updated with the latest offers and discounts`
  String get offers_promotions_subtitle {
    return Intl.message(
      'Stay updated with the latest offers and discounts',
      name: 'offers_promotions_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Change Email`
  String get change_email {
    return Intl.message(
      'Change Email',
      name: 'change_email',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message('Light', name: 'light', desc: '', args: []);
  }

  /// `Dark`
  String get dark {
    return Intl.message('Dark', name: 'dark', desc: '', args: []);
  }

  /// `System`
  String get system {
    return Intl.message('System', name: 'system', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `Checkout`
  String get checkout {
    return Intl.message('Checkout', name: 'checkout', desc: '', args: []);
  }

  /// `Shipping To`
  String get shipping_to {
    return Intl.message('Shipping To', name: 'shipping_to', desc: '', args: []);
  }

  /// `Continue to Payment`
  String get continue_to_payment {
    return Intl.message(
      'Continue to Payment',
      name: 'continue_to_payment',
      desc: '',
      args: [],
    );
  }

  /// `PAYMENT METHOD`
  String get payment_method {
    return Intl.message(
      'PAYMENT METHOD',
      name: 'payment_method',
      desc: '',
      args: [],
    );
  }

  /// `Continue to Review`
  String get continue_to_review {
    return Intl.message(
      'Continue to Review',
      name: 'continue_to_review',
      desc: '',
      args: [],
    );
  }

  /// `Back to Address`
  String get back_to_address {
    return Intl.message(
      'Back to Address',
      name: 'back_to_address',
      desc: '',
      args: [],
    );
  }

  /// `DELIVERY ADDRESS`
  String get delivery_address {
    return Intl.message(
      'DELIVERY ADDRESS',
      name: 'delivery_address',
      desc: '',
      args: [],
    );
  }

  /// `ORDER SUMMARY`
  String get order_summary {
    return Intl.message(
      'ORDER SUMMARY',
      name: 'order_summary',
      desc: '',
      args: [],
    );
  }

  /// `Back to Payment`
  String get back_to_payment {
    return Intl.message(
      'Back to Payment',
      name: 'back_to_payment',
      desc: '',
      args: [],
    );
  }

  /// `Place Order`
  String get place_order {
    return Intl.message('Place Order', name: 'place_order', desc: '', args: []);
  }

  /// `Review`
  String get review_step {
    return Intl.message('Review', name: 'review_step', desc: '', args: []);
  }

  /// `Address`
  String get address_step {
    return Intl.message('Address', name: 'address_step', desc: '', args: []);
  }

  /// `Payment`
  String get payment_step {
    return Intl.message('Payment', name: 'payment_step', desc: '', args: []);
  }

  /// `Something went wrong. Please try again.`
  String get error_body_subtitle {
    return Intl.message(
      'Something went wrong. Please try again.',
      name: 'error_body_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get try_again {
    return Intl.message('Try Again', name: 'try_again', desc: '', args: []);
  }

  /// `Go to Home`
  String get go_to_home {
    return Intl.message('Go to Home', name: 'go_to_home', desc: '', args: []);
  }

  /// `No addresses`
  String get no_addresses {
    return Intl.message(
      'No addresses',
      name: 'no_addresses',
      desc: '',
      args: [],
    );
  }

  /// `Region`
  String get region {
    return Intl.message('Region', name: 'region', desc: '', args: []);
  }

  /// `Governorate`
  String get governorate {
    return Intl.message('Governorate', name: 'governorate', desc: '', args: []);
  }

  /// `District`
  String get district {
    return Intl.message('District', name: 'district', desc: '', args: []);
  }

  /// `Building Details`
  String get building_details {
    return Intl.message(
      'Building Details',
      name: 'building_details',
      desc: '',
      args: [],
    );
  }

  /// `Street`
  String get street {
    return Intl.message('Street', name: 'street', desc: '', args: []);
  }

  /// `Building`
  String get building {
    return Intl.message('Building', name: 'building', desc: '', args: []);
  }

  /// `Floor`
  String get floor {
    return Intl.message('Floor', name: 'floor', desc: '', args: []);
  }

  /// `Apartment number`
  String get apartment_number {
    return Intl.message(
      'Apartment number',
      name: 'apartment_number',
      desc: '',
      args: [],
    );
  }

  /// `Additional Notes`
  String get additional_notes {
    return Intl.message(
      'Additional Notes',
      name: 'additional_notes',
      desc: '',
      args: [],
    );
  }

  /// `Write any additional details to help the delivery person easily reach the address.`
  String get additional_notes_hint_text {
    return Intl.message(
      'Write any additional details to help the delivery person easily reach the address.',
      name: 'additional_notes_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Address Added Successfully`
  String get address_added_successfully {
    return Intl.message(
      'Address Added Successfully',
      name: 'address_added_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Address updated successfully`
  String get address_updated_successfully {
    return Intl.message(
      'Address updated successfully',
      name: 'address_updated_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Your cart is empty`
  String get emptyCart {
    return Intl.message(
      'Your cart is empty',
      name: 'emptyCart',
      desc: '',
      args: [],
    );
  }

  /// `Looks like you haven't added anything yet. Start exploring and add your favorite products.`
  String get emptyCartDescription {
    return Intl.message(
      'Looks like you haven\'t added anything yet. Start exploring and add your favorite products.',
      name: 'emptyCartDescription',
      desc: '',
      args: [],
    );
  }

  /// `Start Shopping`
  String get startShopping {
    return Intl.message(
      'Start Shopping',
      name: 'startShopping',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to clear all items from your cart?`
  String get clear_cart_confirmation {
    return Intl.message(
      'Are you sure you want to clear all items from your cart?',
      name: 'clear_cart_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message('Yes', name: 'yes', desc: '', args: []);
  }

  /// `No`
  String get no {
    return Intl.message('No', name: 'no', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
