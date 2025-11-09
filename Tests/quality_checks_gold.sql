/*
===============================================================================
Contrôles de Qualité
===============================================================================
Objectif du script :
    Ce script effectue des contrôles de qualité afin de vérifier
    l’intégrité, la cohérence et l’exactitude de la couche Gold. 
    Ces contrôles permettent de s’assurer :
    - de l’unicité des clés substitutives dans les tables de dimensions ;
    - du respect de l’intégrité référentielle entre la table de faits et les dimensions ;
    - de la validité des relations du modèle de données pour les besoins analytiques.

Notes d’utilisation :
    - Analyser et corriger toute anomalie détectée lors de ces contrôles.
===============================================================================
*/

-- ====================================================================
-- Vérification : 'gold.dim_customers'
-- ====================================================================

-- Vérification de l’unicité de la clé client dans gold.dim_customers
-- Résultat attendu : Aucun résultat
SELECT 
    customer_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;

-- ====================================================================
--                 Vérification : 'gold.dim_products'
-- ====================================================================

-- Vérification de l’unicité de la clé produit dans gold.dim_products
-- Résultat attendu : Aucun résultat
SELECT 
    product_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;

-- ====================================================================
-- Vérification : 'gold.fact_sales'
-- ====================================================================

-- Vérification de la connectivité du modèle entre la table de faits et les dimensions
SELECT * 
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
LEFT JOIN gold.dim_products p
    ON p.product_key = f.product_key
WHERE p.product_key IS NULL 
   OR c.customer_key IS NULL;
