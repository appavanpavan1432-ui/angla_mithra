import 'package:flutter/material.dart';

import 'dart:async';

import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const AnglaMitraApp());
}

// 1. ಎಲ್ಲಾ ೫ ಭಾಷೆಗಳಿಗೆ ಸಂಪೂರ್ಣ ಡೇಟಾ ಹೊಂದಿರುವ ಬಹುಭಾಷಾ ಸಿಸ್ಟಮ್
class AppData {
  static ValueNotifier<String> currentLanguage = ValueNotifier<String>(
    'ಕನ್ನಡ (Kannada)',
  );

  static Map<String, Map<String, dynamic>> localizedData = {
    'ಕನ್ನಡ (Kannada)': {
      'app_title': 'ಆಂಗ್ಲ ಮಿತ್ರ',
      'home': 'ಮೂಲ ಪುಟ',
      'practice': 'ಅಭ್ಯಾಸ',
      'profile': 'ಪ್ರೊಫೈಲ್',
      'community': 'ಸಮುದಾಯ',
      'welcome': 'ಸ್ವಾಗತ',
      'level': 'ಲೆವೆಲ್',
      'banner': '📢 Banner Ad',
      'leaderboard': 'ಟಾಪ್ ರ್ಯಾಂಕ್ ಲೀಡರ್ ಬೋರ್ಡ್',
      'greeting': 'ನಮಸ್ಕಾರ',
      'grammar': '1. ವ್ಯಾಕರಣ (Grammar)',
      'vocabulary': '2. ಶಬ್ದಭಂಡಾರ (Vocabulary)',
      'conversation': '3. ಸಂಭಾಷಣೆ (Conversation)',
      'listen_pronounce': '4. ಕೇಳುವುದು ಮತ್ತು ಉಚ್ಚರಿಸುವುದು',
      'daily_quiz': '💡 ದೈನಂದಿನ ಕ್ವಿಜ್ (Daily Quiz)',
      'translation_practice': '✍️ ಇಂಗ್ಲಿಷ್ ಅನುವಾದ ಅಭ್ಯಾಸ',
      'check': 'ಪರಿಶೀಲಿಸಿ',
      'next': 'ಮುಂದಿನ ಪದ',
      'community_hint': 'ಸಮುದಾಯದಲ್ಲಿ ಏನಾದರೂ ಬರೆಯಿರಿ...',
      'post': 'ಪೋಸ್ಟ್',
      'reply': 'ರಿಪ್ಲೈ',
      'send': 'ಕಳುಹಿಸಿ',
      'first_lang_title': '🌐 ಫಸ್ಟ್ ಲ್ಯಾಂಗ್ವೇಜ್ (First Language)',
      'lang_desc':
          'ಯಾವುದೇ ಭಾಷೆಯನ್ನು ಕ್ಲಿಕ್ ಮಾಡಿದರೆ ಆಪ್ ತಕ್ಷಣ ಆ ಭಾಷೆಗೆ ಬದಲಾಗುತ್ತದೆ.',
      'practice_prompt': 'ಈ ಕನ್ನಡ ವಾಕ್ಯವನ್ನು ಇಂಗ್ಲಿಷ್‌ನಲ್ಲಿ ಟೈಪ್ ಮಾಡಿ:',
      'grammar_topics': {
        '1. Parts of Speech (ನಾಮಪದ, ಕ್ರಿಯಾಪದ...)': [
          {'en': 'Noun (Apple)', 'meaning': 'ಸೇಬು (ನಾಮಪದ)'},
          {'en': 'Pronoun (He)', 'meaning': 'ಅವನು (ಸರ್ವನಾಮ)'},
          {'en': 'Verb (Run)', 'meaning': 'ಓಡು (ಕ್ರಿಯಾಪದ)'},
          {'en': 'Adjective (Smart)', 'meaning': 'ಚತುರ (ವಿಶೇಷಣ)'},
          {'en': 'Adverb (Quickly)', 'meaning': 'ವೇಗವಾಗಿ (ಕ್ರಿಯಾವಿಶೇಷಣ)'},
        ],
        '2. Tenses (ಕಾಲಗಳು)': [
          {
            'en': 'Present Tense (I eat)',
            'meaning': 'ವರ್ತಮಾನ ಕಾಲ (ನಾನು ತಿನ್ನುತ್ತೇನೆ)',
          },
          {'en': 'Past Tense (I ate)', 'meaning': 'ಭೂತಕಾಲ (ನಾನು ತಿಂದೆ)'},
          {
            'en': 'Future Tense (I will eat)',
            'meaning': 'ಭವಿಷ್ಯತ್ ಕಾಲ (ನಾನು ತಿನ್ನುವೆ)',
          },
          {
            'en': 'Continuous (I am eating)',
            'meaning': 'ಸತತ ಕ್ರಿಯೆ (ನಾನು ತಿನ್ನುತ್ತಿದ್ದೇನೆ)',
          },
          {'en': 'Perfect (I have eaten)', 'meaning': 'ಪೂರ್ಣಗೊಂಡ ಕ್ರಿಯೆ'},
        ],
        '3. Articles (a, an, the)': [
          {'en': 'A book', 'meaning': 'ಒಂದು ಪುಸ್ತಕ'},
          {'en': 'An apple', 'meaning': 'ಒಂದು ಸೇಬು'},
          {'en': 'The Sun', 'meaning': 'ಸೂರ್ಯ'},
          {'en': 'A doctor', 'meaning': 'ಒಬ್ಬ ವೈದ್ಯರು'},
          {'en': 'An umbrella', 'meaning': 'ಒಂದು ಛತ್ರಿ'},
        ],
        '4. Prepositions (ಸ್ಥಾನಸೂಚಕಗಳು)': [
          {'en': 'On the table', 'meaning': 'ಮೇಜಿನ ಮೇಲೆ'},
          {'en': 'In the room', 'meaning': 'ಕೊಠಡಿಯ ಒಳಗೆ'},
          {'en': 'Under the tree', 'meaning': 'ಮರದ ಕೆಳಗೆ'},
          {'en': 'Behind the house', 'meaning': 'ಮನೆಯ ಹಿಂದೆ'},
          {'en': 'Between two books', 'meaning': 'ಎರಡು ಪುಸ್ತಕಗಳ ನಡುವೆ'},
        ],
        '5. Conjunctions (ಸಂಯೋಜಕಗಳು)': [
          {'en': 'And (Tea and Coffee)', 'meaning': 'ಮತ್ತು (ಟೀ ಮತ್ತು ಕಾಫಿ)'},
          {
            'en': 'But (He came but left)',
            'meaning': 'ಆದರೆ (ಅವನು ಬಂದ ಆದರೆ ಹೋದ)',
          },
          {'en': 'Because (I am late because...)', 'meaning': 'ಏಕೆಂದರೆ'},
          {'en': 'Or (This or That)', 'meaning': 'ಅಥವಾ (ಇದು ಅಥವಾ ಅದು)'},
          {'en': 'So (So I decided)', 'meaning': 'ಆದ್ದರಿಂದ'},
        ],
        '6. Modal Verbs & Questions': [
          {'en': 'Can (I can do it)', 'meaning': 'ಸಾಧ್ಯತೆ (ನನ್ನಿಂದ ಸಾಧ್ಯ)'},
          {'en': 'Must (You must go)', 'meaning': 'ಖಂಡಿತ (ನೀನು ಹೋಗಲೇಬೇಕು)'},
          {'en': 'Should (You should study)', 'meaning': 'ಸಲಹೆ (ನೀನು ಓದಬೇಕು)'},
          {
            'en': 'What is your name?',
            'meaning': 'ಪ್ರಶ್ನಾರ್ಥಕ (ನಿಮ್ಮ ಹೆಸರೇನು?)',
          },
          {
            'en': 'Where are you going?',
            'meaning': 'ನೀವು ಎಲ್ಲಿಗೆ ಹೋಗುತ್ತಿದ್ದೀರಾ?',
          },
        ],
      },
      'vocab_topics': {
        '1. Daily Words (ದಿನನಿತ್ಯದ ಪದಗಳು)': [
          {'en': 'Water', 'meaning': 'ನೀರು'},
          {'en': 'Food', 'meaning': 'ಆಹಾರ'},
          {'en': 'Time', 'meaning': 'ಸಮಯ'},
          {'en': 'Money', 'meaning': 'ಹಣ'},
          {'en': 'Work', 'meaning': 'ಕೆಲಸ'},
        ],
        '2. Fruits & Vegetables (ಹಣ್ಣು ಮತ್ತು ತರಕಾರಿಗಳು)': [
          {'en': 'Mango', 'meaning': 'ಮಾವಿನ ಹಣ್ಣು'},
          {'en': 'Banana', 'meaning': 'ಬಾಳೆಹಣ್ಣು'},
          {'en': 'Onion', 'meaning': 'ಈರುಳ್ಳಿ'},
          {'en': 'Potato', 'meaning': 'ಆಲೂಗಡ್ಡೆ'},
          {'en': 'Tomato', 'meaning': 'ಟೊಮೆಟೊ'},
        ],
        '3. Household Items (ಮನೆ ವಸ್ತುಗಳು)': [
          {'en': 'Chair', 'meaning': 'ಕುರ್ಚಿ'},
          {'en': 'Table', 'meaning': 'ಮೇಜು'},
          {'en': 'Bed', 'meaning': 'ಹಾಸಿಗೆ'},
          {'en': 'Fan', 'meaning': 'ಫ್ಯಾನ್'},
          {'en': 'Mirror', 'meaning': 'ಕನ್ನಡಿ'},
        ],
        '4. Relationships & Body Parts (ಸಂಬಂಧಗಳು ಮತ್ತು ದೇಹದ ಭಾಗಗಳು)': [
          {'en': 'Father / Mother', 'meaning': 'ತಂದೆ / ತಾಯಿ'},
          {'en': 'Brother / Sister', 'meaning': 'ಸಹೋದರ / ಸಹೋದರಿ'},
          {'en': 'Eyes / Ears', 'meaning': 'ಕಣ್ಣುಗಳು / ಕಿವಿಗಳು'},
          {'en': 'Hands / Legs', 'meaning': 'ಕೈಗಳು / ಕಾಲುಗಳು'},
          {'en': 'Heart', 'meaning': 'ಹೃದಯ'},
        ],
        '5. Antonyms & Synonyms (ವಿರುದ್ಧ ಮತ್ತು ಸಮಾನಾರ್ಥಕ ಪದಗಳು)': [
          {'en': 'Hot x Cold', 'meaning': 'ಬಿಸಿ x ತಂಪು (ವಿರುದ್ಧ)'},
          {'en': 'Big x Small', 'meaning': 'ದೊಡ್ಡ x ಸಣ್ಣ (ವಿರುದ್ಧ)'},
          {'en': 'Happy = Joyful', 'meaning': 'ಸಂತೋಷ (ಸಮಾನಾರ್ಥಕ)'},
          {'en': 'Fast = Quick', 'meaning': 'ವೇಗ (ಸಮಾನಾರ್ಥಕ)'},
          {'en': 'Begin = Start', 'meaning': 'ಪ್ರಾರಂಭ (ಸಮಾನಾರ್ಥಕ)'},
        ],
      },
      'conversation_topics': {
        '1. Self Introduction (ಸ್ವಯಂ ಪರಿಚಯ)': [
          {'en': 'My name is Ak.', 'meaning': 'ನನ್ನ ಹೆಸರು ಅಕ್.'},
          {'en': 'I am from Karnataka.', 'meaning': 'ನಾನು ಕರ್ನಾಟಕದವನು.'},
          {'en': 'I am a student.', 'meaning': 'ನಾನು ವಿದ್ಯಾರ್ಥಿ.'},
          {
            'en': 'Nice to meet you.',
            'meaning': 'ನಿಮ್ಮನ್ನು ಭೇಟಿಯಾಗಿದ್ದು ಸಂತೋಷವಾಯಿತು.',
          },
          {'en': 'My hobby is reading.', 'meaning': 'ಓದುವುದು ನನ್ನ ಹವ್ಯಾಸ.'},
        ],
        '2. Shop & Supermarket (ಅಂಗಡಿ ಮತ್ತು ಸೂಪರ್ ಮಾರ್ಕೆಟ್)': [
          {'en': 'How much is this?', 'meaning': 'ಇದರ ಬೆಲೆ ಎಷ್ಟು?'},
          {
            'en': 'Do you have fresh apples?',
            'meaning': 'ನಿಮ್ಮಲ್ಲಿ ತಾಜಾ ಸೇಬು ಇದೆಯೇ?',
          },
          {
            'en': 'Please give me a bag.',
            'meaning': 'ದಯವಿಟ್ಟು ನನಗೊಂದು ಚೀಲ ಕೊಡಿ.',
          },
          {
            'en': 'Can I pay using UPI?',
            'meaning': 'ನಾನು ಯುಪಿಐ ಮೂಲಕ ಪಾವತಿಸಬಹುದೇ?',
          },
          {'en': 'Give me the bill, please.', 'meaning': 'ದಯವಿಟ್ಟು ಬಿಲ್ ಕೊಡಿ.'},
        ],
        '3. Hospital & Medical (ಆಸ್ಪತ್ರೆ ಮತ್ತು ಮೆಡಿಕಲ್ ಶಾಪ್)': [
          {
            'en': 'I need to see a doctor.',
            'meaning': 'ನಾನು ವೈದ್ಯರನ್ನು ಭೇಟಿಯಾಗಬೇಕು.',
          },
          {
            'en': 'I have a fever and headache.',
            'meaning': 'ನನಗೆ ಜ್ವರ ಮತ್ತು ತಲೆನೋವು ಇದೆ.',
          },
          {
            'en': 'Do you have this tablet?',
            'meaning': 'ನಿಮ್ಮಲ್ಲಿ ಈ ಮಾತ್ರೆ ಇದೆಯೇ?',
          },
          {
            'en': 'How should I take this medicine?',
            'meaning': 'ಈ ಔಷಧಿಯನ್ನು ಹೇಗೆ ತೆಗೆದುಕೊಳ್ಳಬೇಕು?',
          },
          {'en': 'Where is the pharmacy?', 'meaning': 'ಮೆಡಿಕಲ್ ಶಾಪ್ ಎಲ್ಲಿದೆ?'},
        ],
        '4. Travel & Transport (ಪ್ರಯಾಣ ಮತ್ತು ಬಸ್/ರೈಲು)': [
          {'en': 'Where is the bus stand?', 'meaning': 'ಬಸ್ ನಿಲ್ದಾಣ ಎಲ್ಲಿದೆ?'},
          {
            'en': 'One ticket to Bengaluru, please.',
            'meaning': 'ಬೆಂಗಳೂರಿಗೆ ಒಂದು ಟಿಕೆಟ್ ಕೊಡಿ.',
          },
          {
            'en': 'What time does the train arrive?',
            'meaning': 'ರೈಲು ಎಷ್ಟು ಗಂಟೆಗೆ ಬರುತ್ತದೆ?',
          },
          {'en': 'Is this seat vacant?', 'meaning': 'ಈ ಸೀಟು ಖಾಲಿ ಇದೆಯೇ?'},
          {
            'en': 'Please tell me when the stop comes.',
            'meaning': 'ಸ್ಟಾಪ್ ಬಂದಾಗ ದಯವಿಟ್ಟು ತಿಳಿಸಿ.',
          },
        ],
        '5. Hotel & Restaurant (ಹೋಟೆಲ್ ಮತ್ತು ರೆಸ್ಟೋರೆಂಟ್)': [
          {'en': 'Can I see the menu?', 'meaning': 'ನಾನು ಮೆನು ನೋಡಬಹುದೇ?'},
          {
            'en': 'Please bring one Dosa and Tea.',
            'meaning': 'ಒಂದು ದೋಸೆ ಮತ್ತು ಟೀ ತನ್ನಿ.',
          },
          {'en': 'Is the food spicy?', 'meaning': 'ಆಹಾರ ಖಾರವಾಗಿದೆಯೇ?'},
          {
            'en': 'Please bring the check/bill.',
            'meaning': 'ದಯವಿಟ್ಟು ಬಿಲ್ ತನ್ನಿ.',
          },
          {
            'en': 'The food was delicious.',
            'meaning': 'ಊಟ ತುಂಬಾ ರುಚಿಯಾಗಿತ್ತು.',
          },
        ],
        '6. With Friends (ಸ್ನೇಹಿತರ ಜೊತೆ ಮಾತುಕತೆ)': [
          {'en': 'Hey, how are you doing?', 'meaning': 'ಹೇ, ಹೇಗಿದ್ದೀಯಾ?'},
          {
            'en': 'Let us meet this weekend.',
            'meaning': 'ನಾವು ಈ ವಾರಾಂತ್ಯದಲ್ಲಿ ಭೇಟಿಯಾಗೋಣ.',
          },
          {
            'en': 'Did you watch the match?',
            'meaning': 'ನೀನು ಮ್ಯಾಚ್ ನೋಡಿದೆಯಾ?',
          },
          {'en': 'Let us go for coffee.', 'meaning': 'ನಾವು ಕಾಫಿಗೆ ಹೋಗೋಣ.'},
          {
            'en': 'Call me when you reach home.',
            'meaning': 'ಮನೆಗೆ ತಲುಪಿದ ಮೇಲೆ ಫೋನ್ ಮಾಡು.',
          },
        ],
      },
      'practice_list': [
        {'prompt': 'ನಾನು ಮನೆಯಲ್ಲಿದ್ದೇನೆ', 'english': 'I am at home'},
        {
          'prompt': 'ನೀನು ಎಲ್ಲಿಗೆ ಹೋಗುತ್ತಿರುವೆ?',
          'english': 'Where are you going',
        },
        {'prompt': 'ಇದು ತುಂಬಾ ಒಳ್ಳೆಯದು', 'english': 'This is very good'},
        {'prompt': 'ನಾವು ನಾಳೆ ಭೇಟಿಯಾಗೋಣ', 'english': 'Let us meet tomorrow'},
        {'prompt': 'ನೀನು ಏನು ಮಾಡುತ್ತಿದ್ದೀಯಾ?', 'english': 'What are you doing'},
      ],
    },
    'हिंदी (Hindi)': {
      'app_title': 'आंग्ल मित्र',
      'home': 'होम पेज',
      'practice': 'अभ्यास',
      'profile': 'प्रोफाइल',
      'community': 'समुदाय',
      'welcome': 'स्वागत है',
      'level': 'स्तर',
      'banner': '📢 विज्ञापन (Ad)',
      'leaderboard': 'टॉप रैंक लीडरबोर्ड',
      'greeting': 'नमस्ते',
      'grammar': '1. व्याकरण (Grammar)',
      'vocabulary': '2. शब्दावली (Vocabulary)',
      'conversation': '3. बातचीत (Conversation)',
      'listen_pronounce': '4. सुनना और उच्चारण',
      'daily_quiz': '💡 दैनिक क्विज़ (Daily Quiz)',
      'translation_practice': '✍️ अंग्रेजी अनुवाद अभ्यास',
      'check': 'जांचें',
      'next': 'अगला शब्द',
      'community_hint': 'समुदाय में कुछ लिखें...',
      'post': 'पोस्ट',
      'reply': 'उत्तर दें',
      'send': 'भेजें',
      'first_lang_title': '🌐 पहली भाषा (First Language)',
      'lang_desc':
          'किसी भी भाषा पर क्लिक करने पर ऐप तुरंत उस भाषा में बदल जाता है।',
      'practice_prompt': 'इस हिंदी वाक्य का अंग्रेजी में अनुवाद करें:',
      'grammar_topics': {
        '1. Parts of Speech (संज्ञा, सर्वनाम...)': [
          {'en': 'Noun (Apple)', 'meaning': 'सेब (संज्ञा)'},
          {'en': 'Pronoun (He)', 'meaning': 'वह (सर्वनाम)'},
          {'en': 'Verb (Run)', 'meaning': 'दौड़ना (क्रिया)'},
          {'en': 'Adjective (Smart)', 'meaning': 'चतुर (विशेषण)'},
          {'en': 'Adverb (Quickly)', 'meaning': 'तेजी से (क्रिया विशेषण)'},
        ],
        '2. Tenses (काल)': [
          {
            'en': 'Present Tense (I eat)',
            'meaning': 'वर्तमान काल (मैं खाता हूँ)',
          },
          {'en': 'Past Tense (I ate)', 'meaning': 'भूतकाल (मैंने खाया)'},
          {
            'en': 'Future Tense (I will eat)',
            'meaning': 'भविष्य काल (मैं खाऊँगा)',
          },
          {
            'en': 'Continuous (I am eating)',
            'meaning': 'निरंतर काल (मैं खा रहा हूँ)',
          },
          {'en': 'Perfect (I have eaten)', 'meaning': 'पूर्ण काल'},
        ],
        '3. Articles (a, an, the)': [
          {'en': 'A book', 'meaning': 'एक किताब'},
          {'en': 'An apple', 'meaning': 'एक सेब'},
          {'en': 'The Sun', 'meaning': 'सूरज'},
          {'en': 'A doctor', 'meaning': 'एक डॉक्टर'},
          {'en': 'An umbrella', 'meaning': 'एक छाता'},
        ],
        '4. Prepositions (संबंध सूचक)': [
          {'en': 'On the table', 'meaning': 'मेज़ पर'},
          {'en': 'In the room', 'meaning': 'कमरे में'},
          {'en': 'Under the tree', 'meaning': 'पेड़ के नीचे'},
          {'en': 'Behind the house', 'meaning': 'घर के पीछे'},
          {'en': 'Between two books', 'meaning': 'दो किताबों के बीच'},
        ],
        '5. Conjunctions (समुच्चय बोधक)': [
          {'en': 'And (Tea and Coffee)', 'meaning': 'और (चाय और कॉफी)'},
          {
            'en': 'But (He came but left)',
            'meaning': 'लेकिन (वह आया लेकिन चला गया)',
          },
          {'en': 'Because (I am late because...)', 'meaning': 'क्योंकि'},
          {'en': 'Or (This or That)', 'meaning': 'या (यह या वह)'},
          {'en': 'So (So I decided)', 'meaning': 'इसलिए'},
        ],
        '6. Modal Verbs & Questions': [
          {'en': 'Can (I can do it)', 'meaning': 'सकता है (मैं कर सकता हूँ)'},
          {
            'en': 'Must (You must go)',
            'meaning': 'चाहिए (तुम्हें जाना ही होगा)',
          },
          {
            'en': 'Should (You should study)',
            'meaning': 'चाहिए (तुम्हें पढ़ना चाहिए)',
          },
          {'en': 'What is your name?', 'meaning': 'आपका नाम क्या है?'},
          {'en': 'Where are you going?', 'meaning': 'आप कहाँ जा रहे हैं?'},
        ],
      },
      'vocab_topics': {
        '1. Daily Words (दैनिक शब्द)': [
          {'en': 'Water', 'meaning': 'पानी'},
          {'en': 'Food', 'meaning': 'खाना'},
          {'en': 'Time', 'meaning': 'समय'},
          {'en': 'Money', 'meaning': 'पैसा'},
          {'en': 'Work', 'meaning': 'काम'},
        ],
        '2. Fruits & Vegetables (फल और सब्जियां)': [
          {'en': 'Mango', 'meaning': 'आम'},
          {'en': 'Banana', 'meaning': 'केला'},
          {'en': 'Onion', 'meaning': 'प्याज'},
          {'en': 'Potato', 'meaning': 'आलू'},
          {'en': 'Tomato', 'meaning': 'टमाटर'},
        ],
        '3. Household Items (घरेलू वस्तुएं)': [
          {'en': 'Chair', 'meaning': 'कुर्सी'},
          {'en': 'Table', 'meaning': 'मेज'},
          {'en': 'Bed', 'meaning': 'बिस्तर'},
          {'en': 'Fan', 'meaning': 'पंखा'},
          {'en': 'Mirror', 'meaning': 'आईना'},
        ],
        '4. Relationships & Body Parts (रिश्ते और शरीर के अंग)': [
          {'en': 'Father / Mother', 'meaning': 'पिता / माता'},
          {'en': 'Brother / Sister', 'meaning': 'भाई / बहन'},
          {'en': 'Eyes / Ears', 'meaning': 'आँखें / कान'},
          {'en': 'Hands / Legs', 'meaning': 'हाथ / पैर'},
          {'en': 'Heart', 'meaning': 'दिल'},
        ],
        '5. Antonyms & Synonyms (विपरीत और समानार्थी शब्द)': [
          {'en': 'Hot x Cold', 'meaning': 'गर्म x ठण्डा (विलोम)'},
          {'en': 'Big x Small', 'meaning': 'बड़ा x छोटा (विलोम)'},
          {'en': 'Happy = Joyful', 'meaning': 'खुश (समानार्थी)'},
          {'en': 'Fast = Quick', 'meaning': 'तेज (समानार्थी)'},
          {'en': 'Begin = Start', 'meaning': 'शुरू करना (समानार्थी)'},
        ],
      },
      'conversation_topics': {
        '1. Self Introduction (आत्म परिचय)': [
          {'en': 'My name is Ak.', 'meaning': 'मेरा नाम अक है।'},
          {'en': 'I am from Karnataka.', 'meaning': 'मैं कर्नाटक से हूँ।'},
          {'en': 'I am a student.', 'meaning': 'मैं एक छात्र हूँ।'},
          {'en': 'Nice to meet you.', 'meaning': 'आपसे मिलकर ख़ुशी हुई।'},
          {'en': 'My hobby is reading.', 'meaning': 'पढ़ना मेरा शौक है।'},
        ],
        '2. Shop & Supermarket (दुकान और सुपरमार्केट)': [
          {'en': 'How much is this?', 'meaning': 'इसकी कीमत क्या है?'},
          {
            'en': 'Do you have fresh apples?',
            'meaning': 'क्या आपके पास ताज़ा सेब हैं?',
          },
          {'en': 'Please give me a bag.', 'meaning': 'कृपया मुझे एक थैला दें।'},
          {
            'en': 'Can I pay using UPI?',
            'meaning': 'क्या मैं यूपीआई से भुगतान कर सकता हूँ?',
          },
          {'en': 'Give me the bill, please.', 'meaning': 'कृपया बिल दीजिए।'},
        ],
        '3. Hospital & Medical (अस्पताल और मेडिकल शॉप)': [
          {
            'en': 'I need to see a doctor.',
            'meaning': 'मुझे डॉक्टर से मिलना है।',
          },
          {
            'en': 'I have a fever and headache.',
            'meaning': 'मुझे बुखार और सिरदर्द है।',
          },
          {
            'en': 'Do you have this tablet?',
            'meaning': 'क्या आपके पास यह टैबलेट है?',
          },
          {
            'en': 'How should I take this medicine?',
            'meaning': 'मुझे यह दवा कैसे लेनी चाहिए?',
          },
          {'en': 'Where is the pharmacy?', 'meaning': 'मेडिकल स्टोर कहाँ है?'},
        ],
        '4. Travel & Transport (यात्रा और बस/रेलगाड़ी)': [
          {'en': 'Where is the bus stand?', 'meaning': 'बस स्टैंड कहाँ है?'},
          {
            'en': 'One ticket to Bengaluru, please.',
            'meaning': 'बेंगलुरु का एक टिकट दीजिए।',
          },
          {
            'en': 'What time does the train arrive?',
            'meaning': 'ट्रेन किस समय आती है?',
          },
          {'en': 'Is this seat vacant?', 'meaning': 'क्या यह सीट खाली है?'},
          {
            'en': 'Please tell me when the stop comes.',
            'meaning': 'स्टॉप आने पर कृपया मुझे बताएं।',
          },
        ],
        '5. Hotel & Restaurant (होटल और रेस्तरां)': [
          {
            'en': 'Can I see the menu?',
            'meaning': 'क्या मैं मेनू देख सकता हूँ?',
          },
          {
            'en': 'Please bring one Dosa and Tea.',
            'meaning': 'कृपया एक डोसा और चाय लाएं।',
          },
          {'en': 'Is the food spicy?', 'meaning': 'क्या खाना तीखा है?'},
          {'en': 'Please bring the check/bill.', 'meaning': 'कृपया बिल लाएं।'},
          {
            'en': 'The food was delicious.',
            'meaning': 'खाना बहुत स्वादिष्ट था।',
          },
        ],
        '6. With Friends (दोस्तों के साथ बातचीत)': [
          {'en': 'Hey, how are you doing?', 'meaning': 'अरे, कैसे हो?'},
          {
            'en': 'Let us meet this weekend.',
            'meaning': 'आइए इस वीकेंड मिलते हैं।',
          },
          {'en': 'Did you watch the match?', 'meaning': 'क्या तुमने मैच देखा?'},
          {'en': 'Let us go for coffee.', 'meaning': 'कॉफी पीने चलते हैं।'},
          {
            'en': 'Call me when you reach home.',
            'meaning': 'घर पहुँचने पर मुझे कॉल करना।',
          },
        ],
      },
      'practice_list': [
        {'prompt': 'मैं घर पर हूँ', 'english': 'I am at home'},
        {'prompt': 'तुम कहाँ जा रहे हो?', 'english': 'Where are you going'},
        {'prompt': 'यह बहुत अच्छा है', 'english': 'This is very good'},
        {'prompt': 'हम कल मिलते हैं', 'english': 'Let us meet tomorrow'},
        {'prompt': 'तुम क्या कर रहे हो?', 'english': 'What are you doing'},
      ],
    },
    'తెలుగు (Telugu)': {
      'app_title': 'ఆంగ్ల మిత్ర',
      'home': 'హోమ్ పేజీ',
      'practice': 'అభ్యాసం',
      'profile': 'ప్రొఫైల్',
      'community': 'సంఘం',
      'welcome': 'స్వాగతం',
      'level': 'స్థాయి',
      'banner': '📢 ప్రకటన (Ad)',
      'leaderboard': 'టాప్ ర్యాంక్ లీడర్‌బోర్డ్',
      'greeting': 'నమస్కారం',
      'grammar': '1. వ్యాకరణం (Grammar)',
      'vocabulary': '2. పదజాలం (Vocabulary)',
      'conversation': '3. సంభాషణ (Conversation)',
      'listen_pronounce': '4. వినడం మరియు ఉచ్ఛరించడం',
      'daily_quiz': '💡 రోజువారీ క్విజ్ (Daily Quiz)',
      'translation_practice': '✍️ ఆంగ్ల అనువాద అభ్యాసం',
      'check': 'తనిఖీ చేయండి',
      'next': 'తదుపరి పదం',
      'community_hint': 'సంఘంలో ఏదైనా వ్రాయండి...',
      'post': 'పోస్ట్',
      'reply': 'ప్రత్యుత్తరం',
      'send': 'పంపు',
      'first_lang_title': '🌐 మొదటి భాష (First Language)',
      'lang_desc': 'ఏదైనా భాషను క్లిక్ చేస్తే యాప్ వెంటనే ఆ భాషకు మారుతుంది.',
      'practice_prompt': 'ఈ తెలుగు వాక్యాన్ని ఇంగ్లీషులో టైప్ చేయండి:',
      'grammar_topics': {
        '1. Parts of Speech (నామవాచకం, క్రియ...)': [
          {'en': 'Noun (Apple)', 'meaning': 'యాపిల్ (నామవాచకం)'},
          {'en': 'Pronoun (He)', 'meaning': 'అతను (సర్వనామం)'},
          {'en': 'Verb (Run)', 'meaning': 'పరుగెత్తు (క్రియ)'},
          {'en': 'Adjective (Smart)', 'meaning': 'తెలివైన (విశేషణం)'},
          {'en': 'Adverb (Quickly)', 'meaning': 'తొందరగా (క్రియావిశేషణం)'},
        ],
        '2. Tenses (కాలాలు)': [
          {
            'en': 'Present Tense (I eat)',
            'meaning': 'వర్తమాన కాలం (నేను తింటున్నాను)',
          },
          {'en': 'Past Tense (I ate)', 'meaning': 'భూతకాలం (నేను తిన్నాను)'},
          {
            'en': 'Future Tense (I will eat)',
            'meaning': 'భవిష్యత్తు కాలం (నేను తింటాను)',
          },
          {'en': 'Continuous (I am eating)', 'meaning': 'నిరంతర క్రియ'},
          {'en': 'Perfect (I have eaten)', 'meaning': 'పూర్తయిన క్రియ'},
        ],
        '3. Articles (a, an, the)': [
          {'en': 'A book', 'meaning': 'ఒక పుస్తకం'},
          {'en': 'An apple', 'meaning': 'ఒక యాపిల్'},
          {'en': 'The Sun', 'meaning': 'సూర్యుడు'},
          {'en': 'A doctor', 'meaning': 'ఒక డాక్టర్'},
          {'en': 'An umbrella', 'meaning': 'ఒక గొడుగు'},
        ],
        '4. Prepositions (స్థాన సూచికలు)': [
          {'en': 'On the table', 'meaning': 'బల్ల పైన'},
          {'en': 'In the room', 'meaning': 'గది లోపల'},
          {'en': 'Under the tree', 'meaning': 'చెట్టు కింద'},
          {'en': 'Behind the house', 'meaning': 'ఇంటి వెనుక'},
          {'en': 'Between two books', 'meaning': 'రెండు పుస్తకాల మధ్య'},
        ],
        '5. Conjunctions (సంధానపదాలు)': [
          {'en': 'And (Tea and Coffee)', 'meaning': 'మరియు'},
          {'en': 'But (He came but left)', 'meaning': 'కానీ'},
          {'en': 'Because (I am late because...)', 'meaning': 'ఎందుకంటే'},
          {'en': 'Or (This or That)', 'meaning': 'లేదా'},
          {'en': 'So (So I decided)', 'meaning': 'కాబట్టి'},
        ],
        '6. Modal Verbs & Questions': [
          {'en': 'Can (I can do it)', 'meaning': 'చేయగలను'},
          {'en': 'Must (You must go)', 'meaning': 'తప్పకుండా వెళ్ళాలి'},
          {'en': 'Should (You should study)', 'meaning': 'చదువుకోవాలి'},
          {'en': 'What is your name?', 'meaning': 'నీ పేరు ఏమిటి?'},
          {
            'en': 'Where are you going?',
            'meaning': 'నువ్వు ఎక్కడికి వెళ్తున్నావు?',
          },
        ],
      },
      'vocab_topics': {
        '1. Daily Words (రోజువారీ పదాలు)': [
          {'en': 'Water', 'meaning': 'నీళ్ళు'},
          {'en': 'Food', 'meaning': 'ఆహారం'},
          {'en': 'Time', 'meaning': 'సమయం'},
          {'en': 'Money', 'meaning': 'డబ్బు'},
          {'en': 'Work', 'meaning': 'పని'},
        ],
        '2. Fruits & Vegetables (పండ్లు మరియు కూరగాయలు)': [
          {'en': 'Mango', 'meaning': 'మామిడి పండు'},
          {'en': 'Banana', 'meaning': 'అరటిపండు'},
          {'en': 'Onion', 'meaning': 'ఉల్లిపాయ'},
          {'en': 'Potato', 'meaning': 'బంగాళాదుంప'},
          {'en': 'Tomato', 'meaning': 'టమోటా'},
        ],
        '3. Household Items (ఇంటి వస్తువులు)': [
          {'en': 'Chair', 'meaning': 'కుర్చీ'},
          {'en': 'Table', 'meaning': 'బల్ల'},
          {'en': 'Bed', 'meaning': 'మంచం'},
          {'en': 'Fan', 'meaning': 'ఫ్యాన్'},
          {'en': 'Mirror', 'meaning': 'అద్దం'},
        ],
        '4. Relationships & Body Parts (బంధాలు మరియు శరీర భాగాలు)': [
          {'en': 'Father / Mother', 'meaning': 'తండ్రి / తల్లి'},
          {'en': 'Brother / Sister', 'meaning': 'సోదరుడు / సోదరి'},
          {'en': 'Eyes / Ears', 'meaning': 'కళ్ళు / చెవులు'},
          {'en': 'Hands / Legs', 'meaning': 'చేతులు / కాళ్ళు'},
          {'en': 'Heart', 'meaning': 'గుండె'},
        ],
        '5. Antonyms & Synonyms (వ్యతిరేక మరియు సమానార్థకాలు)': [
          {'en': 'Hot x Cold', 'meaning': 'వేడి x చల్లని (వ్యతిరేకం)'},
          {'en': 'Big x Small', 'meaning': 'పెద్ద x చిన్న (వ్యతిరేకం)'},
          {'en': 'Happy = Joyful', 'meaning': 'సంతోషం (సమానార్థకం)'},
          {'en': 'Fast = Quick', 'meaning': 'వేగం (సమానార్థకం)'},
          {'en': 'Begin = Start', 'meaning': 'ప్రారంభం (సమానార్థకం)'},
        ],
      },
      'conversation_topics': {
        '1. Self Introduction (ಸ್ವಯಂ ಪರಿಚయం)': [
          {'en': 'My name is Ak.', 'meaning': 'నా పేరు అక్.'},
          {
            'en': 'I am from Karnataka.',
            'meaning': 'నేను కర్ణాటకకు చెందినవాడిని.',
          },
          {'en': 'I am a student.', 'meaning': 'నేను ఒక విద్యార్థిని.'},
          {
            'en': 'Nice to meet you.',
            'meaning': 'మిమ్మల్ని కలవడం సంతోషంగా ఉంది.',
          },
          {'en': 'My hobby is reading.', 'meaning': 'చదవడం నా అభిరుచి.'},
        ],
        '2. Shop & Supermarket (షాపు మరియు సూపర్‌మార్కెట్)': [
          {'en': 'How much is this?', 'meaning': 'దీని ధర ఎంత?'},
          {
            'en': 'Do you have fresh apples?',
            'meaning': 'మీ దగ్గర తాజా యాపిల్స్ ఉన్నాయా?',
          },
          {
            'en': 'Please give me a bag.',
            'meaning': 'దయచేసి నాకు ఒక సంచి ఇవ్వండి.',
          },
          {
            'en': 'Can I pay using UPI?',
            'meaning': 'నేను UPI ద్వారా చెల్లించవచ్చా?',
          },
          {
            'en': 'Give me the bill, please.',
            'meaning': 'దయచేసి బిల్లు ఇవ్వండి.',
          },
        ],
        '3. Hospital & Medical (ఆసుపత్రి మరియు మెడికల్ షాప్)': [
          {
            'en': 'I need to see a doctor.',
            'meaning': 'నేను డాక్టర్‌ను కలవాలి.',
          },
          {
            'en': 'I have a fever and headache.',
            'meaning': 'నాకు జ్వరం మరియు తలనొప్పిగా ఉంది.',
          },
          {
            'en': 'Do you have this tablet?',
            'meaning': 'మీ దగ్గర ఈ టాబ్లెట్ ఉందా?',
          },
          {
            'en': 'How should I take this medicine?',
            'meaning': 'ఈ మందును ఎలా వేసుకోవాలి?',
          },
          {'en': 'Where is the pharmacy?', 'meaning': 'ఫార్మసీ ఎక్కడ ఉంది?'},
        ],
        '4. Travel & Transport (ప్రయాణం మరియు బస్సు/రైలు)': [
          {
            'en': 'Where is the bus stand?',
            'meaning': 'బస్ స్టాండ్ ఎక్కడ ఉంది?',
          },
          {
            'en': 'One ticket to Bengaluru, please.',
            'meaning': 'బెంగళూరుకు ఒక టికెట్ ఇవ్వండి.',
          },
          {
            'en': 'What time does the train arrive?',
            'meaning': 'రైలు ఏ సమయానికి వస్తుంది?',
          },
          {'en': 'Is this seat vacant?', 'meaning': 'ఈ సీటు ఖాళీగా ఉందా?'},
          {
            'en': 'Please tell me when the stop comes.',
            'meaning': 'స్టాప్ రాగానే నాకు చెప్పండి.',
          },
        ],
        '5. Hotel & Restaurant (హోటల్ మరియు రెస్టారెంట్)': [
          {'en': 'Can I see the menu?', 'meaning': 'నేను మెనూ చూడవచ్చా?'},
          {
            'en': 'Please bring one Dosa and Tea.',
            'meaning': 'ఒక దోస మరియు టీ తీసుకురండి.',
          },
          {'en': 'Is the food spicy?', 'meaning': 'ఆహారం కారంగా ఉందా?'},
          {
            'en': 'Please bring the check/bill.',
            'meaning': 'దయచేసి బిల్లు తీసుకురండి.',
          },
          {
            'en': 'The food was delicious.',
            'meaning': 'ఆహారం చాలా రుచిగా ఉంది.',
          },
        ],
        '6. With Friends (స్నేహితులతో సంభాషణ)': [
          {'en': 'Hey, how are you doing?', 'meaning': 'హే, ఎలా ఉన్నావు?'},
          {
            'en': 'Let us meet this weekend.',
            'meaning': 'ఈ వారాంతంలో కలుద్దాం.',
          },
          {
            'en': 'Did you watch the match?',
            'meaning': 'నువ్వు మ్యాచ్ చూశావా?',
          },
          {'en': 'Let us go for coffee.', 'meaning': 'కాఫీ తాగడానికి వెళ్దాం.'},
          {
            'en': 'Call me when you reach home.',
            'meaning': 'ఇంటికి చేరిన తర్వాత నాకు ఫోన్ చేయి.',
          },
        ],
      },
      'practice_list': [
        {'prompt': 'నేను ఇంట్లో ఉన్నాను', 'english': 'I am at home'},
        {
          'prompt': 'నువ్వు ఎక్కడికి వెళ్తున్నావు?',
          'english': 'Where are you going',
        },
        {'prompt': 'ఇది చాలా బాగుంది', 'english': 'This is very good'},
        {'prompt': 'మనం రేపు కలుద్దాం', 'english': 'Let us meet tomorrow'},
        {'prompt': 'నువ్వు ఏం చేస్తున్నావు?', 'english': 'What are you doing'},
      ],
    },
    'தமிழ் (Tamil)': {
      'app_title': 'ஆங்கில மித்ரா',
      'home': 'முகப்பு',
      'practice': 'பயிற்சி',
      'profile': 'சுயவிவரம்',
      'community': 'சமூகம்',
      'welcome': 'நல்வரவு',
      'level': 'நிலை',
      'banner': '📢 விளம்பரம் (Ad)',
      'leaderboard': 'சிறந்த தரவரிசை பலகை',
      'greeting': 'வணக்கம்',
      'grammar': '1. இலக்கணம் (Grammar)',
      'vocabulary': '2. சொற்களஞ்சியம் (Vocabulary)',
      'conversation': '3. உரையாடல் (Conversation)',
      'listen_pronounce': '4. கேட்டல் மற்றும் உச்சரிப்பு',
      'daily_quiz': '💡 தினசரி வினாடி வினா (Daily Quiz)',
      'translation_practice': '✍️ ஆங்கில மொழிபெயர்ப்பு பயிற்சி',
      'check': 'சரிபார்க்கவும்',
      'next': 'அடுத்த சொல்',
      'community_hint': 'சமூகத்தில் ஏதாவது எழுதுங்கள்...',
      'post': 'பதிவு',
      'reply': 'பதில்',
      'send': 'அனுப்பு',
      'first_lang_title': '🌐 முதல் மொழி (First Language)',
      'lang_desc':
          'எந்த மொழியைக் கிளிக் செய்தாலும் ஆப் உடனடியாக அந்த மொழிக்கு மாறும்.',
      'practice_prompt':
          'இந்த தமிழ் வாக்கியத்தை ஆங்கிலத்தில் தட்டச்சு செய்யவும்:',
      'grammar_topics': {
        '1. Parts of Speech (பெயர்ச்சொல், வினைச்சொல்...)': [
          {'en': 'Noun (Apple)', 'meaning': 'ஆப்பிள் (பெயர்ச்சொல்)'},
          {'en': 'Pronoun (He)', 'meaning': 'அவன் (பிரதிப்பெயர்ச்சொல்)'},
          {'en': 'Verb (Run)', 'meaning': 'ஓடு (வினைச்சொல்)'},
          {'en': 'Adjective (Smart)', 'meaning': 'அழகான (உரிச்சொல்)'},
          {'en': 'Adverb (Quickly)', 'meaning': 'வேகமாக (வினையுரிச்சொல்)'},
        ],
        '2. Tenses (காலங்கள்)': [
          {
            'en': 'Present Tense (I eat)',
            'meaning': 'நிகழ்காலம் (நான் சாப்பிடுகிறேன்)',
          },
          {
            'en': 'Past Tense (I ate)',
            'meaning': 'இறந்தகாலம் (நான் சாப்பிட்டேன்)',
          },
          {
            'en': 'Future Tense (I will eat)',
            'meaning': 'எதிர்காலம் (நான் சாப்பிடுவேன்)',
          },
          {'en': 'Continuous (I am eating)', 'meaning': 'தொடர் காலம்'},
          {'en': 'Perfect (I have eaten)', 'meaning': 'நிறைவுற்ற காலம்'},
        ],
        '3. Articles (a, an, the)': [
          {'en': 'A book', 'meaning': 'ஒரு புத்தகம்'},
          {'en': 'An apple', 'meaning': 'ஒரு ஆப்பிள்'},
          {'en': 'The Sun', 'meaning': 'சூரியன்'},
          {'en': 'A doctor', 'meaning': 'ஒரு மருத்துவர்'},
          {'en': 'An umbrella', 'meaning': 'ஒரு குடை'},
        ],
        '4. Prepositions (இடப்பொருள் சுட்டிகள்)': [
          {'en': 'On the table', 'meaning': 'மேசை மேல்'},
          {'en': 'In the room', 'meaning': 'அறைக்குள்'},
          {'en': 'Under the tree', 'meaning': 'மரத்தின் கீழே'},
          {'en': 'Behind the house', 'meaning': 'வீட்டின் பின்னால்'},
          {
            'en': 'Between two books',
            'meaning': 'இரண்டு புத்தகங்களுக்கு இடையில்',
          },
        ],
        '5. Conjunctions (இணைப்புச்சொற்கள்)': [
          {'en': 'And (Tea and Coffee)', 'meaning': 'மற்றும்'},
          {'en': 'But (He came but left)', 'meaning': 'ஆனால்'},
          {'en': 'Because (I am late because...)', 'meaning': 'ஏனெனில்'},
          {'en': 'Or (This or That)', 'meaning': 'அல்லது'},
          {'en': 'So (So I decided)', 'meaning': 'ஆகையால்'},
        ],
        '6. Modal Verbs & Questions': [
          {'en': 'Can (I can do it)', 'meaning': 'முடியும்'},
          {'en': 'Must (You must go)', 'meaning': 'கட்டாயம் செல்ல வேண்டும்'},
          {'en': 'Should (You should study)', 'meaning': 'படிக்க வேண்டும்'},
          {'en': 'What is your name?', 'meaning': 'உன் பெயர் என்ன?'},
          {'en': 'Where are you going?', 'meaning': 'எங்கே செல்கிறாய்?'},
        ],
      },
      'vocab_topics': {
        '1. Daily Words (தினசரி சொற்கள்)': [
          {'en': 'Water', 'meaning': 'தண்ணீர்'},
          {'en': 'Food', 'meaning': 'உணவு'},
          {'en': 'Time', 'meaning': 'நேரம்'},
          {'en': 'Money', 'meaning': 'பணம்'},
          {'en': 'Work', 'meaning': 'வேலை'},
        ],
        '2. Fruits & Vegetables (பழங்கள் மற்றும் காய்கறிகள்)': [
          {'en': 'Mango', 'meaning': 'மாம்பழம்'},
          {'en': 'Banana', 'meaning': 'வாழைப்பழம்'},
          {'en': 'Onion', 'meaning': 'வெங்காயம்'},
          {'en': 'Potato', 'meaning': 'உருளைக்கிழங்கு'},
          {'en': 'Tomato', 'meaning': 'தக்காளி'},
        ],
        '3. Household Items (வீட்டுப் பொருட்கள்)': [
          {'en': 'Chair', 'meaning': 'நாற்காலி'},
          {'en': 'Table', 'meaning': 'மேசை'},
          {'en': 'Bed', 'meaning': 'படுக்கை'},
          {'en': 'Fan', 'meaning': 'மின்விசிறி'},
          {'en': 'Mirror', 'meaning': 'கண்ணாடி'},
        ],
        '4. Relationships & Body Parts (உறவுகள் மற்றும் உடல் உறுப்புகள்)': [
          {'en': 'Father / Mother', 'meaning': 'தந்தை / தாய்'},
          {'en': 'Brother / Sister', 'meaning': 'சகோதரன் / சகோதரி'},
          {'en': 'Eyes / Ears', 'meaning': 'கண்கள் / காதுகள்'},
          {'en': 'Hands / Legs', 'meaning': 'கைகள் / கால்கள்'},
          {'en': 'Heart', 'meaning': 'இதயம்'},
        ],
        '5. Antonyms & Synonyms (எதிர்ச்சொல் மற்றும் ஒத்த சொற்கள்)': [
          {'en': 'Hot x Cold', 'meaning': 'சூடு x குளிர் (எதிர்ச்சொல்)'},
          {'en': 'Big x Small', 'meaning': 'பெரிய x சிறிய (எதிர்ச்சொல்)'},
          {'en': 'Happy = Joyful', 'meaning': 'மகிழ்ச்சி (ஒத்த சொல்)'},
          {'en': 'Fast = Quick', 'meaning': 'வேகம் (ஒத்த சொல்)'},
          {'en': 'Begin = Start', 'meaning': 'தொடங்கு (ஒத்த சொல்)'},
        ],
      },
      'conversation_topics': {
        '1. Self Introduction (சுய அறிமுகம்)': [
          {'en': 'My name is Ak.', 'meaning': 'என் பெயர் அக்.'},
          {
            'en': 'I am from Karnataka.',
            'meaning': 'நான் கர்நாடகாவைச் சேர்ந்தவன்.',
          },
          {'en': 'I am a student.', 'meaning': 'நான் ஒரு மாணவன்.'},
          {
            'en': 'Nice to meet you.',
            'meaning': 'உங்களைச் சந்தித்ததில் மகிழ்ச்சி.',
          },
          {
            'en': 'My hobby is reading.',
            'meaning': 'படிப்பத என் பொழுதுபோக்கு.',
          },
        ],
        '2. Shop & Supermarket (கடை மற்றும் பல்பொருள் அங்காடி)': [
          {'en': 'How much is this?', 'meaning': 'இதன் விலை என்ன?'},
          {
            'en': 'Do you have fresh apples?',
            'meaning': 'உங்களிடம் புதிய ஆப்பிள் உள்ளதா?',
          },
          {
            'en': 'Please give me a bag.',
            'meaning': 'தயவுசெய்து ஒரு பை தாருங்கள்.',
          },
          {
            'en': 'Can I pay using UPI?',
            'meaning': 'நான் யுபிஐ மூலம் பணம் செலுத்தலாமா?',
          },
          {
            'en': 'Give me the bill, please.',
            'meaning': 'தயவுசெய்து பில் தாருங்கள்.',
          },
        ],
        '3. Hospital & Medical (மருத்துவமனை மற்றும் மருந்தகம்)': [
          {
            'en': 'I need to see a doctor.',
            'meaning': 'நான் ஒரு மருத்துவரைப் பார்க்க வேண்டும்.',
          },
          {
            'en': 'I have a fever and headache.',
            'meaning': 'எனக்கு காய்ச்சலும் தலைவலியும் உள்ளது.',
          },
          {
            'en': 'Do you have this tablet?',
            'meaning': 'உங்களிடம் இந்த மாத்திரை உள்ளதா?',
          },
          {
            'en': 'How should I take this medicine?',
            'meaning': 'இந்த மருந்தை எப்படி எடுத்துக் கொள்ள வேண்டும்?',
          },
          {
            'en': 'Where is the pharmacy?',
            'meaning': 'மருந்தகம் எங்கே உள்ளது?',
          },
        ],
        '4. Travel & Transport (பயணம் மற்றும் பேருந்து/ரயில்)': [
          {
            'en': 'Where is the bus stand?',
            'meaning': 'பேருந்து நிலையம் எங்கே?',
          },
          {
            'en': 'One ticket to Bengaluru, please.',
            'meaning': 'பெங்களூருக்கு ஒரு டிக்கெட் தாருங்கள்.',
          },
          {
            'en': 'What time does the train arrive?',
            'meaning': 'ரயில் எந்த நேரத்திற்கு வரும்?',
          },
          {
            'en': 'Is this seat vacant?',
            'meaning': 'இந்த இருக்கை காலியாக உள்ளதா?',
          },
          {
            'en': 'Please tell me when the stop comes.',
            'meaning': 'நிறுத்தம் வந்ததும் தயவுசெய்து சொல்லுங்கள்.',
          },
        ],
        '5. Hotel & Restaurant (விடுதி மற்றும் உணவகம்)': [
          {'en': 'Can I see the menu?', 'meaning': 'மெனுவை பார்க்கலாமா?'},
          {
            'en': 'Please bring one Dosa and Tea.',
            'meaning': 'ஒரு தோசை மற்றும் டீ கொண்டு வாருங்கள்.',
          },
          {'en': 'Is the food spicy?', 'meaning': 'உணவு காரமாக உள்ளதா?'},
          {
            'en': 'Please bring the check/bill.',
            'meaning': 'தயவுசெய்து பில்லைக் கொண்டு வாருங்கள்.',
          },
          {
            'en': 'The food was delicious.',
            'meaning': 'உணவு மிகவும் சுவையாக இருந்தது.',
          },
        ],
        '6. With Friends (நண்பர்களுடன் உரையாடல்)': [
          {
            'en': 'Hey, how are you doing?',
            'meaning': 'ஹே, எப்படி இருக்கிறாய்?',
          },
          {
            'en': 'Let us meet this weekend.',
            'meaning': 'இந்த வாரம் இறுதியில் சந்திப்போம்.',
          },
          {
            'en': 'Did you watch the match?',
            'meaning': 'நீ போட்டியைப் பார்த்தாயா?',
          },
          {'en': 'Let us go for coffee.', 'meaning': 'காபி குடிக்கப் போகலாம்.'},
          {
            'en': 'Call me when you reach home.',
            'meaning': 'வீடு சென்றதும் எனக்கு கால் செய்.',
          },
        ],
      },
      'practice_list': [
        {'prompt': 'நான் வீட்டில் இருக்கிறேன்', 'english': 'I am at home'},
        {'prompt': 'நீ எங்கே செல்கிறாய்?', 'english': 'Where are you going'},
        {'prompt': 'இது மிகவும் நல்லது', 'english': 'This is very good'},
        {'prompt': 'நாம் நாளை சந்திப்போம்', 'english': 'Let us meet tomorrow'},
        {'prompt': 'நீ என்ன செய்கிறாய்?', 'english': 'What are you doing'},
      ],
    },
    'मराठी (Marathi)': {
      'app_title': 'आंग्ल मित्र',
      'home': 'मुख्य पृष्ठ',
      'practice': 'सराव',
      'profile': 'प्रॉपिफाइल',
      'community': 'समुदाय',
      'welcome': 'स्वागत आहे',
      'level': 'पातळी',
      'banner': '📢 जाहिरात (Ad)',
      'leaderboard': 'शीर्ष क्रम लीडरबोर्ड',
      'greeting': 'नमस्कार',
      'grammar': '1. व्याकरण (Grammar)',
      'vocabulary': '2. शब्दसंग्रह (Vocabulary)',
      'conversation': '3. संभाषण (Conversation)',
      'listen_pronounce': '4. ऐकणे आणि उच्चारणे',
      'daily_quiz': '💡 दैनिक क्विझ (Daily Quiz)',
      'translation_practice': '✍️ इंग्रजी भाषांतर सराव',
      'check': 'तपासा',
      'next': 'पुढचा शब्द',
      'community_hint': 'समुदायात काहीतरी लिहा...',
      'post': 'पोस्ट',
      'reply': 'प्रत्युत्तर',
      'send': 'पाठवा',
      'first_lang_title': '🌐 पहिली भाषा (First Language)',
      'lang_desc': 'कोणतीही भाषा क्लिक केल्यावर अॅप लगेच त्या भाषेत बदलेल.',
      'practice_prompt': 'हे मराठी वाक्य इंग्रजीत टाइप करा:',
      'grammar_topics': {
        '1. Parts of Speech (नाम, सर्वनाम...)': [
          {'en': 'Noun (Apple)', 'meaning': 'सफरचंद (नाम)'},
          {'en': 'Pronoun (He)', 'meaning': 'तो (सर्वनाम)'},
          {'en': 'Verb (Run)', 'meaning': 'धावणे (क्रियापद)'},
          {'en': 'Adjective (Smart)', 'meaning': 'हुशार (विशेषण)'},
          {'en': 'Adverb (Quickly)', 'meaning': 'त्वरीत (क्रियाविशेषण)'},
        ],
        '2. Tenses (काळ)': [
          {'en': 'Present Tense (I eat)', 'meaning': 'वर्तमान काळ (मी खातो)'},
          {'en': 'Past Tense (I ate)', 'meaning': 'भूतकाळ (मी खाल्ले)'},
          {'en': 'Future Tense (I will eat)', 'meaning': 'भविष्यकाळ (मी खाईन)'},
          {'en': 'Continuous (I am eating)', 'meaning': 'चालू काळ'},
          {'en': 'Perfect (I have eaten)', 'meaning': 'पूर्ण काळ'},
        ],
        '3. Articles (a, an, the)': [
          {'en': 'A book', 'meaning': 'एक पुस्तक'},
          {'en': 'An apple', 'meaning': 'एक सफरचंद'},
          {'en': 'The Sun', 'meaning': 'सूर्य'},
          {'en': 'A doctor', 'meaning': 'एक डॉक्टर'},
          {'en': 'An umbrella', 'meaning': 'एक छत्री'},
        ],
        '4. Prepositions (शब्दयोगी अव्यय)': [
          {'en': 'On the table', 'meaning': 'टेबलावर'},
          {'en': 'In the room', 'meaning': 'खोलीत'},
          {'en': 'Under the tree', 'meaning': 'झाडाखाली'},
          {'en': 'Behind the house', 'meaning': 'घरामागे'},
          {'en': 'Between two books', 'meaning': 'दोन पुस्तकांच्या मध्ये'},
        ],
        '5. Conjunctions (उभयान्वयी अव्यय)': [
          {'en': 'And (Tea and Coffee)', 'meaning': 'आणि'},
          {'en': 'But (He came but left)', 'meaning': 'पण'},
          {'en': 'Because (I am late because...)', 'meaning': 'कारण'},
          {'en': 'Or (This or That)', 'meaning': 'किंवा'},
          {'en': 'So (So I decided)', 'meaning': 'म्हणून'},
        ],
        '6. Modal Verbs & Questions': [
          {'en': 'Can (I can do it)', 'meaning': 'शक्य आहे'},
          {'en': 'Must (You must go)', 'meaning': 'तुम्ही गेलेच पाहिजे'},
          {'en': 'Should (You should study)', 'meaning': 'अभ्यास केला पाहिजे'},
          {'en': 'What is your name?', 'meaning': 'तुमचे नाव काय आहे?'},
          {'en': 'Where are you going?', 'meaning': 'तुम्ही कुठे जात आहात?'},
        ],
      },
      'vocab_topics': {
        '1. Daily Words (दैनिक शब्द)': [
          {'en': 'Water', 'meaning': 'पाणी'},
          {'en': 'Food', 'meaning': 'अन्न'},
          {'en': 'Time', 'meaning': 'वेळ'},
          {'en': 'Money', 'meaning': 'पैसा'},
          {'en': 'Work', 'meaning': 'काम'},
        ],
        '2. Fruits & Vegetables (फळे आणि भाज्या)': [
          {'en': 'Mango', 'meaning': 'आंबा'},
          {'en': 'Banana', 'meaning': 'केळी'},
          {'en': 'Onion', 'meaning': 'कांदा'},
          {'en': 'Potato', 'meaning': 'बटाटा'},
          {'en': 'Tomato', 'meaning': 'टोमॅटो'},
        ],
        '3. Household Items (घरातील वस्तू)': [
          {'en': 'Chair', 'meaning': 'खुर्ची'},
          {'en': 'Table', 'meaning': 'टेबल'},
          {'en': 'Bed', 'meaning': 'पलंग'},
          {'en': 'Fan', 'meaning': 'पंखा'},
          {'en': 'Mirror', 'meaning': 'आरसा'},
        ],
        '4. Relationships & Body Parts (नातेसंबंध आणि शरीराचे अवयव)': [
          {'en': 'Father / Mother', 'meaning': 'वडील / आई'},
          {'en': 'Brother / Sister', 'meaning': 'भाऊ / बहीण'},
          {'en': 'Eyes / Ears', 'meaning': 'डोळे / कान'},
          {'en': 'Hands / Legs', 'meaning': 'हात / पाय'},
          {'en': 'Heart', 'meaning': 'हृदय'},
        ],
        '5. Antonyms & Synonyms (विरुद्धार्थी आणि समानार्थी शब्द)': [
          {'en': 'Hot x Cold', 'meaning': 'गरम x थंड (विरुद्धार्थी)'},
          {'en': 'Big x Small', 'meaning': 'मोठा x लहान (विरुद्धार्थी)'},
          {'en': 'Happy = Joyful', 'meaning': 'आनंद (समानाथी)'},
          {'en': 'Fast = Quick', 'meaning': 'वेगवान (समानार्थी)'},
          {'en': 'Begin = Start', 'meaning': 'सुरुवात करणे (समानार्थी)'},
        ],
      },
      'conversation_topics': {
        '1. Self Introduction (स्वयं परिचय)': [
          {'en': 'My name is Ak.', 'meaning': 'माझे नाव अक् आहे.'},
          {'en': 'I am from Karnataka.', 'meaning': 'मी कर्नाटकाचा आहे.'},
          {'en': 'I am a student.', 'meaning': 'मी एक विद्यार्थी आहे.'},
          {'en': 'Nice to meet you.', 'meaning': 'तुम्हाला भेटून आनंद झाला.'},
          {
            'en': 'My hobby is reading.',
            'meaning': 'वाचन करणे हा माझा छंद आहे.',
          },
        ],
        '2. Shop & Supermarket (दुकान आणि सुपरमार्केट)': [
          {'en': 'How much is this?', 'meaning': 'याची किंमत किती आहे?'},
          {
            'en': 'Do you have fresh apples?',
            'meaning': 'तुमच्याकडे ताजी सफरचंद आहेत का?',
          },
          {
            'en': 'Please give me a bag.',
            'meaning': 'कृपया मला एक पिशवी द्या.',
          },
          {
            'en': 'Can I pay using UPI?',
            'meaning': 'मी UPI द्वारे पैसे देऊ शकतो का?',
          },
          {'en': 'Give me the bill, please.', 'meaning': 'कृपया बिल द्या.'},
        ],
        '3. Hospital & Medical (रुग्णालय आणि मेडिकल शॉप)': [
          {
            'en': 'I need to see a doctor.',
            'meaning': 'मला डॉक्टरांना भेटायचे आहे.',
          },
          {
            'en': 'I have a fever and headache.',
            'meaning': 'मला ताप आणि डोकेदुखी आहे.',
          },
          {
            'en': 'Do you have this tablet?',
            'meaning': 'तुमच्याकडे ही गोळी आहे का?',
          },
          {
            'en': 'How should I take this medicine?',
            'meaning': 'मी हे औषध कसे घ्यावे?',
          },
          {'en': 'Where is the pharmacy?', 'meaning': 'औषध दुकान कुठे आहे?'},
        ],
        '4. Travel & Transport (प्रवास आणि बस/रेल्वे)': [
          {'en': 'Where is the bus stand?', 'meaning': 'बस स्टँड कुठे आहे?'},
          {
            'en': 'One ticket to Bengaluru, please.',
            'meaning': 'बंगळुरूसाठी एक तिकीट द्या.',
          },
          {
            'en': 'What time does the train arrive?',
            'meaning': 'ट्रेन किती वाजता येते?',
          },
          {'en': 'Is this seat vacant?', 'meaning': 'ही जागा रिकामी आहे का?'},
          {
            'en': 'Please tell me when the stop comes.',
            'meaning': 'स्टॉप आल्यावर कृपया सांगा.',
          },
        ],
        '5. Hotel & Restaurant (हॉटेल आणि रेस्टॉरंट)': [
          {'en': 'Can I see the menu?', 'meaning': 'मी मेनू पाहू शकतो का?'},
          {
            'en': 'Please bring one Dosa and Tea.',
            'meaning': 'कृपया एक डोसा आणि चहा आणा.',
          },
          {'en': 'Is the food spicy?', 'meaning': 'अन्न तिखट आहे का?'},
          {'en': 'Please bring the check/bill.', 'meaning': 'कृपया बिल आणा.'},
          {'en': 'The food was delicious.', 'meaning': 'जेवण खूप छान होते.'},
        ],
        '6. With Friends (मित्रांसोबत संवाद)': [
          {'en': 'Hey, how are you doing?', 'meaning': 'अरे, कसा आहेस?'},
          {
            'en': 'Let us meet this weekend.',
            'meaning': 'आपण या वीकेंडला भेटूया.',
          },
          {'en': 'Did you watch the match?', 'meaning': 'तू मॅच पाहिलस का?'},
          {'en': 'Let us go for coffee.', 'meaning': 'कॉफी पिण्यासाठी जाऊया.'},
          {
            'en': 'Call me when you reach home.',
            'meaning': 'घरी पोहोचल्यावर मला कॉल कर.',
          },
        ],
      },
      'practice_list': [
        {'prompt': 'मी घरी आहे', 'english': 'I am at home'},
        {'prompt': 'तू कुठे जात आहेस?', 'english': 'Where are you going'},
        {'prompt': 'हे खूप छान आहे', 'english': 'This is very good'},
        {'prompt': 'आपण उद्या भेटूया', 'english': 'Let us meet tomorrow'},
        {'prompt': 'तू काय करत आहेस?', 'english': 'What are you doing'},
      ],
    },
  };

