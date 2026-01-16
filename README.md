# Exploratory Data Analysis en MySQL 📊

Proyecto de análisis exploratorio de datos sobre despidos masivos a nivel global utilizando MySQL. El proyecto demuestra técnicas avanzadas de SQL para análisis de datos, incluyendo CTEs, funciones de ventana y agregaciones complejas.

## 📋 Descripción

Este proyecto es un análisis de datos sobre despidos laborales (layoffs) de empresas tecnológicas y de otros sectores. A través de consultas SQL optimizadas, se extraen insights clave sobre las tendencias de despidos, las empresas más afectadas y la evolución temporal de estos eventos.

## 🎯 Objetivos del Análisis

- Identificar empresas que han despedido al 100% de su plantilla
- Analizar las empresas con mayor número de trabajadores despedidos
- Estudiar la distribución de despidos por industria y país
- Visualizar la evolución temporal de los despidos (rolling totals)
- Crear rankings de empresas más afectadas por año

## 🛠️ Tecnologías Utilizadas

- **MySQL** - Sistema de gestión de bases de datos
- **SQL Avanzado** - CTEs (Common Table Expressions), Window Functions, Agregaciones

## 📂 Estructura del Proyecto

```
Exploratory-Data-Analysis-MySQL/
│
├── Exploratory-Data-Analysis-en-MySQL.sql    # Script principal con todas las consultas
└── README.md                                  # Documentación del proyecto
```

## 🔍 Consultas Principales

### 1. Empresas con Despidos Totales
Identificación de empresas que han despedido a toda su plantilla (100% de layoffs).

### 2. Top Empresas por Despidos
Ranking de empresas con mayor número de trabajadores despedidos de forma total.

### 3. Análisis Temporal
- Rango de fechas del dataset
- Despidos agregados por año
- Rolling totals mes a mes para visualizar tendencias

### 4. Análisis por Segmento
- Despidos totales por industria
- Despidos totales por país

### 5. Ranking Anual
Top 5 empresas con más despidos cada año, utilizando funciones de ventana (DENSE_RANK).

## 💡 Técnicas SQL Destacadas

- **CTEs (Common Table Expressions)**: Para crear subconsultas reutilizables y mejorar la legibilidad
- **Window Functions**: `SUM() OVER()` para rolling totals, `DENSE_RANK()` para rankings
- **Funciones de Fecha**: `YEAR()`, `SUBSTRING()` para manipulación temporal
- **Agregaciones**: `SUM()`, `COUNT()`, `GROUP BY` para análisis agregados
- **Filtrado Avanzado**: Condiciones complejas con `WHERE` y manejo de valores `NULL`

## 📊 Dataset

El proyecto utiliza la tabla `layoffs_staging2` con los siguientes campos principales:
- `company`: Nombre de la empresa
- `total_laid_off`: Total de empleados despedidos
- `percentage_laid_off`: Porcentaje de la plantilla despedida
- `date`: Fecha del despido
- `industry`: Industria/sector de la empresa
- `country`: País de la empresa

## 📈 Resultados Esperados

El análisis proporciona insights valiosos como:
- Identificación de sectores más vulnerables a despidos masivos
- Tendencias temporales en la tasa de despidos
- Países con mayor impacto laboral
- Patrones de despidos corporativos a lo largo del tiempo

## 📝 Licencia

Este proyecto está disponible como código abierto para fines educativos.

## ✨ Autor

**Julio Rodríguez** - [juliord24](https://github.com/juliord24)

---

⭐ Si este proyecto te ha sido útil, considera darle una estrella en GitHub
