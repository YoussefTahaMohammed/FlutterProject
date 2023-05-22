import 'package:assignment1/models/CompanyModel.dart';
import 'package:flutter/material.dart';

class CompanyCard extends StatelessWidget {
  final CompanyModel companyModel;

  const CompanyCard({
    Key? key,
    required this.companyModel,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed("companyProfile",arguments: );
      },
      child: Container(
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
                    Text(companyModel.companyName,
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
                    Text(companyModel.companyServicesCount.toString(),
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
      ),
    );
  }
}