  static String get(String key) {
    String lang = currentLanguage.value;
    return localizedData[lang]?[key] ?? localizedData['ಕನ್ನಡ (Kannada)']![key]!;
  }

  static Map<String, List<Map<String, String>>> getGrammarData() {
    String lang = currentLanguage.value;
    return Map<String, List<Map<String, String>>>.from(
      localizedData[lang]?['grammar_topics'] ??
          localizedData['ಕನ್ನಡ (Kannada)']!['grammar_topics']!,
    );
  }

  static Map<String, List<Map<String, String>>> getVocabData() {
    String lang = currentLanguage.value;
    return Map<String, List<Map<String, String>>>.from(
      localizedData[lang]?['vocab_topics'] ??
          localizedData['ಕನ್ನಡ (Kannada)']!['vocab_topics']!,
    );
  }

  static Map<String, List<Map<String, String>>> getConversationData() {
    String lang = currentLanguage.value;
    return Map<String, List<Map<String, String>>>.from(
      localizedData[lang]?['conversation_topics'] ??
          localizedData['ಕನ್ನಡ (Kannada)']!['conversation_topics']!,
    );
  }

  static List<Map<String, String>> getPracticeList() {
    String lang = currentLanguage.value;
    return List<Map<String, String>>.from(
      localizedData[lang]?['practice_list'] ??
          localizedData['ಕನ್ನಡ (Kannada)']!['practice_list']!,
    );
  }
}

