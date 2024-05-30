# Yanapay Yachacuyta

Yanapay Yachacuyta es una aplicación móvil dirigida a estudiantes de secundaria. Su objetivo es ayudar a los estudiantes a repasar los cursos según el plan de estudios proporcionado por el Ministerio de Educación del país.

## Características

- **Material educativo**: Acceso a material educativo relacionado con cada curso para repasar y reforzar conocimientos.
- **Simulación de exámenes**: Simulaciones de exámenes por cada módulo para evaluar el aprendizaje.
- **Registro y validación de profesores**: Los profesores pueden registrarse en la plataforma. Su registro será validado con el colegio de profesores del Perú para certificar su condición.
- **Interacción entre alumnos y profesores**: Los alumnos pueden agregar dudas en cada módulo de los cursos, las cuales pueden ser respondidas por profesores o por otros alumnos.

## Capturas de Pantalla

![Presentación](https://drive.google.com/uc?export=view&id=1QIeAHOFeNLms_FMQ8IjGMdNzqOhDJa82) 

![Visualización de cursos](https://drive.google.com/uc?export=view&id=1vcyglkSCNC1C8h1bz4KizJ8ltw5vuL41) 

## Tecnologías Utilizadas

- **Flutter**: Framework para el desarrollo de aplicaciones móviles.
- **Dart**: Lenguaje de programación utilizado en Flutter.
- **SQLite**: Base de datos local para almacenar la información de la aplicación.

## Requisitos Previos

- [Flutter](https://flutter.dev) 3.0 o superior
- [Dart](https://dart.dev) 3.0 o superior

## Instalación

1. Clona el repositorio

    ```sh
    git clone https://github.com/silverblade34/app_yachakuqta_yanapay.git
    ```

2. Navega al directorio del proyecto

    ```sh
    cd app_yachakuqta_yanapay
    ```

3. Instala las dependencias

    ```sh
    flutter pub get
    ```

4. Ejecuta la aplicación

    ```sh
    flutter run
    ```

## Estructura del Proyecto

```plaintext
lib/
├── app/
│   ├── bindings/
│   ├── controllers/
│   ├── data/
│   │   ├── dtos/
│   │   │   └── courses_student/
│   │   │       └── course_dto.dart
│   │   ├── models/
│   │   │   └── data_model.dart
│   │   ├── providers/
│   │   ├── repositories/
│   ├── middlewares/
│   ├── routes/
│   ├── ui/
│   │   ├── global_widgets/
│   │   ├── pages/
│   │   │   └── home_page.dart
│   │   ├── themes/
│   ├── utils/
├── main.dart

```

## Desarrollo

Para empezar con el desarrollo de este proyecto, revisa la documentación de Flutter y Dart:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Flutter online documentation](https://docs.flutter.dev/)

## Contribuciones

Las contribuciones son bienvenidas. Para contribuir, por favor sigue estos pasos:

1. Haz un fork del proyecto
2. Crea una nueva rama (`git checkout -b feature/nueva-caracteristica`)
3. Realiza tus cambios y haz commit (`git commit -am 'Agrega nueva característica'`)
4. Haz push a la rama (`git push origin feature/nueva-caracteristica`)
5. Abre un Pull Request

## Licencia

Este proyecto está licenciado bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para más detalles.

## Contacto

Si tienes alguna pregunta, no dudes en contactarnos en:

- Email: mpacheco.tacay@gmail.com
- GitHub: [https://github.com/silverblade34](https://github.com/silverblade34)

---

¡Gracias por usar Yanapay Yachacuyta!
