import 'package:flutter/material.dart';


class YouTubeShortsSearch extends StatefulWidget {
  @override
  _YouTubeShortsSearchState createState() => _YouTubeShortsSearchState();
}

class _YouTubeShortsSearchState extends State<YouTubeShortsSearch> {
  final List<ShortVideo> shorts = [
    ShortVideo(
      title: "Spicy Miso Ramen Hack",
      views: "1.2M views",
      imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuCMLQ2jDMuDpI6-9y19VWJktQlbWLPUv_6pSSrKOB9tYC3PwCKTBLsmH0U8plPLkPRLMKQ7Dydb7NN3fYpfvYujLFKImwYInRdi1WKgiLZrM6vl9oZ_w3Di2GHqygOVDGON29m9XTr_jddYlXxpR7XQwlmCjicqIhw97Ws5M3SjfITcn9BxWq6YNt2sSArYH8pAy2SNUXHJQ3Dvfp6JLDGHvYJ9OPV6gl0XRPVGGmq0S6u84FDu8gOcKpHWrR8y5gL7SdnwMRK1fIuw",
    ),
    ShortVideo(
      title: "The Easiest Tonkotsu Ramen",
      views: "890K views",
      imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuC9fY737k7yXwlCgZsZhcgaaTkw47eDOMS4WowTk_dY9qArTB9GkcD9hC7aXBQGo6AOnONB9tGXf7-UbWqNeXau1lzShAcHNZeTzEmvPFFp0LKkxukKpyIBUMxU9Ir-YfsSM69Ipk7kphYaN8MWnsuhZqmg0qjy2UpX0s1IFKYvuxsLIxXM2nxtGdVp1sWLCepWSw4VYCzcL25Kwco4rdW_VCRwR-1vYgMJo9c_BzsGBj-IWoj3_DL4_AUPKismH8x_jMjXwACqo0WF",
    ),
    ShortVideo(
      title: "10-Minute Instant Noodle Upgrade",
      views: "2.5M views",
      imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuBEtZD5fbpkZ5c3i3U-uITdEWMVOE_UNlAW6UVIFQ47wIyRjAxxdbWZ7YBT5zMd8KQdiiLs6NRAFeFi-KuKfyJkwJBzj7f94Yo1OOdZiHBTE5bzfdNHWYmNNfslswKDyNfoYts-aIznlITTVjO7B3ukugmGdRi_gVH6Y6ebokZMFDwsUYHNgpx6bORotxPYP3IcR-0ETifqbUAp48xANnYQLQUBRQXkilbLufeWKthBA-Sph_OL9lb1izqDMFkcp5FvNMGS3Me0coHw",
    ),
    ShortVideo(
      title: "Making Perfect Ramen Eggs at Home",
      views: "1.8M views",
      imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuBTtSl1Oe7shyERrp6pLUqNipkCjQzTSAIKuL_Xk-vURKjh6OWQrXzq5QU_8Dkxf60wqEFFvAbyp0oldHrWu3CXUjWy2U4eeq37iRZHCH4RI5V0NIMsEjI2UeIPG9Gt73FvLKBbMKTzMkhQomWvpsrGDm5S0Btv0VGmct7SIY8lhaOQSfRZLv9QJuKCIrmoC_fkXHhttxKggHx791dhNQvp2PuUgABjhLD-AEqZARwkrYeLIx7fEW1BhWdynOrmHGoIPFGMkAvQ9Ujf",
    ),
    ShortVideo(
      title: "How to Slurp Noodles Like a Pro",
      views: "500K views",
      imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuCsxHj7awn1K39lbfJ3KnhxqxHnoOxslz0HXVy2giXjS5RV5XySKGDuyhtxX2ohET3oc8S86tav_QF7wL8ECQQZmD0yBxANmdU2byQZQ9EYy0wnokXbu_m2H6s4iXX0aJHonElhceRTHfXWYgebUOS6P93KqB-pkgCa5LDgvG1fF44J31AHHNxa2rObCng-wuFvVi3badUr7_XxXdg7WPH3kVCpOphUQvddC4lJrXx6BHeK2A127H6HChj7cauExQPLOCleLV0EzsAf",
    ),
    ShortVideo(
      title: "Ultimate Comfort: Chicken Ramen",
      views: "950K views",
      imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuDYHr_uEliI8_UWJKNNtr4R5nAz2CIYPHDh5-M_qM14wreUb8WMIXYJZJiLR55KJOMHaCFNEec-c2bWNbL8hmkdwyyGrWTeNoA-Pp-bHKPicDahB_GVSREX_QXLkkGv3mRvXEP_lX3CZcQBzTLeiKVgzW8Y3JkBmo3ug3tL1m4Iq-7V_QAsyBKulDVLl8oIFf8dPFQQV9687cLddpWH4gVl0RuRVK7iqEG9_dg-9GddwxTydiYanTClL2TjWNP2YieRIkL9R3fz8Cum",
    ),
    ShortVideo(
      title: "Quick Vegan Ramen for Busy Nights",
      views: "640K views",
      imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuCG2EABeuVdTEL5tlkSLl8bb2Vy0RKFN-8eUQSZH3rqZKd-gApQ8FSYXUC43xmKK7w_WVtNWLfad7jQjt7l_o5ZKUmjZIn6IudRfmb8ATO8Fx67jKZcgToz6FqPuurR1MkCDbqzKbqiW-VqmHgjfDU2kbpDZ4viCVKAkjQMrtbsoWuyodIVE0qIC5GoGUoGXJkY_3N3IKgOklyIHCQWe59ljQz5g-vkvmJovTp24ZxEISg-Ets4Zac99Yw2-SAmhrb7Ckew0UrIp8F8",
    ),
    ShortVideo(
      title: "Building a Flavorful Ramen Broth",
      views: "1.1M views",
      imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuDKIcchsEU80nXM349_Of4UREr1MqviOy5cQraAS4LmTYxsv8yj00OZnjN0FRA_xdBNaLAioL1k4aKjdYOiCEUoxOrkCKyDxxd1imfTACZE9edN95ceZ_r3VXt6ahjLrloXtV3oYoRH6sdMpMDYw2g_KwHVI2TkGZ4jNaF5gGG9JGaeluQCMEp_H1zEpaVNakZzCKs0pk9yG2-o13EaWaOxo2iAPQG8uj_gv7GdxGewXfHc2TaNAiLWZELyY-4ljIe0OLsC5Jjb9onk",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        // Shorts Grid
        Expanded(
          child: _buildShortsGrid(),
        ),
      ],
    );
  }

  Widget _buildShortsGrid() {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 9 / 16,
      ),
      itemCount: shorts.length,
      itemBuilder: (context, index) {
        return _buildShortItem(shorts[index]);
      },
    );
  }

  Widget _buildShortItem(ShortVideo short) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(short.imageUrl),
                    fit: BoxFit.cover,
                  ),
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Color(0xFF212121)
                      : Colors.grey[300],
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Icon(
                  Icons.play_circle_outline,
                  color: Colors.white.withOpacity(0.8),
                  size: 24,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      short.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Text(
                      short.views,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.grey[400]
                            : Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {},
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                iconSize: 20,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              ),
            ],
          ),
        ),
      ],
    );
  }

}

class ShortVideo {
  final String title;
  final String views;
  final String imageUrl;

  ShortVideo({
    required this.title,
    required this.views,
    required this.imageUrl,
  });
}