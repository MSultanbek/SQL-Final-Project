| Column                    | Problem               | Fix                    |
| ------------------------- | --------------------- | ---------------------- |
| `children`                | float64, 4 nulls      | fillna(0), cast to int |
| `country`                 | 488 nulls             | fillna('Unknown')      |
| `arrival_date_month`      | string ("July")       | map to number (7)      |
| `reservation_status_date` | string, not date      | convert to datetime    |
| `agent`                   | float64, 16340 nulls  | fillna(0), cast to int |
| `company`                 | float64, 112593 nulls | fillna(0), cast to int |


| Column                                             | Concern                                                    |
| -------------------------------------------------- | ---------------------------------------------------------- |
| `adr`                                              | float — check for negative values (impossible price)       |
| `adults`                                           | check for 0 adults with no children/babies (ghost booking) |
| `stays_in_weekend_nights` + `stays_in_week_nights` | check if both are 0 (zero-night stay makes no sense)       |
