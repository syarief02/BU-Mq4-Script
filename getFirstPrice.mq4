//+------------------------------------------------------------------+
//|                                                getFirstPrice.mq4 |
//|                        Copyright 2023, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---
// Call the FindFirstOpenPositionEntryPrice function to update first entry prices
   FindFirstOpenPositionEntryPrice();
// Now you can access the first entry prices for buy and sell
//if(firstBuyEntryPrice != 0.0)
//  {
//   // First buy entry price for the current symbol
//  }
//if(firstSellEntryPrice != 0.0)
//  {
//   // First sell entry price for the current symbol
//  }
// Use these prices for setting SL for subsequent positions or any other logic.
   Print("firstBuyPrice : " + DoubleToString(firstBuyEntryPrice) + " | ###################  ",
         "\nfirstSellPrice : " + DoubleToString(firstSellEntryPrice) + " | ###################  ");
// Use these prices for setting SL for subsequent positions or any other logic.
  }
//+------------------------------------------------------------------+
// Define global variables to store the first buy and sell entry prices
double firstBuyEntryPrice = 0.0;
double firstSellEntryPrice = 0.0;

// Function to find the first open position entry price for the current symbol
void FindFirstOpenPositionEntryPrice()
  {
   for(int i = 0; i < OrdersTotal(); i++)
     {
      if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
        {
         if(OrderSymbol() == Symbol())
           {
            if(OrderType() == OP_BUY)
              {
               firstBuyEntryPrice = OrderOpenPrice();
               break;  // Exit the loop after finding the first buy entry price
              }
            else
               if(OrderType() == OP_SELL)
                 {
                  firstSellEntryPrice = OrderOpenPrice();
                  break;  // Exit the loop after finding the first sell entry price
                 }
           }
        }
     }
  }

//+------------------------------------------------------------------+
