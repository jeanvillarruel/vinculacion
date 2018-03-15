-- MySQL Script generated by MySQL Workbench
-- Wed Mar 14 22:44:38 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `TipoProducto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TipoProducto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Producto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `TipoProducto_id` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Producto_TipoProducto1`
    FOREIGN KEY (`TipoProducto_id`)
    REFERENCES `TipoProducto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `TipoAsociacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TipoAsociacion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Asociacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Asociacion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `personaEncargada` VARCHAR(200) NULL,
  `TipoAsociacion_id` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Asociacion_TipoAsociacion1`
    FOREIGN KEY (`TipoAsociacion_id`)
    REFERENCES `TipoAsociacion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UnidadProduccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UnidadProduccion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `lat` VARCHAR(50) NULL,
  `lng` VARCHAR(50) NULL,
  `observaciones` TEXT NULL,
  `Asociacion_id` INT NOT NULL,
  `Producto_id` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_UnidadProduccion_Asociacion1`
    FOREIGN KEY (`Asociacion_id`)
    REFERENCES `Asociacion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_UnidadProduccion_Producto1`
    FOREIGN KEY (`Producto_id`)
    REFERENCES `Producto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Genero` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Propietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Propietario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ci` INT NOT NULL,
  `nombre` VARCHAR(200) NULL,
  `Genero_id` INT NOT NULL,
  `correo` VARCHAR(200) NULL,
  `fechaNacimiento` DATE NULL,
  `telefono` VARCHAR(10) NULL,
  `observaciones` TEXT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  UNIQUE INDEX `ci_UNIQUE` (`ci` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Propietario_Genero1`
    FOREIGN KEY (`Genero_id`)
    REFERENCES `Genero` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TipoProyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TipoProyecto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = '			';


-- -----------------------------------------------------
-- Table `CategoriaProyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CategoriaProyecto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ManejoAmbiental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ManejoAmbiental` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `descripcion` TEXT NULL,
  `TipoProyecto_id` INT NOT NULL,
  `CategoriaProyecto_id` INT NOT NULL,
  `UnidadProduccion_id` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_ManejoAmbiental_TipoProyecto1`
    FOREIGN KEY (`TipoProyecto_id`)
    REFERENCES `TipoProyecto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ManejoAmbiental_CategoriaProyecto1`
    FOREIGN KEY (`CategoriaProyecto_id`)
    REFERENCES `CategoriaProyecto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ManejoAmbiental_UnidadProduccion1`
    FOREIGN KEY (`UnidadProduccion_id`)
    REFERENCES `UnidadProduccion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '									';


-- -----------------------------------------------------
-- Table `UsoSuelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UsoSuelo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TipoSuelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TipoSuelo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PermeabilidadSuelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PermeabilidadSuelo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `valor` DOUBLE NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clima`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clima` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `mnsm` VARCHAR(50) NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondicionesDrenaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CondicionesDrenaje` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `valor` DOUBLE NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecosistema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecosistema` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CaracteristicasEtnicas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CaracteristicasEtnicas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AreaInfluencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AreaInfluencia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `altitud` DOUBLE NULL,
  `tipoTerrenoDescripcion` TEXT NULL,
  `detalleCalidadAire` TEXT NULL,
  `detalleRuido` TEXT NULL,
  `observacionesEcosistema` TEXT NULL,
  `lat` VARCHAR(45) NULL,
  `long` VARCHAR(45) NULL,
  `ManejoAmbiental_id` INT NOT NULL,
  `UsoSuelo_id` INT NOT NULL,
  `TipoSuelo_id` INT NOT NULL,
  `PermeabilidadSuelo_id` INT NOT NULL,
  `Clima_id` INT NOT NULL,
  `CondicionesDrenaje_id` INT NOT NULL,
  `Ecosistema_id` INT NOT NULL,
  `CaracteristicasEtnicas_id` INT NOT NULL,
  `nivelTraficoDescripcion` TEXT NULL,
  `recirculacionAireDescripcion` TEXT NULL,
  `organizacionSocialDescripcion` TEXT NULL,
  `tendenciaTierraDescripcion` TEXT NULL,
  `abastecimientoAguaDescripcion` TEXT NULL,
  `evacuacionAguaLluviaDescripcion` TEXT NULL,
  `consolidacionAreasInfluenciaDescripcion` TEXT NULL,
  `evacuacionAguasServidasDescripcion` TEXT NULL,
  `usoVegetacionDescripcion` TEXT NULL,
  `tradicionesDescripcion` TEXT NULL,
  `tipoFuentesDescripcion` TEXT NULL,
  `ruido` DOUBLE NULL,
  `precipitaciones` DOUBLE NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_AreaInfluencia_ManejoAmbiental1`
    FOREIGN KEY (`ManejoAmbiental_id`)
    REFERENCES `ManejoAmbiental` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AreaInfluencia_TipoTerreno1`
    FOREIGN KEY (`UsoSuelo_id`)
    REFERENCES `UsoSuelo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AreaInfluencia_TipoSuelo1`
    FOREIGN KEY (`TipoSuelo_id`)
    REFERENCES `TipoSuelo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AreaInfluencia_PermeabilidadSuelo1`
    FOREIGN KEY (`PermeabilidadSuelo_id`)
    REFERENCES `PermeabilidadSuelo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AreaInfluencia_Clima1`
    FOREIGN KEY (`Clima_id`)
    REFERENCES `Clima` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AreaInfluencia_CondicionesDrenaje1`
    FOREIGN KEY (`CondicionesDrenaje_id`)
    REFERENCES `CondicionesDrenaje` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AreaInfluencia_Ecosistema1`
    FOREIGN KEY (`Ecosistema_id`)
    REFERENCES `Ecosistema` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AreaInfluencia_CaracteristicasEtnicas1`
    FOREIGN KEY (`CaracteristicasEtnicas_id`)
    REFERENCES `CaracteristicasEtnicas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TipoVegetal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TipoVegetal` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre_comun` VARCHAR(50) NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  `nombre_cientifico` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Lenguaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lenguaje` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Religion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Religion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Peligros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Peligros` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Paisaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Paisaje` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `descripcion` TEXT NULL,
  `AreaInfluencia_id` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Paisaje_AreaInfluencia1`
    FOREIGN KEY (`AreaInfluencia_id`)
    REFERENCES `AreaInfluencia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TipoCultivos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TipoCultivos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TipoProduccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TipoProduccion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TipoUnidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TipoUnidad` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Destino`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Destino` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Precuaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Precuaria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TipoAnimales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TipoAnimales` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `Precuaria_id` INT NOT NULL,
  `TipoUnidad_id` INT NOT NULL,
  `TipoProduccion_id` INT NOT NULL,
  `Destino_id` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_TipoAnimales_TipoProduccion1`
    FOREIGN KEY (`TipoProduccion_id`)
    REFERENCES `TipoProduccion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TipoAnimales_TipoUnidad1`
    FOREIGN KEY (`TipoUnidad_id`)
    REFERENCES `TipoUnidad` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TipoAnimales_Destino1`
    FOREIGN KEY (`Destino_id`)
    REFERENCES `Destino` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TipoAnimales_Precuaria1`
    FOREIGN KEY (`Precuaria_id`)
    REFERENCES `Precuaria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TipoAbono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TipoAbono` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TipoControlPlaga`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TipoControlPlaga` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OrigenIngresos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OrigenIngresos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  `UnidadProduccion_id` INT NOT NULL,
  `Propietario_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_OrigenIngresos_UnidadProduccion1`
    FOREIGN KEY (`UnidadProduccion_id`)
    REFERENCES `UnidadProduccion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrigenIngresos_Propietario1`
    FOREIGN KEY (`Propietario_id`)
    REFERENCES `Propietario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Agricultura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Agricultura` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `UnidadProduccion_id` INT NOT NULL,
  `UsoSuelo_id` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Agricultura_UnidadProduccion1`
    FOREIGN KEY (`UnidadProduccion_id`)
    REFERENCES `UnidadProduccion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Agricultura_UsoSuelo1`
    FOREIGN KEY (`UsoSuelo_id`)
    REFERENCES `UsoSuelo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PlanDeGestionDeRiesgos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlanDeGestionDeRiesgos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  `TipoAbono_id` INT NOT NULL,
  `TipoControlPlaga_id` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_PlanDeGestionDeRiesgos_TipoAbono1`
    FOREIGN KEY (`TipoAbono_id`)
    REFERENCES `TipoAbono` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PlanDeGestionDeRiesgos_TipoControlPlaga1`
    FOREIGN KEY (`TipoControlPlaga_id`)
    REFERENCES `TipoControlPlaga` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pais` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  `nacionalidad` VARCHAR(200) NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ciudad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ciudad` (
  `id` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  `Pais_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Ciudad_Pais1`
    FOREIGN KEY (`Pais_id`)
    REFERENCES `Pais` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Trabajadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Trabajadores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(200) NULL,
  `apellido` VARCHAR(200) NULL,
  `fechaDeNacimiento` DATE NULL,
  `Genero_id` INT NOT NULL,
  `Pais_id` INT NOT NULL,
  `Ciudad_id` INT ZEROFILL NOT NULL,
  `instruccionFormal` VARCHAR(200) NULL,
  `horasTrabajo` INT NULL,
  `salario` DOUBLE NULL,
  `PlanDeGestionDeRiesgos_id` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Trabajadores_PlanDeGestionDeRiesgos1`
    FOREIGN KEY (`PlanDeGestionDeRiesgos_id`)
    REFERENCES `PlanDeGestionDeRiesgos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Trabajadores_Genero1`
    FOREIGN KEY (`Genero_id`)
    REFERENCES `Genero` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Trabajadores_Pais1`
    FOREIGN KEY (`Pais_id`)
    REFERENCES `Pais` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Trabajadores_Ciudad1`
    FOREIGN KEY (`Ciudad_id`)
    REFERENCES `Ciudad` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Taller`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Taller` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `descripcion` TEXT NULL,
  `riesgo` TEXT NULL,
  `imagen` TEXT NULL,
  `video` TEXT NULL,
  `UnidadProduccion_id` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Taller_UnidadProduccion1`
    FOREIGN KEY (`UnidadProduccion_id`)
    REFERENCES `UnidadProduccion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TipoDesecho`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TipoDesecho` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(250) NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Biodigestor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biodigestor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ubicacion` VARCHAR(50) NOT NULL,
  `tamañoPropiedad` DOUBLE NULL,
  `imagen` TEXT NULL,
  `video` TEXT NULL,
  `anchoBio` DECIMAL(10,4) NULL,
  `largoBio` DECIMAL(10,4) NULL,
  `profundBio` DECIMAL(10,4) NULL,
  `anchoCaja` DECIMAL(10,4) NULL,
  `largoCaja` DECIMAL(10,4) NULL,
  `profundCaja` DECIMAL(10,4) NULL,
  `temperatura` DOUBLE NULL,
  `UnidadProduccion_id` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Biodigestor_UnidadProduccion1`
    FOREIGN KEY (`UnidadProduccion_id`)
    REFERENCES `UnidadProduccion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UnidadProduccion_has_Propietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UnidadProduccion_has_Propietario` (
  `UnidadProduccion_id` INT NOT NULL,
  `Propietario_ci` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`UnidadProduccion_id`),
  CONSTRAINT `fk_UnidadProduccion_has_Propietario_UnidadProduccion1`
    FOREIGN KEY (`UnidadProduccion_id`)
    REFERENCES `UnidadProduccion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_UnidadProduccion_has_Propietario_Propietario1`
    FOREIGN KEY (`Propietario_ci`)
    REFERENCES `Propietario` (`ci`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AreaInfluencia_has_TipoVegetal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AreaInfluencia_has_TipoVegetal` (
  `AreaInfluencia_id` INT NOT NULL,
  `TipoVegetal_id` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`AreaInfluencia_id`, `TipoVegetal_id`),
  CONSTRAINT `fk_AreaInfluencia_has_TipoVegetal_AreaInfluencia1`
    FOREIGN KEY (`AreaInfluencia_id`)
    REFERENCES `AreaInfluencia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AreaInfluencia_has_TipoVegetal_TipoVegetal1`
    FOREIGN KEY (`TipoVegetal_id`)
    REFERENCES `TipoVegetal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AreaInfluencia_has_Religion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AreaInfluencia_has_Religion` (
  `AreaInfluencia_id` INT NOT NULL,
  `Religion_id` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`AreaInfluencia_id`, `Religion_id`),
  CONSTRAINT `fk_AreaInfluencia_has_Religion_AreaInfluencia1`
    FOREIGN KEY (`AreaInfluencia_id`)
    REFERENCES `AreaInfluencia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AreaInfluencia_has_Religion_Religion1`
    FOREIGN KEY (`Religion_id`)
    REFERENCES `Religion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AreaInfluencia_has_Lenguaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AreaInfluencia_has_Lenguaje` (
  `AreaInfluencia_id` INT NOT NULL,
  `Lenguaje_id` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`AreaInfluencia_id`, `Lenguaje_id`),
  CONSTRAINT `fk_AreaInfluencia_has_Lenguaje_AreaInfluencia1`
    FOREIGN KEY (`AreaInfluencia_id`)
    REFERENCES `AreaInfluencia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AreaInfluencia_has_Lenguaje_Lenguaje1`
    FOREIGN KEY (`Lenguaje_id`)
    REFERENCES `Lenguaje` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Desecho`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Desecho` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `peso` DECIMAL(10,4) NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  `Biodigestor_id` INT NOT NULL,
  `TipoDesecho_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Desecho_Biodigestor1`
    FOREIGN KEY (`Biodigestor_id`)
    REFERENCES `Biodigestor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Desecho_TipoDesecho1`
    FOREIGN KEY (`TipoDesecho_id`)
    REFERENCES `TipoDesecho` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TipoDesechoT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TipoDesechoT` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(250) NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DesechoT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DesechoT` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `peso` DECIMAL(10,4) NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  `Taller_id` INT NOT NULL,
  `TipoDesechoT_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_DesechoT_Taller1`
    FOREIGN KEY (`Taller_id`)
    REFERENCES `Taller` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DesechoT_TipoDesechoT1`
    FOREIGN KEY (`TipoDesechoT_id`)
    REFERENCES `TipoDesechoT` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pais` (
  `idpais` INT NOT NULL,
  PRIMARY KEY (`idpais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vulnerabilidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vulnerabilidades` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Amenazas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Amenazas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Agricultura_has_PlanDeGestionDeRiesgos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Agricultura_has_PlanDeGestionDeRiesgos` (
  `Agricultura_id` INT NOT NULL,
  `PlanDeGestionDeRiesgos_id` INT NOT NULL,
  PRIMARY KEY (`Agricultura_id`, `PlanDeGestionDeRiesgos_id`),
  CONSTRAINT `fk_Agricultura_has_PlanDeGestionDeRiesgos_Agricultura1`
    FOREIGN KEY (`Agricultura_id`)
    REFERENCES `Agricultura` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Agricultura_has_PlanDeGestionDeRiesgos_PlanDeGestionDeRies1`
    FOREIGN KEY (`PlanDeGestionDeRiesgos_id`)
    REFERENCES `PlanDeGestionDeRiesgos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TipoAnimales_has_PlanDeGestionDeRiesgos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TipoAnimales_has_PlanDeGestionDeRiesgos` (
  `TipoAnimales_id` INT NOT NULL,
  `PlanDeGestionDeRiesgos_id` INT NOT NULL,
  `cantidad_animales` INT(10) NULL,
  PRIMARY KEY (`TipoAnimales_id`, `PlanDeGestionDeRiesgos_id`),
  CONSTRAINT `fk_TipoAnimales_has_PlanDeGestionDeRiesgos_TipoAnimales1`
    FOREIGN KEY (`TipoAnimales_id`)
    REFERENCES `TipoAnimales` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TipoAnimales_has_PlanDeGestionDeRiesgos_PlanDeGestionDeRie1`
    FOREIGN KEY (`PlanDeGestionDeRiesgos_id`)
    REFERENCES `PlanDeGestionDeRiesgos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OrigenIngresos_has_PlanDeGestionDeRiesgos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OrigenIngresos_has_PlanDeGestionDeRiesgos` (
  `OrigenIngresos_id` INT NOT NULL,
  `PlanDeGestionDeRiesgos_id` INT NOT NULL,
  PRIMARY KEY (`OrigenIngresos_id`, `PlanDeGestionDeRiesgos_id`),
  CONSTRAINT `fk_OrigenIngresos_has_PlanDeGestionDeRiesgos_OrigenIngresos1`
    FOREIGN KEY (`OrigenIngresos_id`)
    REFERENCES `OrigenIngresos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrigenIngresos_has_PlanDeGestionDeRiesgos_PlanDeGestionDeR1`
    FOREIGN KEY (`PlanDeGestionDeRiesgos_id`)
    REFERENCES `PlanDeGestionDeRiesgos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PlanDeGestionDeRiesgos_has_TipoCultivos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlanDeGestionDeRiesgos_has_TipoCultivos` (
  `PlanDeGestionDeRiesgos_id` INT NOT NULL,
  `TipoCultivos_id` INT NOT NULL,
  PRIMARY KEY (`PlanDeGestionDeRiesgos_id`, `TipoCultivos_id`),
  CONSTRAINT `fk_PlanDeGestionDeRiesgos_has_TipoCultivos_PlanDeGestionDeRie1`
    FOREIGN KEY (`PlanDeGestionDeRiesgos_id`)
    REFERENCES `PlanDeGestionDeRiesgos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PlanDeGestionDeRiesgos_has_TipoCultivos_TipoCultivos1`
    FOREIGN KEY (`TipoCultivos_id`)
    REFERENCES `TipoCultivos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PlanDeGestionDeRiesgos_has_Amenazas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlanDeGestionDeRiesgos_has_Amenazas` (
  `PlanDeGestionDeRiesgos_id` INT NOT NULL,
  `Amenazas_id` INT NOT NULL,
  PRIMARY KEY (`PlanDeGestionDeRiesgos_id`, `Amenazas_id`),
  CONSTRAINT `fk_PlanDeGestionDeRiesgos_has_Amenazas_PlanDeGestionDeRiesgos1`
    FOREIGN KEY (`PlanDeGestionDeRiesgos_id`)
    REFERENCES `PlanDeGestionDeRiesgos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PlanDeGestionDeRiesgos_has_Amenazas_Amenazas1`
    FOREIGN KEY (`Amenazas_id`)
    REFERENCES `Amenazas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PlanDeGestionDeRiesgos_has_Vulnerabilidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlanDeGestionDeRiesgos_has_Vulnerabilidades` (
  `PlanDeGestionDeRiesgos_id` INT NOT NULL,
  `Vulnerabilidades_id` INT NOT NULL,
  PRIMARY KEY (`PlanDeGestionDeRiesgos_id`, `Vulnerabilidades_id`),
  CONSTRAINT `fk_PlanDeGestionDeRiesgos_has_Vulnerabilidades_PlanDeGestionD1`
    FOREIGN KEY (`PlanDeGestionDeRiesgos_id`)
    REFERENCES `PlanDeGestionDeRiesgos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PlanDeGestionDeRiesgos_has_Vulnerabilidades_Vulnerabilidad1`
    FOREIGN KEY (`Vulnerabilidades_id`)
    REFERENCES `Vulnerabilidades` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
