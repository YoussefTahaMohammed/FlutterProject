import 'package:flutter/material.dart';

class CompanyCard extends StatelessWidget {
  final String companyName;
  final String companyServices;
  final int id;
  const CompanyCard({
    Key? key,
    required this.id,
    required this.companyName,
    required this.companyServices,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(119, 117, 245, 0.2),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      height: 120,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(companyName,
                    style: const TextStyle(
                        fontSize:25,
                        wordSpacing: 7,
                        fontWeight: FontWeight.w600
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(companyServices,
                    style: const TextStyle(
                      fontSize:17,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: (){ },
              icon:  const Icon(
                Icons.arrow_forward_ios,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
