import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

import 'package:shelters/index.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({
    @required this.tag
  });

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Consumer<AnimalsProvider>(
      builder: (context, animalsState, snapshot) {
        return SheltersScaffold(
          appBar: const SheltersAppBar(
            title: 'Article',
          ),
          padding: EdgeInsets.zero,
          bodyList: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Hero(
                  tag: tag,
                  child: Container(
                    height: 200,
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider('http://www.pethealthnetwork.com/sites/default/files/styles/large/public/hand-dog-article.png')
                            )
                          ),
                        ),
                        Expanded(
                          child: Material(
                            type: MaterialType.transparency,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.all(8),
                              child: const Text('Should my pet be tested for COVID-19?', style: TextStyle(fontSize: 20),),
                            )
                          )
                        )
                      ],
                    )
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(8),
                  child: const Text('If your cat or dog is coughing, the good news is that it’s probably not due to COVID-19. Experts from the U.S. Centers for Disease Control and Prevention (CDC)  and the World Organization for Animal Health (OIE) agree that COVID-19 is predominantly a human illness, and it’s unlikely for pets to be infected with the coronavirus that causes COVID-19. There are many types of viruses that can make cats or dogs sick. So, your veterinarian will check your pet to make sure that the symptoms aren’t being caused by a more common virus or other health problem.\n\n'
                      'Opinions about testing pets for COVID-19 are changing as we learn more about the virus and cases around the world. Public health authorities and veterinarians are working together to determine if an animal should be tested. Right now, there’s no evidence that dogs or cats can spread the virus to people. But there is growing evidence that in rare cases people may be able to infect animals. In the past month, two dogs and a cat in Hong Kong, a cat in Belgium, and a tiger at the Bronx Zoo in New York City were found to have been infected. In each situation, there was exposure to a COVID-19 positive person.\n\n' 
                      'If your cat or dog is sick, the best thing to do is speak with your veterinarian. Be sure to let them know if your pet has been exposed to anyone who has COVID-19. Your veterinarian will let you know what to do and will work with public health authorities to determine if a test is recommended.\n\n'
                      'For the most up-to-date information about COVID-19 and animals, please visit the CDC’s website.',
                    style: TextStyle(fontSize: 18), textAlign: TextAlign.justify)
                )
              ],
            )
          ]
        ); 
      }
    );
  }
}
