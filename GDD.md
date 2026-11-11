# ClockShift — Documento de diseño

## 1. Resumen ejecutivo

ClockShift es un puzzle-platformer 2D para [Game Off 2026](https://itch.io/jam/game-off-2026). En un mundo mecánico construido alrededor de un reloj gigante, el jugador explora dos salas y recupera cuatro piezas para reconstruirlo. El reloj cambia el escenario entre cuatro fases temporales, la interpretación del tema **SHIFT**.

El concepto, la estructura del mundo y las reglas centrales están definidos por el brief. La distribución de los puzzles, los detalles de presentación y los parámetros de juego se indican como propuestas o pendientes de validación.

## 2. High concept

Cambia el reloj para transformar el mundo. Cuando lo repares, cruza una sala en la que el reloj cambia el mundo por su cuenta.

## 3. Pilares de diseño

- Cada fase cambia cómo se recorre una sala conocida.
- Los mecanismos enseñan relaciones entre fases mediante cambios visibles en el escenario.
- Los controles y los puntos seguros permiten concentrarse en leer y anticipar los cambios.

## 4. Público objetivo

Participantes del jam y jugadores que disfrutan de puzzles ambientales y plataformas de precisión moderada. La experiencia está pensada para completarse en una sesión breve.

## 5. Género y perspectiva

Puzzle-platformer 2D de vista lateral. El proyecto existente usa Godot.

## 6. Bucle principal

Elegir una fase en la sala central → explorar la sala accesible → resolver un puzzle o accionar un mecanismo → recuperar una pieza o descubrir una pista → volver al reloj para cambiar de fase.

## 7. Mecánicas principales

Movimiento horizontal, salto, colisión con plataformas e interacción con mecanismos. El mismo conjunto de movimientos sirve para las cuatro fases. Los mecanismos transforman rutas y las piezas se instalan automáticamente en el reloj al recogerlas.

## 8. Fases temporales

Las cuatro fases están disponibles desde el inicio y se seleccionan libremente desde el reloj de la sala central. La puerta A abre en las fases 1 y 2 y la B en las fases 3 y 4. La fase seleccionada se mantiene durante la exploración. La sala final pasa automáticamente de una fase a la siguiente en orden circular.

## 9. Plataformas

La geometría base se conserva entre fases. Las plataformas y los puentes pueden aparecer, desaparecer o cambiar de posición según la fase y el estado de los mecanismos. Se propone mantener los accesos y descansos principales sobre suelo fijo.

## 10. Mecanismos persistentes

Las piezas recogidas, los mecanismos activados y los cambios permanentes se conservan al volver a la sala central, cambiar de fase o reaparecer. Se propone que cada mecanismo del MVP tenga una activación permanente y que sus efectos se apliquen al entrar en la sala correspondiente. Los efectos que abren una ruta deben conservar un camino de vuelta.

## 11. Sala central

El reloj gigante sirve como selector de fase y muestra las piezas instaladas. Las puertas A y B indican sus fases de acceso. La puerta final se abre al instalar las cuatro piezas. Se propone una distribución compacta para acortar el trayecto entre el selector y las puertas.

## 12. Salas de exploración

La distribución siguiente es una propuesta para probar en niveles provisionales. Cada pieza exige recorrer una ruta de plataformas propia de su fase.

| Sala y fase | Pieza | Puzzle propuesto |
| --- | --- | --- |
| A, fase 1 | Marco | Cruzar un eje por las plataformas de la fase 1. Una palanca accesible desde un descanso extiende un puente en B durante la fase 3. |
| A, fase 2 | Segundero | Alcanzar una pasarela elevada mediante el contrapeso liberado en B durante la fase 4. |
| B, fase 3 | Minutero | Cruzar el puente extendido desde A durante la fase 1 y usar los engranajes como escalones. |
| B, fase 4 | Horario | Subir por los apoyos de la fase 4. Un mecanismo al pie del recorrido libera el contrapeso de A en la fase 2. |

Las dos palancas se alcanzan sin recoger piezas. Los símbolos del puente y del contrapeso se repiten en sus mecanismos y destinos para que el jugador pueda deducir dónde buscar el efecto.

## 13. Desafío final

La sala final combina tramos de salto con descansos que existen en las cuatro fases. Antes de cada cambio, el reloj anuncia la fase siguiente con una señal visual y sonora. Al caer, el jugador reaparece en un punto seguro y el ciclo conserva su fase y tiempo restante. Se propone ubicar cada punto de reaparición junto a un tramo desde el que se pueda esperar y retomar la ruta en un ciclo completo. Quedan por ajustar el intervalo, la anticipación del aviso y la distancia entre puntos seguros.

## 14. Progresión

El jugador puede explorar cualquier fase desde el inicio. Los mecanismos condicionan el acceso a algunas rutas. La propuesta permite recoger las piezas en cualquier orden porque sus mecanismos se pueden activar antes de recoger la pieza de su propia sala. Cada pieza instala su parte del reloj y la cuarta abre el desafío final.

## 15. Victoria y derrota

La partida se completa al alcanzar la salida de la sala final. Una caída o un contacto con un obstáculo devuelve al jugador a un punto seguro y conserva su progreso. En la sala final también se conserva el ciclo temporal.

## 16. Dirección artística

Se propone una estética de relojería con latón, piedra y engranajes de siluetas claras. Cada fase combina un color con un símbolo propio. Los elementos que afectan el recorrido se distinguen del decorado por su contorno y contraste.

## 17. Interfaz y experiencia de usuario

Se propone mostrar la fase activa, el estado de las cuatro piezas en el reloj central y las fases válidas junto a cada puerta. En el desafío final, un indicador muestra cuándo ocurrirá el cambio y qué fase viene. Las señales incluyen forma o texto para que su significado se pueda leer sin depender del color o del sonido.

## 18. Diseño sonoro

Se propone usar clics mecánicos para interacciones y una señal de confirmación al instalar cada pieza. El tic-tac del desafío final marca el ritmo y un aviso diferenciado precede al cambio de fase.

## 19. Riesgos de diseño

| Riesgo | Respuesta propuesta |
| --- | --- |
| Repetición al revisitar salas | Cambiar la ruta y el tipo de salto entre variantes de una sala. |
| Demasiados regresos al reloj | Ubicar el selector cerca de las puertas y abrir atajos de regreso al final de los recorridos largos. |
| Puzzles demasiado obvios | Mostrar la relación entre el mecanismo y su destino mediante símbolos compartidos y dejar que el jugador deduzca la secuencia. |
| Bloqueos de progresión | Mantener accesibles los mecanismos, evitar dependencias circulares y probar el regreso desde cada ruta. |
| Cambios injustos en la sala final | Avisar antes de cambiar, ofrecer descansos permanentes y probar la reaparición en las cuatro fases. |
| Alcance excesivo | Reutilizar salas y componentes y validar un puzzle completo antes de construir el resto. |

## 20. Alcance del MVP

Una sala central, dos salas de exploración, cuatro fases, cuatro piezas y una sala final. El MVP incluye movimiento y salto, selección de fase, mecanismos persistentes durante la partida, reaparición, señales de cambio y una salida que termina la partida.

## 21. Backlog opcional

- Doble salto.
- Dash.
- Habilidades distintas por fase.

## 22. Criterios de aceptación

- El jugador puede elegir las cuatro fases desde el comienzo en la sala central y cada puerta de exploración abre en sus dos fases asignadas.
- Cada variante de exploración ofrece un recorrido hacia su pieza y una forma de volver al reloj.
- Cambiar de fase, volver a una sala o reaparecer conserva las piezas y los efectos persistentes de los mecanismos.
- Las cuatro piezas aparecen instaladas en el reloj y la puerta final se abre al recuperar la cuarta.
- La sala final anuncia los cambios, mantiene el ciclo durante las caídas y permite continuar al reaparecer en cualquiera de las cuatro fases.
- Alcanzar la salida completa la partida.

## 23. Plan de desarrollo para el jam

1. Probar el movimiento, el salto y la reaparición en una sala provisional.
2. Construir el selector, las cuatro fases y una ruta que cambie al activar un mecanismo en otra fase. Validar el recorrido de ida y vuelta antes de ampliar los niveles.
3. Implementar las cuatro piezas, completar las dos salas y comprobar que se puedan recoger en distintos órdenes.
4. Construir la sala final y ajustar los avisos, las zonas seguras y las reapariciones con el ciclo activo.
5. Probar la partida de principio a fin, ajustar señales y controles, exportar y verificar la build antes de entregarla en itch.io.
