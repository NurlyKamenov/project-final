## [REST API](http://localhost:8080/doc)

## Концепция:

- Spring Modulith
    - [Spring Modulith: достигли ли мы зрелости модульности](https://habr.com/ru/post/701984/)
    - [Introducing Spring Modulith](https://spring.io/blog/2022/10/21/introducing-spring-modulith)
    - [Spring Modulith - Reference documentation](https://docs.spring.io/spring-modulith/docs/current-SNAPSHOT/reference/html/)

```
  url: jdbc:postgresql://localhost:5432/jira
  username: jira
  password: JiraRush
```

- Есть 2 общие таблицы, на которых не fk
    - _Reference_ - справочник. Связь делаем по _code_ (по id нельзя, тк id привязано к окружению-конкретной базе)
    - _UserBelong_ - привязка юзеров с типом (owner, lead, ...) к объекту (таска, проект, спринт, ...). FK вручную будем
      проверять

## Аналоги

- https://java-source.net/open-source/issue-trackers

## Тестирование

- https://habr.com/ru/articles/259055/

Список выполненных задач:
1. [х] Разобраться со структурой проекта (onboarding).
2. [х] Удалить социальные сети: vk, yandex. Easy task
3. [х] Вынести чувствительную информацию в отдельный проперти файл:
4. [х] Переделать тесты так, чтоб во время тестов использовалась in memory БД (H2), а не PostgreSQL. Для этого нужно определить 2 бина, и выборка какой из них использовать должно определяться активным профилем Spring. H2 не поддерживает все фичи, которые есть у PostgreSQL, поэтому тебе прийдется немного упростить скрипты с тестовыми данными.
5. [х] Написать тесты для всех публичных методов контроллера ProfileRestController. Хоть методов только 2, но тестовых методов должно быть больше, т.к. нужно проверить success and unsuccess path.
    Для запуска тестов необходимо добавить переменные окружения: **MAIL_HOST = smtp.gmail.com;MAIL_USERNAME= jira4jr@gmail.com;MAIL_PASSWORD= zdfzsrqvgimldzyj;MAIL_PORT= 587;**
6. [х] Сделать рефакторинг метода com.javarush.jira.bugtracking.attachment.FileUtil#upload чтоб он использовал современный подход для работы с файловой системмой. Easy task
7. [х] Добавить новый функционал: добавления тегов к задаче (REST API + реализация на сервисе). 
      Фронт делать необязательно. Таблица task_tag уже создана.
    * Добавлен контроллер /api/tasks/{id}/tag
8. [х] Добавить подсчет времени сколько задача находилась в работе и тестировании. Написать 2 метода на уровне сервиса, которые параметром принимают задачу и возвращают затраченное время:
   - Сколько задача находилась в работе (**/workingTime/{id}**).
   - Сколько задача находилась на тестировании (**/testingTime/{id}**)  
9. [х] Написать Dockerfile для основного сервера
10. [х] Написать docker-compose файл для запуска контейнера сервера вместе с БД и nginx. Для nginx используй конфиг-файл config/nginx.conf. При необходимости файл конфига можно редактировать. Hard task
11. [х] Добавить локализацию минимум на двух языках для шаблонов писем (mails) 
и стартовой страницы index.html (header, sidebar не переводил).
12. [] Переделать механизм распознавания «свой-чужой» между фронтом и беком с JSESSIONID на JWT. Из сложностей – тебе придётся переделать отправку форм с фронта, чтоб добавлять хедер аутентификации.

Данные на прод загружаются автоматически в файл application добавлено data-locations: classpath:data4dev/data.sql