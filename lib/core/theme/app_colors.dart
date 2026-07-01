import 'package:flutter/material.dart';

class AppColors {
  // --- UTAMA (BACKGROUND & BRAND) ---
  // Latar belakang utama aplikasi (Putih Bersih)
  static const Color background = Color(0xFFFFFFFF);

  // Latar belakang halaman belakang/shadow (Abu-abu sangat terang)
  static const Color scaffoldBackground = Color(0xFFF8F9FA);

  // Banner Utama "Add new car" & Icon Aktif Navigasi (Biru SF Pro)
  static const Color primaryBlue = Color(0xFF4B87FE);

  // --- MENU HORIZONTAL ("Might be interesting") ---
  // Card pertama: "Apply for insurance" (Hijau Toska)
  static const Color menuGreen = Color(0xFF3ED0AD);

  // Card kedua: "Apply for insurance" (Putih dengan Border)
  static const Color menuWhite = Color(0xFFFFFFFF);

  // --- ELEMEN UI & Ikon Kustom ("Choose services") ---
  // Background kolom pencarian & Border tipis pada Card Layanan (Abu-abu Terang)
  static const Color uiBorder = Color(0xFFF1F3F5);

  // Ikon Oli, Ikon Mesin, Text Utama, dan Navigasi Non-Aktif (Hitam/Gelap)
  static const Color textDark = Color(0xFF1C2430);

  // Subtitle teks kecil seperti "Regular oil change" (Abu-abu Redup)
  static const Color textMuted = Color(0xFF868E96);

  // --- WARNA TAMBAHAN DARI PALET (Bisa untuk Status IoT / Notifikasi) ---
  // Indikator Peringatan / Warning (Oranye)
  static const Color statusWarning = Color(0xFFF39A31);

  // Indikator Kritis / Alert Baterai (Merah Salmon)
  static const Color statusAlert = Color(0xFFFF7373);
}
