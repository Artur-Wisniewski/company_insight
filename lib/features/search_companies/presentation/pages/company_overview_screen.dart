import 'package:company_insight_app/features/search_companies/domain/entities/company_overview.dart';
import 'package:flutter/material.dart';

class CompanyOverviewScreen extends StatefulWidget {
  const CompanyOverviewScreen({super.key, required this.companyPreview});

  final CompanyPreviewEntity companyPreview;

  @override
  State<CompanyOverviewScreen> createState() => _CompanyOverviewScreenState();
}

class _CompanyOverviewScreenState extends State<CompanyOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Company Overview Screen'),
      ),
    );
  }
}
