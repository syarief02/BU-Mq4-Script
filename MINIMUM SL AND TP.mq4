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
void OnStart() {
//---
   double minSLTP = MarketInfo(Symbol(), MODE_STOPLEVEL);
   Print(Symbol() + ": " + minSLTP);
}
//+------------------------------------------------------------------+