class GlobalCommunityData {
  static List<PostModel> posts = [
    PostModel(
      username: 'ಸುರೇಶ್',
      content: 'ಹಲೋ! ಇಂದು ನಾನು 20 ಹೊಸ ಶಬ್ದಗಳನ್ನು ಕಲಿತೆ.',
      likes: 5,
      isLiked: false,
      replies: [
        ReplyModel(
          username: 'ರಾಜೇಶ್',
          content: 'ತುಂಬಾ ಒಳ್ಳೆಯದು!',
          likes: 2,
          isLiked: false,
        ),
      ],
    ),
  ];
}

class AnglaMitraApp extends StatelessWidget {
  const AnglaMitraApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: AppData.currentLanguage,
      builder: (context, lang, child) {
        return MaterialApp(
          title: 'ಆಂಗ್ಲ ಮಿತ್ರ',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: const Color(0xFFF9F6F0),
            fontFamily: 'Roboto',
          ),
          home: const WebContainerWrapper(child: LoginScreen()),
        );
      },
    );
  }
}

class WebContainerWrapper extends StatelessWidget {
  final Widget child;
  const WebContainerWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: Center(
        child: Container(
          width: 412,
          height: 870,
          decoration: BoxDecoration(
            color: const Color(0xFFF9F6F0),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.6),
                blurRadius: 25,
                spreadRadius: 8,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: child,
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _nameController = TextEditingController(text: '');
  String _selectedLevel = 'ಪ್ರಾಥಮಿಕ (Primary)';

  final List<String> _levels = [
    'ಪ್ರಾಥಮಿಕ (Primary)',
    'ಮಾಧ್ಯಮಿಕ (Intermediate)',
    'ಮುಂದುವರಿದ (Advanced)',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF6366F1),
                  Color(0xFF8B5CF6),
                  Color(0xFFEC4899),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.menu_book,
                            color: Colors.deepOrange,
                            size: 36,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'ಆಂಗ್ಲ ಮಿತ್ರ',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      const CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.indigo,
                        child: Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'ನಿಮ್ಮ ಹೆಸರು ನಮೂದಿಸಿ',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: const Icon(Icons.person_outline),
                        ),
                      ),
                      const SizedBox(height: 20),
                      DropdownButtonFormField<String>(
                        value: _selectedLevel,
                        decoration: InputDecoration(
                          labelText: 'ಲೆವೆಲ್ (Level)',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: const Icon(Icons.layers_outlined),
                        ),
                        items: _levels.map((String level) {
                          return DropdownMenuItem<String>(
                            value: level,
                            child: Text(level),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedLevel = newValue!;
                          });
                        },
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4F46E5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            String enteredName = _nameController.text.trim();
                            if (enteredName.isEmpty) enteredName = 'ಬಳಕೆದಾರ';

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WebContainerWrapper(
                                  child: WelcomeScreen(
                                    userName: enteredName,
                                    userLevel: _selectedLevel,
                                  ),
                                ),
                              ),
                            );
                          },
                          child: const Text(
                            'ಲಾಗಿನ್',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  final String userName;
  final String userLevel;

  const WelcomeScreen({
    Key? key,
    required this.userName,
    required this.userLevel,
  }) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => WebContainerWrapper(
              child: MainContainerScreen(
                userName: widget.userName,
                userLevel: widget.userLevel,
              ),
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.waving_hand, size: 80, color: Colors.amber),
            const SizedBox(height: 20),
            Text(
              '${AppData.get('welcome')}, ${widget.userName}!',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '${AppData.get('level')}: ${widget.userLevel}',
              style: const TextStyle(fontSize: 16, color: Colors.white70),
            ),
            const SizedBox(height: 30),
            const CircularProgressIndicator(color: Colors.amber),
          ],
        ),
      ),
    );
  }
}

