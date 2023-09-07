//+------------------------------------------------------------------+
//|                                                      minsltp.mq4 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---
   double Spread;
   double minSLTP;
   double ticksize = MarketInfo(Symbol(), MODE_TICKSIZE);
   if(ticksize == 0.00001 || ticksize == 0.001)
     {
      minSLTP = (MarketInfo(Symbol(), MODE_STOPLEVEL)) / 10;
      Spread = MarketInfo(Symbol(), MODE_SPREAD) / 10;
     }
   else
     {
      minSLTP = MarketInfo(Symbol(), MODE_STOPLEVEL);
      Spread = MarketInfo(Symbol(), MODE_SPREAD);
     }
   Print(Symbol() + " MINIMUM TP: " + DoubleToString(NormalizeDouble(minSLTP)) + " PIPS");
   Print(Symbol() + " MINIMUM SL: " + DoubleToString(minSLTP + Spread) + " PIPS");
   Print(Symbol() + " SPREAD: " + DoubleToString(Spread) + " PIPS");
//Print(Symbol() + ": " + DoubleToString(ticksize) + " ticksize");
//Print(Symbol() + ": " + DoubleToString(pips) + " pips");
  }
//+------------------------------------------------------------------+
