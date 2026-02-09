import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../utils/categories.dart';
import '../../utils/nigeria_locations.dart';
import '../../services/supabase_service.dart';
import '../../services/artisan_service.dart';
import '../../ui/input.dart';
import '../../ui/button.dart';
import '../../ui/label.dart';
import '../../ui/textarea.dart';
import '../../ui/card.dart';

enum VerificationStep { email, otp, profile }

class SubmitProfile extends StatefulWidget {
  final VoidCallback? onSuccess;
  const SubmitProfile({Key? key, this.onSuccess}) : super(key: key);

  @override
  State<SubmitProfile> createState() => _SubmitProfileState();
}

class _SubmitProfileState extends State<SubmitProfile> {
  VerificationStep step = VerificationStep.email;

  // Verification
  String email = '';
  String otp = '';
  String generatedOtp = '';
  bool isVerifying = false;
  String otpError = '';

  // Form
  String fullName = '';
  String businessName = '';
  String phone = '';
  String whatsapp = '';
  String categorySlug = '';
  String customCategory = '';
  String stateVal = '';
  String city = '';
  String customCity = '';
  String streetAddress = '';
  String bio = '';

  bool isSubmitting = false;
  bool submitted = false;
  String submitError = '';

  // Images
  File? profileFile;
  String? profilePreview;
  List<File> galleryFiles = [];
  List<String> galleryPreviews = [];

  final ImagePicker _picker = ImagePicker();

  List<String> get allStates => nigeriaLocations.keys.toList()..sort();
  List<String> get citiesForState => stateVal.isEmpty ? [] : (nigeriaLocations[stateVal] ?? [])..sort();

  void handleSendOtp() {
    if (email.isEmpty || !email.contains('@')) {
      setState(() => otpError = 'Please enter a valid email address');
      return;
    }
    setState(() {
      otpError = '';
      generatedOtp = (Random().nextInt(900000) + 100000).toString();
      step = VerificationStep.otp;
    });
  }

  void handleVerifyOtp() {
    setState(() => isVerifying = true);
    Future.delayed(Duration(milliseconds: 500), () {
      if (otp == generatedOtp) {
        setState(() {
          step = VerificationStep.profile;
          otpError = '';
        });
      } else {
        setState(() => otpError = 'Invalid code. Please try again.');
      }
      setState(() => isVerifying = false);
    });
  }

  void handleResendOtp() {
    setState(() {
      generatedOtp = (Random().nextInt(900000) + 100000).toString();
      otp = '';
      otpError = '';
    });
  }

