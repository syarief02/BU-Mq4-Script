//+------------------------------------------------------------------+
//|                                                   findsymbol.mq4 |
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
//+------------------------------------------------------------------+
//|                                      Detect EURUSD Automatically |
//|                                       Copyright 2023, MetaQuotes |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
void OnStart() {
   int totalSymbols = SymbolsTotal(false);
   string eurusdVariation = "";
   // Loop through all symbols in the market watch
   for (int i = 0; i < totalSymbols; i++) {
      string symbolName = SymbolName(i, false);
      if (StringFind(symbolName, "EURUSD") != -1) {
         eurusdVariation = symbolName;
         Print("Detected EURUSD variation: ", eurusdVariation);
         break;
      }
   }
   if (eurusdVariation == "") {
      Print("No available EURUSD variation found.");
      return;
   }
   double eurusdPrice = SymbolInfoDouble(eurusdVariation, SYMBOL_BID);
   if (eurusdPrice == 0) {
      Print("Unable to retrieve price for detected EURUSD variation: ", eurusdVariation);
      return;
   }
   // Now you have the EURUSD price, perform your TP calculation
   double takeProfit = eurusdPrice + 0.001; // Modify this according to your calculation
   Print("Calculated Take Profit for XAUUSD: ", takeProfit);
}
//+------------------------------------------------------------------+
