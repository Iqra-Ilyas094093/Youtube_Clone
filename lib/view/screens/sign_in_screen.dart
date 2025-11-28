import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign In',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xFFf20d0d),
        scaffoldBackgroundColor: const Color(0xFFf8f5f5),
        textTheme: GoogleFonts.splineSansTextTheme(),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFFf20d0d),
        scaffoldBackgroundColor: const Color(0xFF181111),
        textTheme: GoogleFonts.splineSansTextTheme(
          ThemeData.dark().textTheme,
        ),
        useMaterial3: true,
      ),
      home: const SignInPage(),
    );
  }
}

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: isDark ? const Color(0xFF181111) : const Color(0xFFf8f5f5),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 400),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // App Logo
                      _buildAppLogo(),
                      const SizedBox(height: 32),

                      // Headline Text
                      _buildHeadlineText(),
                      const SizedBox(height: 12),

                      // Body Text
                      _buildBodyText(),
                      const Spacer(),

                      // Sign In Button
                      _buildSignInButton(),
                      const SizedBox(height: 16),

                      // Terms and Privacy Text
                      _buildTermsText(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppLogo() {
    return Container(
      padding: const EdgeInsets.only(top: 32, bottom: 32),
      child: Icon(
        Icons.play_circle,
        color: const Color(0xFFf20d0d),
        size: 84,
      ),
    );
  }

  Widget _buildHeadlineText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        "Unlock your experience",
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : const Color(0xFF0f172a),
          height: 1.2,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildBodyText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        "Sign in to subscribe to channels, save videos to your playlists, and access your watch history on any device.",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Theme.of(context).brightness == Brightness.dark
              ? const Color(0xFFcbd5e1)
              : const Color(0xFF475569),
          height: 1.5,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildSignInButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          onPressed: _handleSignIn,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFf20d0d),
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Google Logo
              Image.network(
                "https://lh3.googleusercontent.com/aida-public/AB6AXuCnWy0nTLfnKOyfL9OzXdhMd0B9fSzaINrWXASOCXoHSIIzTKzCZDakNwx_b0ugpX8VBHOf6p2twnJ1hkuhtMRPGt5gk5edmHclhIKiFM7IF-UEdCgtfYB8kBQtNc5xgCoFrtc_5EIlQ2CKWeWvrVsBILQdp1aUK-byiejYM49T0SUNFIrUdx994_1Xf1df7eVZ2KrmJMe4BvQ31lwJIDLjjhQfsCgP_6Kpfkp-aZrgjomv0Br4zY9Fg4pBtaaJ0mcMwEGCGjWJEvyO",
                width: 24,
                height: 24,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: const Center(
                      child: Text(
                        "G",
                        style: TextStyle(
                          color: Color(0xFFf20d0d),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(width: 12),
              const Text(
                "Sign in with Google",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.015,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTermsText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Theme.of(context).brightness == Brightness.dark
                ? const Color(0xFF94a3b8)
                : const Color(0xFF64748b),
          ),
          children: [
            const TextSpan(text: "By continuing, you agree to our "),
            WidgetSpan(
              child: GestureDetector(
                onTap: _showTermsOfService,
                child: Text(
                  "Terms of Service",
                  style: TextStyle(
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? const Color(0xFF94a3b8)
                        : const Color(0xFF64748b),
                  ),
                ),
              ),
            ),
            const TextSpan(text: " and "),
            WidgetSpan(
              child: GestureDetector(
                onTap: _showPrivacyPolicy,
                child: Text(
                  "Privacy Policy",
                  style: TextStyle(
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? const Color(0xFF94a3b8)
                        : const Color(0xFF64748b),
                  ),
                ),
              ),
            ),
            const TextSpan(text: "."),
          ],
        ),
      ),
    );
  }

  void _handleSignIn() {
    // Implement Google sign in logic here
    print("Sign in with Google pressed");

    // You would typically use Firebase Auth or another auth service:
    // final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    // final credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth?.accessToken,
    //   idToken: googleAuth?.idToken,
    // );
    // await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void _showTermsOfService() {
    // Show terms of service dialog or navigate to terms page
    print("Terms of Service clicked");
  }

  void _showPrivacyPolicy() {
    // Show privacy policy dialog or navigate to privacy page
    print("Privacy Policy clicked");
  }
}