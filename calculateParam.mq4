//+------------------------------------------------------------------+
//|                                               calculateParam.mq4 |
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
   double a;
   double b;
   double c;
   double d;
   calcParam(a, b, c, d);
   Print("Param symbol ADR Data --------------------------------------------------------------");
   Print("####### Max Distance: ", d);
   Print("####### Distance Increment: ", c);
   Print("####### Min Distance: ", b);
   Print("####### TP: ", a);
}

//+------------------------------------------------------------------+
//|    AUTO CONFIG FUNCTION                                                              |
//+------------------------------------------------------------------+
void calcParam(double &TPCurr, double &minPipStepCurr, double &PipStepIncrCurr, double &maxPipStepCurr) {
//   Print("Eu symbol Data --------------------------------------------------------------");
   double pipsEu;
   double ticksizeEu = MarketInfo("EURUSD", MODE_TICKSIZE);
   if(ticksizeEu == 0.00001 || ticksizeEu == 0.001)
      pipsEu = ticksizeEu * 10;
   else
      pipsEu = ticksizeEu;
// initialize LotDigits
   double EUMAHI = iMA("EURUSD", PERIOD_D1, (365), 0, MODE_SMA, PRICE_HIGH, 0);
   double EUMALO = iMA("EURUSD", PERIOD_D1, (365), 0, MODE_SMA, PRICE_LOW, 0);
   Print(" EU MA Hi : ", EUMAHI);
   Print(" EU MA Lo : ", EUMALO);
   Print("Current Symbol : ", Symbol());
   Print("Pips EU: ", pipsEu);
   double ADREu = ((EUMAHI - EUMALO) / pipsEu);
   Print("ADR Pips EU : ", ADREu);
   double TPEuDiv = ADREu / 25;
   double minPipStepDiv = ADREu / 4;
   double PipStepIncrDiv = ADREu / 2;
   double maxPipStepDiv = ADREu / 100;
   /*  Print("TP Div : ", TPEuDiv);
     Print("minpipstep Div : ", minPipStepDiv);
     Print("pipstep incr Div : ", PipStepIncrDiv);
     Print("max pipstep Div : ", maxPipStepDiv);
     Print("current symbol stat --------------------------------------------------------------");
   */  //+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
   double pipsCurr;
   double ticksize = MarketInfo(Symbol(), MODE_TICKSIZE);
   if(ticksize == 0.00001 || ticksize == 0.001)
      pipsCurr = ticksize * 10;
   else
      pipsCurr = ticksize;
// initialize LotDigits
   double CurrMAHI = iMA(Symbol(), PERIOD_D1, 20, 0, MODE_SMA, PRICE_HIGH, 0);
   double CurrMALO = iMA(Symbol(), PERIOD_D1, 20, 0, MODE_SMA, PRICE_LOW, 0);
   Print(" EU MA Hi : ", CurrMAHI);
   Print(" EU MA Lo : ", CurrMALO);
   Print("Current Symbol : ", Symbol());
   Print("Pips Curr: ", pipsCurr);
   double ADRCurr = (CurrMAHI - CurrMALO) / pipsCurr;
   Print("ADR Pips Curr : ", ADRCurr);
   TPCurr = ADRCurr / TPEuDiv;
   minPipStepCurr = ADRCurr / minPipStepDiv;
   PipStepIncrCurr = ADRCurr / PipStepIncrDiv;
   maxPipStepCurr = ADRCurr / maxPipStepDiv;
   /*  Print("TP Curr : ", TPCurr);
     Print("minpipstep Curr : ", minPipStepCurr);
     Print("pipstep incr Curr : ", PipStepIncrCurr);
     Print("max pipstep Curr : ", maxPipStepCurr);
   */
}
//+------------------------------------------------------------------+
