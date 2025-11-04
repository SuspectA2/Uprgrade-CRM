import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(
              seedColor: Colors.blueAccent,
              brightness: Brightness.light,
            ).copyWith(
              primary: const Color(0xFFEFF0F1), // Ваш основной цвет
              secondary: const Color(0xFF0A0A2A),
            ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 700,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('assets/images/MainPic.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withAlpha(153), // 0.6 opacity
                BlendMode.darken,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(23.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.black.withAlpha(26),
                ),
                padding: const EdgeInsets.all(16),
                child: Text(
                  'UPgrade — новый уровень вашего опыта в недвижимости',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Умные решения для покупки, продажи и управления недвижимостью.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    child: const Row(
                      children: [
                        Text('О нас'),
                        SizedBox(width: 4),
                        Icon(Icons.arrow_forward, size: 16),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Colors.white),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    child: const Text('Get Started'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const WelcomeSection(),
            const WhySection(),
            const ButtonSection(),
          ],
        ),
      ),
    );
  }
}

class WhySection extends StatelessWidget {
  const WhySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white38,
      // Используем Padding для создания отступов вокруг всей секции
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 64.0, horizontal: 16.0),
        child: Column(
          children: [
            // Основной заголовок
            const Text(
              'Почему выбирают Upgrade?',
              style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Подзаголовок
            Text(
              'Ощути будущее недвижимости с нашим инновационным подходом',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 48),
            // Ряд с тремя нашими преимуществами
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              // Выравниваем по верху
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // Распределяем пространство
              children: [
                // Используем Expanded, чтобы каждый элемент занимал равную часть
                Expanded(
                  child: _FeatureItem(
                    icon: Icons.shield_outlined,
                    title: 'Прозрачность',
                    description:
                        'Полная видимость каждой сделки благодаря обновлениям в реальном времени и детальной отчётности. Никаких скрытых комиссий, никаких неожиданностей',
                  ),
                ),
                SizedBox(width: 24),
                Expanded(
                  child: _FeatureItem(
                    icon: Icons.memory, // Иконка для технологий
                    title: 'Технологии',
                    description:
                        'Современная CRM-платформа, упрощающая управление недвижимостью с помощью AI-аналитики и автоматизации.',
                  ),
                ),
                SizedBox(width: 24),
                Expanded(
                  child: _FeatureItem(
                    icon: Icons.favorite_outline, // Иконка для доверия
                    title: 'Доверие ',
                    description:
                        'Основано на многолетнем опыте и тысячах довольных клиентов. Ваш успех — наш главный приоритет.',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Приватный виджет для отображения одного элемента из секции "Почему мы".
/// Это помогает избежать повторения кода.
class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _FeatureItem({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // Все элементы в колонке центрируются по горизонтали
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Иконка в зеленом круге
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 48),
        ),
        const SizedBox(height: 16),
        // Заголовок элемента
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        // Описание элемента
        Text(
          description,
          textAlign: TextAlign.center, // Текст описания центрируется
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
            height: 1.5, // Межстрочный интервал для лучшей читаемости
          ),
        ),
      ],
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return SizedBox();
  }
}
