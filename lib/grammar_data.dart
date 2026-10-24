class WordItem {
  final String englishWord;
  final Map<String, String> meanings;

  WordItem({required this.englishWord, required this.meanings});
}

class GrammarCategory {
  final String categoryNameEn;
  final Map<String, String> categoryNames;
  final List<WordItem> wordsList;

  GrammarCategory({
    required this.categoryNameEn,
    required this.categoryNames,
    required this.wordsList,
  });
}

final List<GrammarCategory> allGrammarCategories = [
  GrammarCategory(
    categoryNameEn: "Noun",
    categoryNames: {
      'kn': 'ನಾಮಪದ',
      'hi': 'संज्ञा',
      'te': 'నామవాచకం',
      'ta': 'பெயர்ச்சொல்',
      'mr': 'नाम',
    },
    wordsList: [
      WordItem(
        englishWord: "Book",
        meanings: {
          'kn': 'ಪುಸ್ತಕ',
          'hi': 'पुस्तक',
          'te': 'పుస్తకం',
          'ta': 'புத்தகம்',
          'mr': 'पुस्तक',
        },
      ),
      WordItem(
        englishWord: "Pen",
        meanings: {
          'kn': 'ಲೇಖನಿ',
          'hi': 'कलम',
          'te': 'పెన్ను',
          'ta': 'பேனா',
          'mr': 'पेन',
        },
      ),
    ],
  ),
  GrammarCategory(
    categoryNameEn: "Pronoun",
    categoryNames: {
      'kn': 'ಸರ್ವನಾಮ',
      'hi': 'सर्वनाम',
      'te': 'సర్వನಾమం',
      'ta': 'பிரதிபெயர்ச்சொல்',
      'mr': 'सर्वनाम',
    },
    wordsList: [
      WordItem(
        englishWord: "He",
        meanings: {
          'kn': 'ಅವನು',
          'hi': 'वह',
          'te': 'అతను',
          'ta': 'அவன்',
          'mr': 'तो',
        },
      ),
    ],
  ),
  GrammarCategory(
    categoryNameEn: "Verb",
    categoryNames: {
      'kn': 'ಕ್ರಿಯಾಪದ',
      'hi': 'क्रिया',
      'te': 'క్రియ',
      'ta': 'வினைச்சொல்',
      'mr': 'क्रियापद',
    },
    wordsList: [
      WordItem(
        englishWord: "Run",
        meanings: {
          'kn': 'ಓಡು',
          'hi': 'दौड़ना',
          'te': 'పరుగెత్తు',
          'ta': 'ஓடு',
          'mr': 'धावणे',
        },
      ),
    ],
  ),
];
