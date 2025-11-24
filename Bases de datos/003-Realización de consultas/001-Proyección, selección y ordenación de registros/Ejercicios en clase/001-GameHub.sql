-- sudo mysql -u root -p

CREATE DATABASE GameHub;

USE GameHub;

CREATE TABLE inventario_de_pociones(
	nombre VARCHAR(255),
	tipo VARCHAR(255),
	rareza VARCHAR(255)
);

INSERT INTO inventario_de_pociones VALUES("Poción de salud","Curación","Común");
INSERT INTO inventario_de_pociones VALUES("Poción de maná","Energía mágica","Común");
INSERT INTO inventario_de_pociones VALUES("Elixir de fuerza","Aumento de fuerza","Rara");
INSERT INTO inventario_de_pociones VALUES("Poción de velocidad","Aumento de velocidad","Inusual");
INSERT INTO inventario_de_pociones VALUES("Poción de resistencia","Aumenta la defensa","Común");
INSERT INTO inventario_de_pociones VALUES("Tónico de sabiduría","Mejora la inteligencia","Rara");
INSERT INTO inventario_de_pociones VALUES("Elixir de invisibilidad","Vuelve invisible temporalmente","Épica");
INSERT INTO inventario_de_pociones VALUES("Poción de visión nocturna","Permite ver en la oscuridad","Inusual");
INSERT INTO inventario_de_pociones VALUES("Poción de fuego","Daño de fuego","Común");
INSERT INTO inventario_de_pociones VALUES("Poción de escarcha","Daño de hielo","Común");
INSERT INTO inventario_de_pociones VALUES("Poción de suerte","Aumenta probabilidad de crítico","Rara");
INSERT INTO inventario_de_pociones VALUES("Elixir de vitalidad","Aumenta la vida máxima","Inusual");
INSERT INTO inventario_de_pociones VALUES("Poción de antídoto","Cura veneno","Común");
INSERT INTO inventario_de_pociones VALUES("Brebaje de camuflaje","Mezcla para ocultarse mejor","Rara");
INSERT INTO inventario_de_pociones VALUES("Poción de respiración acuática","Permite respirar bajo el agua","Inusual");
INSERT INTO inventario_de_pociones VALUES("Elixir de precisión","Mejora la puntería","Rara");
INSERT INTO inventario_de_pociones VALUES("Poción de calma","Reduce el estrés y el miedo","Común");
INSERT INTO inventario_de_pociones VALUES("Tónico berserker","Aumenta fuerza pero reduce defensa","Épica");
INSERT INTO inventario_de_pociones VALUES("Poción de luz","Emite un brillo fuerte","Común");

SELECT

nombre AS 'Nombre de la poción',
tipo AS 'Tipo de la poción',
rareza AS 'Rareza de la poción'

FROM
inventario_de_pociones

ORDER BY rareza ASC;

