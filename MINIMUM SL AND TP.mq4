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
   double minSLTP;
   double ticksize = MarketInfo(Symbol(), MODE_TICKSIZE);
   if(ticksize == 0.00001 || ticksize == 0.001)
     {
      minSLTP = (MarketInfo(Symbol(), MODE_STOPLEVEL)) / 10;
     }
   else
     {
      minSLTP = MarketInfo(Symbol(), MODE_STOPLEVEL);
     }
   Print(Symbol() + ": " + DoubleToString(minSLTP) + " PIPS");
//Print(Symbol() + ": " + DoubleToString(ticksize) + " ticksize");
//Print(Symbol() + ": " + DoubleToString(pips) + " pips");
  }
//+------------------------------------------------------------------+
