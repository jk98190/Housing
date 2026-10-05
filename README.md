# Real Estate Price Analysis: Melbourne & Northern Territory

A simple Python script that explores two Australian property datasets and predicts sale/asking prices with XGBoost.

## What it does

For each dataset the script:

1. Loads the CSV and prints summary statistics (**mean, median, mode**)
2. Saves plots (price distribution, price by property type, price vs distance)
3. Calculates **correlations** with price and saves a heatmap
4. Trains an **XGBoost** regression model, prints R² and MAE, and saves a feature-importance chart

## Files

| File | Description |
|---|---|
| `real_estate_simple.py` | The analysis script (no functions, runs top to bottom) |
| `melb_data_clean.csv` | Melbourne house sales: 13,579 rows, 21 columns |
| `RealEstateAU_NT_clean.csv` | Northern Territory listings: 999 rows, 24 columns |

## Requirements

- Python 3.9+
- Libraries: `pandas`, `numpy`, `seaborn`, `matplotlib`, `xgboost`, `scikit-learn`

```bash
pip install pandas numpy seaborn matplotlib xgboost scikit-learn
```

## How to run

1. Put the two CSV files and the script in one folder.
2. Open the script and change the two paths near the top of each section, for example:
   ```python
   pd.read_csv("melb_data_clean.csv", parse_dates=["Date"])
   pd.read_csv("RealEstateAU_NT_clean.csv")
   ```
3. Run:
   ```bash
   python real_estate_simple.py
   ```

Statistics, correlations, R² and MAE print to the console. Charts are saved as PNG files in the folder you run the script from.

## Output charts (9 files)

| Melbourne | Northern Territory |
|---|---|
| `melb_price_hist.png` | `nt_price_hist.png` |
| `melb_price_by_type.png` | `nt_price_by_type.png` |
| `melb_price_vs_distance.png` | `nt_correlation.png` |
| `melb_correlation.png` | `nt_importance.png` |
| `melb_importance.png` | |

## Key findings

**Melbourne (13,579 sales)**
- Mean price about $1.08M vs median $903K, so a few expensive sales pull the average up.
- Strongest correlations with price: building area (+0.55), rooms (+0.50), bathrooms (+0.47). Distance from the CBD is negative (-0.16).
- XGBoost R² is about 0.84 and MAE about $157K (exact numbers vary slightly by run).
- Top drivers: distance from CBD, region, rooms, landsize and property type.

**Northern Territory (999 listings, 777 with a price)**
- Mean price about $527K, median $489K.
- Strongest correlations with price: bedrooms (+0.54), bathrooms (+0.52), parking (+0.38).
- The model is weak (R² roughly 0.2 to 0.5 depending on the split) because the sample is small and a few listings above $1M skew the results. Treat it as indicative only.

## Data notes

- **Missing values:** `BuildingArea` (48%) and `YearBuilt` (40%) in Melbourne, and `building_size_m2` (72%) in NT have many gaps. XGBoost handles missing values natively, so none are filled.
- **Outliers:** Melbourne landsize reaches 76,000 m², which is why landsize shows almost no linear correlation with price.
- **Leakage avoided:** in the NT data, `price_min` and `price_max` duplicate the target (`price_num`), so they are left out of the model.
- **Categoricals:** `Type`, `Regionname` and `property_type` are one-hot encoded with `pd.get_dummies`.

## Possible improvements

- Predict `log(price)` to reduce the effect of expensive outliers.
- Add suburb as a feature (grouping rare suburbs into "Other").
- Use cross-validation and hyperparameter tuning (e.g. `GridSearchCV`).
- Collect more NT data to get a more stable model.
