class Prevention {
  final String title;
  final String description;

  Prevention({this.title, this.description});

  static List<Prevention> preventionData = [];

  static Future<List<Prevention>> getPreventionData() async {
    preventionData.add(Prevention(
      title: 'Wash your hands frequently and carefully',
      description:
          'Use warm water and soap and rub your hands for at least 20 seconds. Work the lather to your wrists, between your fingers, and under your fingernails. You can also use an antibacterial and antiviral soap. Use hand sanitizer when you cannot wash your hands properly. Rewash your hands several times a day, especially after touching anything, including your phone or laptop.',
    ));
    preventionData.add(Prevention(
      title: 'Avoid touching your face',
      description:
          'Avoid touching any part of your face or head, including your mouth, nose, and eyes. Also avoid biting your fingernails. This can give SARS-CoV-2 a chance to go from your hands into your body.',
    ));
    preventionData.add(Prevention(
      title: 'Stop shaking hands and hugging people',
      description:
          'Similarly, avoid touching other people. Skin-to-skin contact can transmit SARS-CoV-2 from one person to another.',
    ));
    preventionData.add(Prevention(
      title: 'Take physical (social) distancing seriously',
      description:
          'If you’re carrying the SARS-CoV-2 virus, it’ll be found in high amounts in your spit (sputum). This can happen even if you don’t have symptoms. Physical (social) distancing, also means staying home and working remotely when possible. If you must go out for necessities, keep a distance of 6 feet (2 m) from other people. You can transmit the virus by speaking to someone in close contact to you.',
    ));
    preventionData.add(Prevention(
      title: 'Cover your mouth and nose when you cough and sneeze',
      description:
          'SARS-CoV-2 is found in high amounts in the nose and mouth. This means it can be carried by air droplets to other people when you cough, sneeze, or talk. It can also land on hard surfaces and stay there for up to 3 days. Use a tissue or sneeze into your elbow to keep your hands as clean as possible. Wash your hands carefully after you sneeze or cough, regardless.',
    ));
    preventionData.add(Prevention(
      title: 'Wear a mask',
      description:
          'The Centers for Disease Control and Prevention (CDC) recommendsTrusted Source that almost everyone wears a cloth face mask in public settings where physical distancing may be difficult, such as grocery stores. When used correctly, these masks can help prevent people who are asymptomatic or undiagnosed from transmitting SARS-CoV-2 when they breathe, talk, sneeze, or cough. This, in turn, slows the transmission of the virus.',
    ));
    preventionData.add(Prevention(
      title: 'Self-quarantine if sick',
      description:
          'Call your doctor if you have any symptoms. Stay home until you recover. Avoid sitting, sleeping, or eating with your loved ones even if you live in the same home. Wear a mask and wash your hands as much as possible. If you need urgent medical care, wear a mask and let them know you may have COVID-19.',
    ));
    print(preventionData.length);
    return preventionData;
  }
}
