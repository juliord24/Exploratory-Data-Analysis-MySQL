-- Empresas que han despedido a toda su plantilla
SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1;

-- Empresas que mayor número de trabajadores han despedido
SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

-- Rango de fechas con el que estamos trabajando
SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging2;

-- Total de trabajadores despedidos por industria
SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;

-- Total de trabajadores despedidos por país
SELECT country, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;

-- Trabajadores despedidos cada año
SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY 1 DESC;

-- Rolling total por mes y año que muestra una progresión de cuanta gente ha sido despedida mes tras mes
WITH rolling_total AS
(
SELECT SUBSTRING(`date`, 1, 7) AS `month`, SUM(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
GROUP BY `month`
ORDER BY 1
)

SELECT `month`, total_off, SUM(total_off) OVER(ORDER BY `month`) AS rolling_total
FROM rolling_total;

-- Ranking de las 5 empresas con más despidos de mayor a menor cada año separado por año
WITH company_year (company, years, total_laid_off) AS
(
SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
ORDER BY company
), company_year_rank AS
(
SELECT *, DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) AS `rank`
FROM company_year
WHERE years IS NOT NULL
)

SELECT *
FROM company_year_rank
WHERE `rank` <= 5;