  Future<void> handleProfileUpload() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        profileFile = File(picked.path);
        profilePreview = picked.path;
      });
    }
  }

  Future<void> handleGalleryUpload() async {
    final picked = await _picker.pickMultiImage();
    if (picked.isNotEmpty) {
      setState(() {
        galleryFiles.addAll(picked.map((x) => File(x.path)));
        galleryPreviews.addAll(picked.map((x) => x.path));
      });
    }
  }

  void removeGalleryImage(int idx) {
    setState(() {
      galleryFiles.removeAt(idx);
      galleryPreviews.removeAt(idx);
    });
  }

  Future<void> handleSubmit() async {
    setState(() { submitError = ''; isSubmitting = true; });
    final finalCategory = categorySlug == 'other' ? customCategory.trim() : categorySlug;
    final finalCity = city == 'other' ? customCity.trim() : city;
    if (fullName.trim().isEmpty) { setState(() => submitError = 'Full name is required.'); return; }
    if (phone.trim().isEmpty) { setState(() => submitError = 'Phone number is required.'); return; }
    if (finalCategory.isEmpty) { setState(() => submitError = 'Category is required.'); return; }
    if (stateVal.isEmpty) { setState(() => submitError = 'State is required.'); return; }
    if (finalCity.isEmpty) { setState(() => submitError = 'City is required.'); return; }
    if (bio.trim().isEmpty) { setState(() => submitError = 'Bio is required.'); return; }
    final address = [streetAddress.trim(), finalCity, stateVal].where((x) => x.isNotEmpty).join(', ');
    try {
      String? profileImageUrl;
      List<String> galleryImageUrls = [];
      if (profileFile != null) {
        profileImageUrl = await SupabaseService.uploadToStorage(profileFile!, 'profiles');
      }
      if (galleryFiles.isNotEmpty) {
        for (final file in galleryFiles) {
          final url = await SupabaseService.uploadToStorage(file, 'gallery');
          galleryImageUrls.add(url);
        }
      }
      await ArtisanService.addArtisan({
        'full_name': fullName.trim(),
        'business_name': businessName.trim().isEmpty ? null : businessName.trim(),
        'phone': phone.trim(),
        'whatsapp': whatsapp.trim().isEmpty ? phone.trim() : whatsapp.trim(),
        'category': finalCategory,
        'bio': bio.trim(),
        'address': address.isEmpty ? null : address,
        'state': stateVal,
        'city': finalCity,
        'status': 'pending',
        'email': email.trim(),
        'profile_image_url': profileImageUrl,
        'gallery_image_urls': galleryImageUrls,
      });
      setState(() { submitted = true; });
    } catch (e) {
      setState(() { submitError = e.toString(); });
    } finally {
      setState(() { isSubmitting = false; });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (step == VerificationStep.email) {
      return Scaffold(
        body: Center(
          child: UICard(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  UILabel(text: 'Verify Email'),
                  UIInput(
                    hint: 'you@example.com',
                    controller: TextEditingController(text: email),
                    onChanged: (val) => setState(() => email = val),
                  ),
                  if (otpError.isNotEmpty)
                    Text(otpError, style: TextStyle(color: Colors.red)),
                  SizedBox(height: 12),
                  UIButton(label: 'Send Verification Code', onPressed: handleSendOtp),
                ],
              ),
            ),
          ),
        ),
      );
    }
    if (step == VerificationStep.otp) {
      return Scaffold(
        body: Center(
          child: UICard(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  UILabel(text: 'Enter Code'),
                  Text('Your verification code is: $generatedOtp', style: TextStyle(fontWeight: FontWeight.bold)),
                  UIInput(
                    hint: '123456',
                    controller: TextEditingController(text: otp),
                    onChanged: (val) => setState(() => otp = val.replaceAll(RegExp(r'\D'), '')),
                  ),
                  if (otpError.isNotEmpty)
                    Text(otpError, style: TextStyle(color: Colors.red)),
                  SizedBox(height: 12),
                  UIButton(label: isVerifying ? 'Verifying...' : 'Verify Email', onPressed: otp.length == 6 && !isVerifying ? handleVerifyOtp : null),
                  TextButton(onPressed: handleResendOtp, child: Text('Resend Code')),
                ],
              ),
            ),
          ),
        ),
      );
    }
    if (submitted) {
      return Scaffold(
        body: Center(
          child: UICard(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 48),
                  SizedBox(height: 12),
                  Text('Application Submitted!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Text('Your profile is under review. We will notify you once it\'s approved.'),
                  SizedBox(height: 12),
                  UIButton(label: 'Back to Home', onPressed: widget.onSuccess ?? () => Navigator.of(context).pop()),
                ],
              ),
            ),
          ),
        ),
      );
    }
    // Profile form
    return Scaffold(
      appBar: AppBar(title: Text('Complete Your Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (submitError.isNotEmpty)
              Container(
                color: Colors.red[50],
                padding: EdgeInsets.all(8),
                child: Row(children: [Icon(Icons.error, color: Colors.red), SizedBox(width: 8), Expanded(child: Text(submitError, style: TextStyle(color: Colors.red)))]),
              ),
            GestureDetector(
              onTap: handleProfileUpload,
              child: CircleAvatar(
                radius: 48,
                backgroundImage: profilePreview != null ? FileImage(File(profilePreview!)) : null,
                child: profilePreview == null ? Icon(Icons.camera_alt, size: 32, color: Colors.grey) : null,
              ),
            ),
            UIInput(hint: 'Full Name', controller: TextEditingController(text: fullName), onChanged: (val) => setState(() => fullName = val)),
            UIInput(hint: 'Business Name', controller: TextEditingController(text: businessName), onChanged: (val) => setState(() => businessName = val)),
            DropdownButtonFormField<String>(
              value: categorySlug.isEmpty ? null : categorySlug,
              items: [
                ...categories.map((c) => DropdownMenuItem(value: c['slug'], child: Text(c['name']))),
                DropdownMenuItem(value: 'other', child: Text('Other (Not Listed)')),
              ],
              onChanged: (val) => setState(() => categorySlug = val ?? ''),
              decoration: InputDecoration(labelText: 'Category'),
            ),
            if (categorySlug == 'other')
              UIInput(hint: 'Specify Your Trade', controller: TextEditingController(text: customCategory), onChanged: (val) => setState(() => customCategory = val)),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: stateVal.isEmpty ? null : stateVal,
                    items: allStates.map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
                    onChanged: (val) => setState(() { stateVal = val ?? ''; city = ''; customCity = ''; }),
                    decoration: InputDecoration(labelText: 'State'),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: city.isEmpty ? null : city,
                    items: [
                      ...citiesForState.map((c) => DropdownMenuItem(value: c, child: Text(c))),
                      DropdownMenuItem(value: 'other', child: Text('Other (Not Listed)')),
                    ],
                    onChanged: stateVal.isEmpty ? null : (val) => setState(() => city = val ?? ''),
                    decoration: InputDecoration(labelText: 'City'),
                  ),
                ),
              ],
            ),
            if (city == 'other')
              UIInput(hint: 'Enter City Name', controller: TextEditingController(text: customCity), onChanged: (val) => setState(() => customCity = val)),
            UIInput(hint: 'Street Address (Optional)', controller: TextEditingController(text: streetAddress), onChanged: (val) => setState(() => streetAddress = val)),
            UIInput(hint: 'Phone Number', controller: TextEditingController(text: phone), onChanged: (val) => setState(() => phone = val)),
            UIInput(hint: 'WhatsApp (Optional)', controller: TextEditingController(text: whatsapp), onChanged: (val) => setState(() => whatsapp = val)),
            UITextArea(hint: 'Bio / Description', controller: TextEditingController(text: bio), onChanged: (val) => setState(() => bio = val)),
            // Gallery
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Work Gallery (Optional)'),
                SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: [
                    ...galleryPreviews.asMap().entries.map((entry) => Stack(
                      children: [
                        Image.file(File(entry.value), width: 64, height: 64, fit: BoxFit.cover),
                        Positioned(
                          top: 0, right: 0,
                          child: GestureDetector(
                            onTap: () => removeGalleryImage(entry.key),
                            child: CircleAvatar(radius: 10, backgroundColor: Colors.red, child: Icon(Icons.close, size: 12, color: Colors.white)),
                          ),
                        ),
                      ],
                    )),
                    GestureDetector(
                      onTap: handleGalleryUpload,
                      child: Container(
                        width: 64, height: 64,
                        decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(8)),
                        child: Icon(Icons.add_a_photo, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            UIButton(label: isSubmitting ? 'Submitting...' : 'Submit Application (Pending Approval)', onPressed: isSubmitting ? null : handleSubmit),
          ],
        ),
      ),
    );
  }
}
