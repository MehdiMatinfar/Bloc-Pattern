import 'package:flutter/material.dart';
import '../../../../core/utils/date_convertor.dart';
import '../../../../core/widgets/weather_image.dart';
import '/features/weather/data/model/forecast_7days_model.dart';
class ItemForecast7Days extends StatefulWidget {
  Daily daily;
  ItemForecast7Days({Key? key, required this.daily}) : super(key: key);

  @override
  State<ItemForecast7Days> createState() => _DaysWeatherViewState();
}

class _DaysWeatherViewState extends State<ItemForecast7Days> with SingleTickerProviderStateMixin{

  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation = Tween(
      begin: -1.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: animationController, curve: Interval(0.5, 1,curve: Curves.decelerate)));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
      animation: animationController,
      builder: (context,child){
        return Transform(
          transform: Matrix4.translationValues(animation.value * width, 0.0, 0.0),
          child: Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Card(
              color: Colors.transparent,
              elevation: 0,
              child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Column(
                    children: [
                      Text(DateConverter.changeDtToDateTime(widget.daily.dt).toString(),
                          style: const TextStyle(fontSize: 12, color: Colors.grey)),
                      Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: WeatherImages.setIconForMain(widget.daily.weather![0].description!)),
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                                "${widget.daily.temp!.day!.round()}\u00B0",
                                style: const TextStyle(fontSize: 15, color: Colors.white)),
                          )),
                    ],
                  )),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    // _fwBloc.dispose();
    // _cwBloc.dispose();
    super.dispose();
  }
}