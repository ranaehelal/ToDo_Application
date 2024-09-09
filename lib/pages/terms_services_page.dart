import 'package:flutter/material.dart';

class TermsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Terms & Services'),
        backgroundColor: theme.colorScheme.primary,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20),
                Text(
                  'Terms & Conditions',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: theme.colorScheme.secondary,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  '1. Acceptance of Terms\n\n'
                      'By accessing or using our app, you agree to be bound by these Terms and Conditions. If you do not agree to these terms, please do not use our app.\n\n'
                      '2. Changes to Terms\n\n'
                      'We reserve the right to modify these Terms at any time. Your continued use of the app following any changes will constitute your acceptance of such changes.\n\n'
                      '3. User Responsibilities\n\n'
                      'You are responsible for maintaining the confidentiality of your account information and for all activities that occur under your account.\n\n'
                      '4. Limitation of Liability\n\n'
                      'We shall not be liable for any damages arising out of or related to your use of the app.\n\n'
                      '5. Intellectual Property\n\n'
                      'All content, trademarks, and other intellectual property on our app are the property of the app owner and/or its licensors. You may not use or reproduce any such intellectual property without our prior written consent.\n\n'
                      '6. Prohibited Activities\n\n'
                      'You agree not to engage in any activity that could harm the app or its users, including but not limited to hacking, distributing malicious software, or spamming.\n\n'
                      '7. Termination\n\n'
                      'We reserve the right to terminate your access to the app at any time for any reason, including but not limited to violation of these Terms.\n\n'
                      '8. Governing Law\n\n'
                      'These Terms shall be governed by and construed in accordance with the laws of the jurisdiction in which the app is operated, without regard to its conflict of law principles.\n\n'
                      '9. Dispute Resolution\n\n'
                      'Any disputes arising out of or in connection with these Terms shall be resolved through binding arbitration in accordance with the rules of the arbitration body chosen by us.\n\n'
                      '10. Contact Us\n\n'
                      'If you have any questions about these Terms, please contact us at support@example.com.',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
