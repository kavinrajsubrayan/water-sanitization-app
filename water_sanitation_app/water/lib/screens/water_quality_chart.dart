// water_quality_chart.dart
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';

class WaterQualityChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners for the card
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Padding inside the card
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title of the chart
            Text(
              'Real-Time Water Quality',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16), // Space between title and chart
            SizedBox(
              height: 150, // Height of the chart
              child: BarChart(
                BarChartData(
                  maxY: 100, // Maximum Y value for the chart
                  barGroups: [
                    // Generate bar data with random values for demonstration
                    _buildBarData(0, Random().nextInt(100).toDouble()),
                    _buildBarData(1, Random().nextInt(100).toDouble()),
                    _buildBarData(2, Random().nextInt(100).toDouble()),
                    _buildBarData(3, Random().nextInt(100).toDouble()),
                  ],
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true, // Show left titles
                        reservedSize: 32,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toInt().toString(), // Display Y-axis values
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.center,
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true, // Show bottom titles
                        getTitlesWidget: (double value, TitleMeta meta) {
                          final style = TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          );
                          // Define labels for each bar on the X-axis
                          switch (value.toInt()) {
                            case 0:
                              return Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text('pH', style: style),
                              );
                            case 1:
                              return Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text('Turbidity', style: style),
                              );
                            case 2:
                              return Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text('O2', style: style),
                              );
                            case 3:
                              return Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text('Cond.', style: style),
                              );
                            default:
                              return Text(''); // Empty for other cases
                          }
                        },
                        reservedSize: 28,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false), // Hide the border
                  gridData: FlGridData(show: true), // Show grid lines
                  barTouchData: BarTouchData(
                      enabled: false), // Disable touch interactions
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to create bar data for water quality indicators
  BarChartGroupData _buildBarData(int x, double yValue) {
    return BarChartGroupData(
      x: x, // X-axis index
      barRods: [
        BarChartRodData(
          toY: yValue, // Height of the bar
          color: Colors.blueAccent, // Color of the bar
          width: 16, // Width of the bar
          borderRadius: BorderRadius.circular(6), // Rounded edges of the bar
        ),
      ],
    );
  }
}