class MainContainerScreen extends StatefulWidget {
  final String userName;
  final String userLevel;

  const MainContainerScreen({
    Key? key,
    required this.userName,
    required this.userLevel,
  }) : super(key: key);

  @override
  State<MainContainerScreen> createState() => _MainContainerScreenState();
}

class _MainContainerScreenState extends State<MainContainerScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      HomeScreen(userName: widget.userName),
      const PracticeScreen(),
      ProfileScreen(userName: widget.userName, userLevel: widget.userLevel),
      CommunityScreen(currentUserName: widget.userName),
    ];

    return ValueListenableBuilder<String>(
      valueListenable: AppData.currentLanguage,
      builder: (context, lang, child) {
        return Scaffold(
          body: pages[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color(0xFF4F46E5),
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.white,
            elevation: 12,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: AppData.get('home'),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.book),
                label: AppData.get('practice'),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person),
                label: AppData.get('profile'),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.people),
                label: AppData.get('community'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  final String userName;
  const HomeScreen({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: AppData.currentLanguage,
      builder: (context, lang, child) {
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFEEF2FF), Color(0xFFEDE9FE), Color(0xFFFAE8FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.menu_book,
                            color: Colors.deepOrange,
                            size: 28,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            AppData.get('app_title'),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xFF1E1B4B),
                            ),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.notifications_active_outlined,
                        color: Colors.indigo,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    '${AppData.get('greeting')}, $userName!',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF312E81),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '50% complete',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.local_fire_department,
                            color: Colors.orange,
                            size: 18,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Daily goal',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: 0.5,
                    backgroundColor: Colors.white,
                    color: Colors.indigo,
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.85),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.indigo.withOpacity(0.2)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.indigo.withOpacity(0.05),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        AppData.get('banner'),
                        style: const TextStyle(
                          color: Colors.indigoAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.3,
                    children: [
                      _buildCategoryCard(
                        context,
                        AppData.get('grammar'),
                        Icons.menu_book,
                        0.45,
                        const Color(0xFFFEF3C7),
                        const Color(0xFFD97706),
                        const GrammarDetailsScreen(),
                      ),
                      _buildCategoryCard(
                        context,
                        AppData.get('vocabulary'),
                        Icons.list_alt,
                        0.70,
                        const Color(0xFFD1FAE5),
                        const Color(0xFF059669),
                        const VocabDetailsScreen(),
                      ),
                      _buildCategoryCard(
                        context,
                        AppData.get('conversation'),
                        Icons.forum,
                        0.60,
                        const Color(0xFFDBEAFE),
                        const Color(0xFF2563EB),
                        const ConversationDetailsScreen(),
                      ),
                      _buildCategoryCard(
                        context,
                        AppData.get('listen_pronounce'),
                        Icons.mic,
                        0.35,
                        const Color(0xFFFCE7F3),
                        const Color(0xFFDB2777),
                        const ListenPronounceScreen(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF1E1B4B),
                          Color(0xFF312E81),
                          Color(0xFF4F46E5),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.indigo.withOpacity(0.4),
                          blurRadius: 12,
                          spreadRadius: 3,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.emoji_events_rounded,
                              color: Colors.amber,
                              size: 28,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              AppData.get('leaderboard'),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            _buildPodiumItem(
                              'Rajesh',
                              '1450 XP',
                              '2',
                              Colors.grey[400]!,
                              70,
                              0.6,
                            ),
                            _buildPodiumItem(
                              userName,
                              '1850 XP',
                              '1',
                              Colors.amber,
                              110,
                              1.0,
                            ),
                            _buildPodiumItem(
                              'Suresh',
                              '1100 XP',
                              '3',
                              Colors.brown[300]!,
                              55,
                              0.5,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.indigo.withOpacity(0.3)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        '${AppData.get('banner')} ( Bottom Ad )',
                        style: const TextStyle(
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCategoryCard(
    BuildContext context,
    String title,
    IconData icon,
    double progress,
    Color cardBgColor,
    Color iconColor,
    Widget targetScreen,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebContainerWrapper(child: targetScreen),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: cardBgColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: iconColor.withOpacity(0.15),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
          border: Border.all(color: iconColor.withOpacity(0.3), width: 1.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: iconColor,
                    ),
                  ),
                ),
                Icon(icon, size: 22, color: iconColor),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LinearProgressIndicator(
                  value: progress,
                  color: iconColor,
                  backgroundColor: Colors.white.withOpacity(0.7),
                ),
                const SizedBox(height: 4),
                Text(
                  '${(progress * 100).toInt()}%',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: iconColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPodiumItem(
    String name,
    String xp,
    String rank,
    Color color,
    double height,
    double opacity,
  ) {
    bool isFirst = rank == '1';
    return Opacity(
      opacity: opacity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (isFirst)
            const Icon(
              Icons.local_fire_department,
              color: Colors.amber,
              size: 22,
            ),
          CircleAvatar(
            radius: isFirst ? 24 : 18,
            backgroundColor: color,
            child: Text(
              rank,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isFirst ? Colors.black : Colors.white,
                fontSize: isFirst ? 16 : 12,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontWeight: isFirst ? FontWeight.bold : FontWeight.normal,
              fontSize: isFirst ? 14 : 11,
            ),
          ),
          Text(
            xp,
            style: const TextStyle(color: Colors.amberAccent, fontSize: 10),
          ),
          const SizedBox(height: 6),
          Container(
            width: isFirst ? 75 : 60,
            height: height,
            decoration: BoxDecoration(
              color: color.withOpacity(isFirst ? 0.6 : 0.3),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(8),
              ),
              border: Border.all(color: color, width: isFirst ? 2.5 : 1),
            ),
            child: Center(
              child: Text(
                '#$rank',
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: isFirst ? 20 : 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GrammarDetailsScreen extends StatelessWidget {
  const GrammarDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: AppData.currentLanguage,
      builder: (context, lang, child) {
        var grammarData = AppData.getGrammarData();

        return Scaffold(
          appBar: AppBar(
            title: Text(AppData.get('grammar')),
            backgroundColor: Colors.amber[800],
          ),
          body: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                color: Colors.amber[100],
                child: Center(
                  child: Text(
                    AppData.get('banner'),
                    style: TextStyle(
                      color: Colors.amber[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: grammarData.entries.map((entry) {
                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              entry.key,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber[900],
                              ),
                            ),
                            const Divider(),
                            ...entry.value.map((item) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4.0,
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.arrow_right,
                                      color: Colors.amber,
                                    ),
                                    Text(
                                      '${item['en']} - ',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        item['meaning']!,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class VocabDetailsScreen extends StatelessWidget {
  const VocabDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: AppData.currentLanguage,
      builder: (context, lang, child) {
        var vocabData = AppData.getVocabData();

        return Scaffold(
          appBar: AppBar(
            title: Text(AppData.get('vocabulary')),
            backgroundColor: Colors.green[800],
          ),
          body: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                color: Colors.green[50],
                child: Center(
                  child: Text(
                    AppData.get('banner'),
                    style: TextStyle(
                      color: Colors.green[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: vocabData.entries.map((entry) {
                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              entry.key,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[900],
                              ),
                            ),
                            const Divider(),
                            ...entry.value.map((item) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4.0,
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.check_circle_outline,
                                      color: Colors.green,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      '${item['en']} = ',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        item['meaning']!,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ConversationDetailsScreen extends StatelessWidget {
  const ConversationDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: AppData.currentLanguage,
      builder: (context, lang, child) {
        var conversationData = AppData.getConversationData();

        return Scaffold(
          appBar: AppBar(
            title: Text(AppData.get('conversation')),
            backgroundColor: Colors.blue[800],
          ),
          body: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                color: Colors.blue[50],
                child: Center(
                  child: Text(
                    AppData.get('banner'),
                    style: TextStyle(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: conversationData.entries.map((entry) {
                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              entry.key,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[900],
                              ),
                            ),
                            const Divider(),
                            ...entry.value.map((item) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 6.0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '🗣️ "${item['en']}"',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.indigo,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      '👉 ${item['meaning']}',
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ListenPronounceScreen extends StatelessWidget {
  const ListenPronounceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ಕೇಳುವುದು ಮತ್ತು ಉಚ್ಚರಿಸುವುದು')),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            color: Colors.blue[50],
            child: Center(
              child: Text(
                AppData.get('banner'),
                style: const TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFff9966), Color(0xFFff5e62)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.headphones,
                        size: 80,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'ಆಲಿಸಿ ಮತ್ತು ಸರಿಯಾಗಿ ಉಚ್ಚರಿಸಲು ಅಭ್ಯಾಸ ಮಾಡಿ.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.redAccent,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {},
                        icon: const Icon(Icons.play_arrow),
                        label: const Text(
                          'ಸ್ಟಾರ್ಟ್ (Start)',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PracticeScreen extends StatefulWidget {
  const PracticeScreen({Key? key}) : super(key: key);

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  late Timer _timer;
  Duration _timeUntilQuiz = Duration.zero;
  bool _isQuizAvailable = false;
  String _quizStatusText = "";

  final TextEditingController _answerController = TextEditingController();
  int _currentIndex = 0;
  String? _feedbackMessage;
  bool? _isCorrect;

  @override
  void initState() {
    super.initState();
    _updateTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateTime();
    });
  }

  void _updateTime() {
    DateTime now = DateTime.now();
    DateTime todayQuizStart = DateTime(now.year, now.month, now.day, 20, 5, 0);
    DateTime todayQuizEnd = DateTime(now.year, now.month, now.day, 21, 20, 0);

    setState(() {
      if (now.isBefore(todayQuizStart)) {
        _isQuizAvailable = false;
        _timeUntilQuiz = todayQuizStart.difference(now);
        _quizStatusText = "ರಾತ್ರಿ 8:05 ಕ್ಕೆ ಕ್ವಿಜ್ ಪ್ರಾರಂಭವಾಗುತ್ತದೆ";
      } else if (now.isAfter(todayQuizStart) && now.isBefore(todayQuizEnd)) {
        _isQuizAvailable = true;
        _timeUntilQuiz = todayQuizEnd.difference(now);
        _quizStatusText = "ಕ್ವಿಜ್ ಲೈವ್ ಇದೆ! ಮುಕ್ತಾಯಗೊಳ್ಳಲು ಉಳಿದ ಸಮಯ:";
      } else {
        _isQuizAvailable = false;
        DateTime tomorrowQuizStart = todayQuizStart.add(
          const Duration(days: 1),
        );
        _timeUntilQuiz = tomorrowQuizStart.difference(now);
        _quizStatusText = "ಮುಂದಿನ ಕ್ವಿಜ್‌ಗೆ ಉಳಿದಿರುವ ಸಮಯ (ನಾಳೆ ರಾತ್ರಿ 8:05)";
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _answerController.dispose();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);
    int seconds = duration.inSeconds.remainder(60);
    return '${hours.toString().padLeft(2, '0')} ಗಂಟೆ : ${minutes.toString().padLeft(2, '0')} ನಿಮಿಷ : ${seconds.toString().padLeft(2, '0')} ಸೆಕೆಂಡ್';
  }

  void _checkAnswer(List<Map<String, String>> quizList) {
    String userText = _answerController.text.trim().toLowerCase();
    String correctText = quizList[_currentIndex]['english']!.toLowerCase();

    setState(() {
      if (userText == correctText) {
        _isCorrect = true;
        _feedbackMessage = '🎉 ಸಕ್ಸಸ್! ನೀವು ಸರಿಯಾಗಿ ಕಲ್ತಿದ್ದೀರಿ!';
      } else {
        _isCorrect = false;
        _feedbackMessage =
            '❌ ಇದು ತಪ್ಪಾಗಿದೆ! ಸರಿಯಾದ ಉತ್ತರ: "${quizList[_currentIndex]['english']}"';
      }
    });
  }

  void _nextWord(int listLength) {
    setState(() {
      _currentIndex = (_currentIndex + 1) % listLength;
      _answerController.clear();
      _feedbackMessage = null;
      _isCorrect = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: AppData.currentLanguage,
      builder: (context, lang, child) {
        var quizList = AppData.getPracticeList();
        if (_currentIndex >= quizList.length) _currentIndex = 0;

        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFE0F2FE), Color(0xFF93C5FD), Color(0xFF60A5FA)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  color: Colors.white.withOpacity(0.9),
                  child: Center(
                    child: Text(
                      AppData.get('banner'),
                      style: const TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.95),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.1),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.quiz,
                                    color: Colors.teal,
                                    size: 24,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    AppData.get('daily_quiz'),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.teal,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                _quizStatusText,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.timer_outlined,
                                    color: Colors.deepOrange,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    _formatDuration(_timeUntilQuiz),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: _isQuizAvailable
                                        ? Colors.teal
                                        : Colors.grey,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_isQuizAvailable) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const WebContainerWrapper(
                                                child: SpecialQuizScreen(),
                                              ),
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                'ಕ್ವಿಜ್ ರಾತ್ರಿ 8:05 ರಿಂದ 9:20 ರ ನಡುವೆ ಮಾತ್ರ ಲಭ್ಯವಿರುತ್ತದೆ!',
                                              ),
                                              duration: Duration(seconds: 2),
                                            ),
                                          );
                                    }
                                  },
                                  child: Text(
                                    _isQuizAvailable
                                        ? 'ಕ್ವಿಜ್ ಪ್ರಾರಂಭಿಸಿ'
                                        : 'ಸಮಯವಾದ ನಂತರ ಪ್ರಯತ್ನಿಸಿ',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.95),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.1),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppData.get('translation_practice'),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    '${_currentIndex + 1} / ${quizList.length}',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '${AppData.get('practice_prompt')}\n👉 "${quizList[_currentIndex]['prompt']}"',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.indigo,
                                ),
                              ),
                              const SizedBox(height: 12),
                              TextField(
                                controller: _answerController,
                                decoration: InputDecoration(
                                  hintText: 'Type in English here...',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  isDense: true,
                                ),
                              ),
                              const SizedBox(height: 12),
                              if (_feedbackMessage != null) ...[
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: _isCorrect == true
                                        ? Colors.green[50]
                                        : Colors.red[50],
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: _isCorrect == true
                                          ? Colors.green
                                          : Colors.red,
                                    ),
                                  ),
                                  child: Text(
                                    _feedbackMessage!,
                                    style: TextStyle(
                                      color: _isCorrect == true
                                          ? Colors.green[800]
                                          : Colors.red[800],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                              ],
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                        color: Colors.teal,
                                      ),
                                    ),
                                    onPressed: () => _checkAnswer(quizList),
                                    child: Text(
                                      AppData.get('check'),
                                      style: const TextStyle(
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.teal,
                                    ),
                                    onPressed: () => _nextWord(quizList.length),
                                    child: Text(
                                      AppData.get('next'),
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SpecialQuizScreen extends StatelessWidget {
  const SpecialQuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ದೈನಂದಿನ ವಿಶೇಷ ಕ್ವಿಜ್'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            color: Colors.teal[50],
            child: Center(
              child: Text(
                AppData.get('banner'),
                style: const TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: const Text(
                      'ಪ್ರಶ್ನೆ 1: "How are you?" ಎಂಬುದರ ಸರಿಯಾದ ಕನ್ನಡ ಅರ್ಥವೇನು?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('A) ನೀವು ಹೇಗಿದ್ದೀರಿ?'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('B) ನೀವು ಎಲ್ಲಿದ್ದೀರಿ?'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('C) ನೀವು ಏನು ಮಾಡುತ್ತಿದ್ದೀರಿ?'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  final String userName;
  final String userLevel;

  const ProfileScreen({
    Key? key,
    required this.userName,
    required this.userLevel,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<String> languages = [
    'ಕನ್ನಡ (Kannada)',
    'हिंदी (Hindi)',
    'తెలుగు (Telugu)',
    'தமிழ் (Tamil)',
    'मराठी (Marathi)',
  ];

  Future<void> _shareApp(String platform) async {
    String url = '';
    String shareText = Uri.encodeComponent(
      'ಆಂಗ್ಲ ಮಿತ್ರ ಆ್ಯಪ್ ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ ಇಂಗ್ಲಿಷ್ ಕಲಿಯಿರಿ: https://play.google.com/store/apps/details?id=com.anglamitra.app',
    );

    if (platform == 'WhatsApp') {
      url = 'https://wa.me/?text=$shareText';
    } else if (platform == 'Facebook') {
      url = 'https://www.facebook.com/sharer/sharer.php?u=https://play.google.com/store/apps/details?id=com.anglamitra.app';
    } else if (platform == 'Instagram') {
      url = 'https://www.instagram.com/';
    }

    if (url.isNotEmpty) {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$platform ತೆರೆಯಲು ಸಾಧ್ಯವಾಗಿಲ್ಲ')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: AppData.currentLanguage,
      builder: (context, lang, child) {
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFBAE6FD), Color(0xFFE0E7FF), Color(0xFFFCE7F3)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 50, color: Colors.indigo),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.userName,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${AppData.get('level')}: ${widget.userLevel}',
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                        ),
                        onPressed: () => _shareApp('WhatsApp'),
                        icon: const Icon(
                          Icons.share,
                          size: 16,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'WhatsApp',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                        ),
                        onPressed: () => _shareApp('Instagram'),
                        icon: const Icon(
                          Icons.camera_alt,
                          size: 16,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Instagram',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[800],
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                        ),
                        onPressed: () => _shareApp('Facebook'),
                        icon: const Icon(
                          Icons.facebook,
                          size: 16,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Facebook',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.indigo.withOpacity(0.1),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppData.get('first_lang_title'),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFF1E1B4B),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          AppData.get('lang_desc'),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        const Divider(),
                        Column(
                          children: languages
                              .map(
                                (l) => RadioListTile<String>(
                                  title: Text(l),
                                  value: l,
                                  groupValue: lang,
                                  onChanged: (val) {
                                    if (val != null) {
                                      AppData.currentLanguage.value = val;
                                    }
                                  },
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class CommunityScreen extends StatefulWidget {
  final String currentUserName;
  const CommunityScreen({Key? key, required this.currentUserName})
    : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  final TextEditingController _postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String activeUser = widget.currentUserName.isEmpty
        ? 'ಬಳಕೆದಾರ'
        : widget.currentUserName;

    return ValueListenableBuilder<String>(
      valueListenable: AppData.currentLanguage,
      builder: (context, lang, child) {
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFEF3C7), Color(0xFFFDE68A), Color(0xFFFBCFE8)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  color: Colors.white.withOpacity(0.85),
                  child: Center(
                    child: Text(
                      AppData.get('banner'),
                      style: const TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _postController,
                          decoration: InputDecoration(
                            hintText: AppData.get('community_hint'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            isDense: true,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                        ),
                        onPressed: () {
                          if (_postController.text.isNotEmpty) {
                            setState(() {
                              GlobalCommunityData.posts.insert(
                                0,
                                PostModel(
                                  username: activeUser,
                                  content: _postController.text,
                                  likes: 0,
                                  isLiked: false,
                                  replies: [],
                                ),
                              );
                              _postController.clear();
                            });
                          }
                        },
                        child: Text(
                          AppData.get('post'),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),
                Expanded(
                  child: ListView.builder(
                    itemCount: GlobalCommunityData.posts.length,
                    itemBuilder: (context, index) {
                      final post = GlobalCommunityData.posts[index];
                      return PostCard(
                        post: post,
                        currentUserName: activeUser,
                        onLikeToggle: () {
                          setState(() {
                            post.isLiked = !post.isLiked;
                            post.likes += post.isLiked ? 1 : -1;
                          });
                        },
                        onAddReply: (replyText) {
                          setState(() {
                            post.replies.add(
                              ReplyModel(
                                username: activeUser,
                                content: replyText,
                                likes: 0,
                                isLiked: false,
                              ),
                            );
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PostModel {
  String username;
  String content;
  int likes;
  bool isLiked;
  List<ReplyModel> replies;

  PostModel({
    required this.username,
    required this.content,
    required this.likes,
    required this.isLiked,
    required this.replies,
  });
}

class ReplyModel {
  String username;
  String content;
  int likes;
  bool isLiked;

  ReplyModel({
    required this.username,
    required this.content,
    this.likes = 0,
    this.isLiked = false,
  });
}

class PostCard extends StatefulWidget {
  final PostModel post;
  final String currentUserName;
  final VoidCallback onLikeToggle;
  final Function(String) onAddReply;

  const PostCard({
    Key? key,
    required this.post,
    required this.currentUserName,
    required this.onLikeToggle,
    required this.onAddReply,
  }) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool _isReplying = false;
  final TextEditingController _replyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 16,
                backgroundColor: Colors.indigo,
                child: Icon(Icons.person, size: 18, color: Colors.white),
              ),
              const SizedBox(width: 8),
              Text(
                widget.post.username,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(widget.post.content, style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 8),
          Row(
            children: [
              InkWell(
                onTap: widget.onLikeToggle,
                child: Row(
                  children: [
                    Icon(
                      widget.post.isLiked
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: widget.post.isLiked ? Colors.red : Colors.grey,
                      size: 20,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${widget.post.likes}',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              InkWell(
                onTap: () {
                  setState(() {
                    _isReplying = !_isReplying;
                  });
                },
                child: Row(
                  children: [
                    const Icon(Icons.reply, color: Colors.grey, size: 20),
                    const SizedBox(width: 4),
                    Text(
                      AppData.get('reply'),
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (widget.post.replies.isNotEmpty) ...[
            const Divider(),
            ...widget.post.replies.map(
              (reply) => Padding(
                padding: const EdgeInsets.only(left: 20, top: 6, bottom: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.subdirectory_arrow_right,
                          size: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '${reply.username}: ',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          reply.content,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          reply.isLiked = !reply.isLiked;
                          reply.likes += reply.isLiked ? 1 : -1;
                        });
                      },
                      child: Row(
                        children: [
                          Icon(
                            reply.isLiked
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: reply.isLiked ? Colors.red : Colors.grey,
                            size: 14,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            '${reply.likes}',
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          if (_isReplying) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _replyController,
                    decoration: InputDecoration(
                      hintText: AppData.get('community_hint'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      isDense: true,
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                  onPressed: () {
                    if (_replyController.text.isNotEmpty) {
                      widget.onAddReply(_replyController.text);
                      _replyController.clear();
                      setState(() {
                        _isReplying = false;
                      });
                    }
                  },
                  child: Text(
                    AppData.get('send'),
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
