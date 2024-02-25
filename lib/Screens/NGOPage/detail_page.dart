import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 230, 255, 1),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(40.0),
            decoration: BoxDecoration(
              color: Color.fromRGBO(241, 230, 255, 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailCard(
                  icon: Icons.business,
                  label: 'BloodBank Name',
                  value: 'Name of the BloodBank',
                ),
                _buildDetailCard(
                  icon: Icons.location_on,
                  label: 'Location',
                  value: 'Chennai, Tamilnadu',
                ),
                _buildDetailCard(
                  icon: Icons.person,
                  label: 'BloodBank Head',
                  value: 'John Doe',
                ),
                _buildDetailCard(
                  icon: Icons.phone,
                  label: 'Head Phone',
                  value: '+91 99999 99999',
                ),
                _buildDetailCard(
                  icon: Icons.email,
                  label: 'Head Email',
                  value: 'example@email.com',
                ),
                _buildDetailCard(
                  icon: Icons.description,
                  label: 'Description',
                  value:
                      'This is a multiline description. This card should expand its background based on the number of lines in the description.',
                  maxLines: 5, // Set max lines for the description
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailCard({
    required IconData icon,
    required String label,
    required String value,
    int maxLines = 1, // Added maxLines parameter with a default value of 1
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.black),
          SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  value,
                  maxLines: maxLines, // Set max lines for the description text
                  overflow:
                      TextOverflow.ellipsis, // Handle overflow with ellipsis
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
