// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_club_card.dart';

/// Constants
final TextStyle kLoyaltyHeadlineStyle = AppTextStyle.text()
    .sm()
    .extrabold()
    .withColor(Colors.white);
final TextStyle kLoyaltyDescStyle = AppTextStyle.text()
    .xs()
    .semiBold()
    .withColor(Colors.white);

class AppClubLoyaltyCard extends StatelessWidget {
  const AppClubLoyaltyCard({
    super.key,
    this.qrCodeUrl = '',
    this.headline = 'Друг',
    this.subHeadline = '1.5% кешбэк',
    this.description = 'Ещё 4 дня покупок до 1% в следующем месяце',
  });
  final String qrCodeUrl;
  final String headline;
  final String subHeadline;
  final String description;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 8 / 5,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: kCircular10Border),
        color: AppColors.mainAccent,
        margin: EdgeInsets.only(right: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(headline, style: kLoyaltyHeadlineStyle),
                        Text(subHeadline, style: kLoyaltyHeadlineStyle),
                        Text(
                          'Ещё 4 дня покупок до 1% в следующем месяце',
                          softWrap: true,
                          style: kLoyaltyDescStyle,
                        ),
                      ],
                    ),
                  ),
                  SizedBox.square(
                    dimension: 60,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: kCircular10Border,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  maxRadius: 14,
                  child: Icon(Icons.apple, size: 28),
                ),
                Expanded(
                  // child: LinearProgressIndicator(),
                  child: Divider(
                    color: Colors.white.withValues(alpha: 0.4),
                    thickness: 4,
                  ),
                ),
                Icon(
                  Icons.lock_outline_rounded,
                  color: Colors.white.withValues(alpha: 0.8),
                  size: 18,
                ),
              ],
            ),
          ],
        ).paddingSymmetric(horizontal: 4, vertical: 2),
      ),
    );
  }
}
