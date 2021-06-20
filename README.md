<h4> Реализованная функциональность </h4>
(Функциональность, поддерживаемая и видимая во frontend части)
<ul>
    <li> Быстрая запись к специалисту </li>
    <li> Своевременно отложенная регистрация <b>*</b> </li>
    <li> Простая медкарта, история посещений. </li>
    <li> Сквозной поиск по всему приложению, врачи и услуги </li>
</ul>

<h4> Особенность проекта в следующем: </h4>
<ul>
    <li> Бэкэнд исполнен в виде RESTFull API </li>
    <li> Библиотека заболеваний на python и mongodb </li>
</ul>

<h4> Основной стэк технологий </h4>
<ul>
    <li> HTML CSS JavaSCript</li>
    <li> React.js </li>
    <li> PHP, MYSQL</li>
    <li> Pyton, MonongoDB</li>
</ul>

<h4> Демо </h4>
<p>Демо сервиса доступно по адресу: http://188.225.87.209:3000/</p>
<p>Реквизиты тестового пользователя: test@test.ru, password</p>

<h2> Среда запуска </h2>
<hr>
<ol>
    <li>Любая 64-битная ос</li>
    <li>php 7+, apache, mariadb</li>

<h3>Требования для api с mongodb</h3> 
<ol>
    <li>модуль python pymango  </li>
    <li>модуль python flask    </li>
    <li>локальная копия бд     </li>
</ol>

<h3>Для mongodb</h3>
<ol>
    <li> Скачать/установить mongodb community edition </li>
    <li> Запустить локальный сервер, находящийся в  </li>
    c:\program files\mongodb\server\4.4\bin\mongod.exe
    <li> айпи\порт для подключения можно посмореть при завершении запуска в конце вывода либо в mongo.exe</li>
    <li> Зайти в mongodb compass, подключится к серверу </li>
    <li> Создать бд (health) с пустой коллекцей (diseases), в коллекцию импортировать файл dtb.json из dtb/ </li>
</ol>

<h3>Для mysql</h3>
<ul>
    <li> создать пустую бд с названием health</li>
    <li> импортировать в неё файл dtb.php из dtb/ </li>
<ul>
</ol>
<p>Перейти в папку health/api/py и из неё выполнить команду flask run</p>

<h3> API Готов к работе! </h3>

Разработчики    
<h4> Брыкин Владислав backend https://t.me/namerinnos </h4>
<h4> Донсков Дмитрий frontend https://t.me/pitonishe56 </h4>
<h4> Бикимов Арман капитан команды, дизайнер https://t.me/arman_bikimov </h4>
