/*
 * AD770X Library
 * sample code (AD7706)
 * Kerry D. Wong
 * http://www.kerrywong.com
 * 3/2011
 */

#include <AD770X.h>
#include <SPI.h>

//AD770X ad7706(vref, CSpin);
AD770X ad7706(2.5, 10);
double v;

void setup()
{
  Serial.begin(9600);
  Serial.println("AD7705 readings:");
  SPI.begin();

  ad7706.reset();
  // Initialization for this module:
  // https://www.sunrom.com/p/adc-board-dual-16-bit-spi-ad7705tm7705
  // Mind the 2 x 10k divider at input - need to set gain at 2x
  // ad7706.init(byte channel, byte clkDivider, byte polarity, byte gain, byte updRate));
}

void loop()
{
  ad7706.init(AD770X::CHN_AIN1,AD770X::CLK_DIV_1,AD770X::BIPOLAR,AD770X::GAIN_2,AD770X::UPDATE_RATE_25); 
  v = ad7706.readADResult(AD770X::CHN_AIN1);
  Serial.print(v);

  ad7706.init(AD770X::CHN_AIN2,AD770X::CLK_DIV_1,AD770X::BIPOLAR,AD770X::GAIN_2,AD770X::UPDATE_RATE_25);
  v = ad7706.readADResult(AD770X::CHN_AIN2);
  Serial.print(" : ");
  Serial.println(v);
  delay(100);
}
