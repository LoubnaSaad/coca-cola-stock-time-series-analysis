# Coca-Cola Stock Time Series Analysis

## Overview
Analyzed monthly Coca-Cola stock prices (1970-2009) for patterns and forecasting. Confirmed non-seasonality (KW test, p>0.05), achieved stationarity via 1st differencing, fitted ARIMA(0,1,1), and generated 20-step ahead forecasts.

## Skills Demonstrated
- EDA: TS plotting, ACF/PACF for stationarity assessment.
- Modeling: ARIMA via ML estimation; diagnostics (coeftest for coeffs, Ljung-Box/Box-Pierce for residuals randomness).
- Evaluation: Accuracy (MAE/RMSE/MAPE), invertibility checks.
- Forecasting: 20-period horizon with forecast package.

## Key Findings
- Data non-stationary originally (ACF decays slowly); 1st diff stationary (ACF cuts off at lag 1).
- ARIMA(0,1,1): MA(1) coeff significant (p<0.05); residuals white noise (Ljung-Box p is insignificant).

## Files
- `coca_cola_arima_analysis.R`: Full script (load, tests, model, forecast).

## Report
- [Full PDF] https://drive.google.com/file/d/1MqXPTwHAkDY6be5vWQx14mR1qB2J9GlM/view?usp=drive_link.
