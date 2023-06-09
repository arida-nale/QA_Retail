﻿#language: ru

Функционал: Проверка работы ТИС Просклад для конфигурации Розница

Как Кассир, я хочу проверить работу РМК

Контекст: 
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: <01>. Открытие кассовой смены
* Объявление переменных
	И Я запоминаю в переменную "ЧекНалТекСменаСоздан" значение 0
	И Я запоминаю в переменную "ЧекБезНалТекСменаСоздан" значение 0
	И Я запоминаю в переменную "ЧекСкидкаНалТекСменаСоздан" значение 0
	И Я запоминаю в переменную "ЧекСкидкаБезНалТекСменаСоздан" значение 0
	И Я запоминаю в переменную "ЧекСмешОплатаТекСменаСоздан" значение 0
	И Я запоминаю в переменную "ЧекНалЗакСменаСоздан" значение 0
	И Я запоминаю в переменную "ЧекБезНалЗакСменаСоздан" значение 0
	И Я запоминаю в переменную "ЧекСкидкаНалЗакСменаСоздан" значение 0
	И Я запоминаю в переменную "ЧекСкидкаБезНалЗакСменаСоздан" значение 0

* Открытие смены
	Когда открылось окно 'РМК: Арида(ptr-46): РМК (управляемый режим)'
	Тогда я активизирую окно 'РМК: Арида(ptr-46): РМК (управляемый режим)'
	И я нажимаю на гиперссылку с именем "ДекорацияОткрытиеСмены"

Сценарий: <02>. Оформление чека - Оплата наличными
* Закрытие онок клиентского приложения	
	И Я закрываю все окна клиентского приложения

* Открытие РМК
	Когда я активизирую окно 'РМК: Арида(ptr-46): РМК (управляемый режим)'
	И я нажимаю на гиперссылку с именем "ДекорацияРегистрацияПродаж"
	И я нажимаю на гиперссылку с именем "КартинкаЧО01Меню"

* Подбор товаров
	И я нажимаю на гиперссылку с именем "КартинкаЧО02Поиск"
	И в таблице "Товары" я активизирую поле с именем "ТоварыНаименование"
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" я перехожу к строке:
		| 'Ед. изм.' | 'Код'         | 'Наименование'                               |
		| 'шт'       | '00-00000002' | 'Штучный товар без характеристик без НДС Т2' |
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я перехожу к строке:
		| 'Ед. изм.' | 'Код'         | 'Наименование'                            |
		| 'шт'       | '00-00000001' | 'Штучный товар без характеристик без НДС' |
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я перехожу к строке:
		| 'Ед. изм.' | 'Код'         | 'Наименование'                            |
		| 'шт'       | '00-00000005' | 'Услуга' |
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" я завершаю редактирование строки


* Пробитие чека
	И Я закрываю окно 'Поиск и подбор товара в РМК'
	И я нажимаю на гиперссылку с именем "КартинкаЧО05Наличные"
	И я нажимаю на кнопку с именем 'КомандаEnter'
	И я жду закрытия окна 'Оплата наличными' в течение 20 секунд

Сценарий: <03>. Оформление чека с ручной скидкой- Оплата наличными
* Закрытие онок клиентского приложения	
	Если предыдущий сценарий выполнен успешно Тогда
		И Я запоминаю в переменную "ЧекНалТекСменаСоздан" значение 1
	иначе
		И Я закрываю все окна клиентского приложения
		И клик по координатам "800" "600"

		попытка
			И я нажимаю на гиперссылку с именем "КартинкаПО05ВвестиАннулирование"
			И я нажимаю на кнопку с именем 'КомандаОтветДа'
		исключение

	И клик по координатам "800" "600"

* Подбор товаров
	И я нажимаю на гиперссылку с именем "КартинкаЧО02Поиск"
	И в таблице "Товары" я активизирую поле с именем "ТоварыНаименование"
	И в таблице "Товары" я перехожу к строке:
		| 'Ед. изм.' | 'Код'         | 'Наименование'                               |
		| 'шт'       | '00-00000002' | 'Штучный товар без характеристик без НДС Т2' |
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я перехожу к строке:
		| 'Ед. изм.' | 'Код'         | 'Наименование'                            |
		| 'шт'       | '00-00000001' | 'Штучный товар без характеристик без НДС' |
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я перехожу к строке:
		| 'Ед. изм.' | 'Код'         | 'Наименование'                            |
		| 'шт'       | '00-00000005' | 'Услуга' |
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" я завершаю редактирование строки
	И Я закрываю окно 'Поиск и подбор товара в РМК'

	Когда я нажимаю на гиперссылку с именем "КартинкаПО22РучныеСкидки"
	И я нажимаю на кнопку с именем 'КомандаСкидкаПроцентВЧеке'
	И я нажимаю на кнопку с именем 'Команда1ПраваяКлавиатура'
	И я нажимаю на кнопку с именем 'Команда5'
	И я нажимаю на кнопку с именем 'КомандаEnter'

* Пробитие чека
	И я нажимаю на гиперссылку с именем "КартинкаЧО05Наличные"
	Если элемент формы 'К оплате' стал равен '382,50' Тогда
		И я нажимаю на кнопку с именем 'КомандаEnter'
		И я жду закрытия окна 'Оплата наличными' в течение 20 секунд
	Иначе
		Иначе я вызываю исключение "Ошибка расчета скидки. "

Сценарий: <04>. Оформление чека с ручной скидкой- Безналичная оплата
* Закрытие онок клиентского приложения	
	Если предыдущий сценарий выполнен успешно Тогда
		И Я запоминаю в переменную "ЧекСкидкаНалТекСменаСоздан" значение 1
	иначе
		И Я закрываю все окна клиентского приложения
		И клик по координатам "800" "600"

		попытка
			И я нажимаю на гиперссылку с именем "КартинкаПО05ВвестиАннулирование"
			И я нажимаю на кнопку с именем 'КомандаОтветДа'
		исключение

	И клик по координатам "800" "600"

* Подбор товаров
	И я нажимаю на гиперссылку с именем "КартинкаЧО02Поиск"
	И в таблице "Товары" я активизирую поле с именем "ТоварыНаименование"
	И в таблице "Товары" я перехожу к строке:
		| 'Ед. изм.' | 'Код'         | 'Наименование'                               |
		| 'шт'       | '00-00000002' | 'Штучный товар без характеристик без НДС Т2' |
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я перехожу к строке:
		| 'Ед. изм.' | 'Код'         | 'Наименование'                            |
		| 'шт'       | '00-00000001' | 'Штучный товар без характеристик без НДС' |
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я перехожу к строке:
		| 'Ед. изм.' | 'Код'         | 'Наименование'                            |
		| 'шт'       | '00-00000005' | 'Услуга' |
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" я завершаю редактирование строки
	И Я закрываю окно 'Поиск и подбор товара в РМК'

	Когда я нажимаю на гиперссылку с именем "КартинкаПО22РучныеСкидки"
	И я нажимаю на кнопку с именем 'КомандаСкидкаПроцентВЧеке'
	И я нажимаю на кнопку с именем 'Команда1ПраваяКлавиатура'
	И я нажимаю на кнопку с именем 'Команда5'
	И я нажимаю на кнопку с именем 'КомандаEnter'

* Пробитие чека
	Когда я нажимаю на гиперссылку с именем "КартинкаЧО06ПлатежнаяКарта"
	И я активизирую окно 'Авторизация операции'
	И я нажимаю на кнопку с именем 'КомандаEnterПраваяКлавиатура'
	И я нажимаю на кнопку с именем 'КомандаОтветДа'

	Если элемент формы 'Всего к оплате (тг)' стал равен '382,50' Тогда
		И я нажимаю на кнопку с именем 'КомандаEnter'
		И я жду закрытия окна 'Оплата наличными' в течение 20 секунд
	Иначе
		Иначе я вызываю исключение "Ошибка расчета скидки. "

Сценарий: <05>. Оформление чека - Оплата безналом
* Закрытие онок клиентского приложения	
	Если предыдущий сценарий выполнен успешно Тогда
		И Я запоминаю в переменную "ЧекСкидкаБезНалТекСменаСоздан" значение 1
	иначе
		И Я закрываю все окна клиентского приложения
		И клик по координатам "800" "600"
		
		попытка
			И я нажимаю на гиперссылку с именем "КартинкаПО05ВвестиАннулирование"
			И я нажимаю на кнопку с именем 'КомандаОтветДа'
		исключение

	И клик по координатам "800" "600"

* Подбор товаров
	И я нажимаю на гиперссылку с именем "КартинкаЧО02Поиск"
	И в таблице "Товары" я активизирую поле с именем "ТоварыНаименование"
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" я перехожу к строке:
		| 'Ед. изм.' | 'Код'         | 'Наименование'                               |
		| 'шт'       | '00-00000002' | 'Штучный товар без характеристик без НДС Т2' |
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я перехожу к строке:
		| 'Ед. изм.' | 'Код'         | 'Наименование'                            |
		| 'шт'       | '00-00000001' | 'Штучный товар без характеристик без НДС' |
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я перехожу к строке:
		| 'Ед. изм.' | 'Код'         | 'Наименование'                            |
		| 'шт'       | '00-00000005' | 'Услуга' |
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" я завершаю редактирование строки
	И Я закрываю окно 'Поиск и подбор товара в РМК'

* Пробитие чека
	попытка
		Когда я нажимаю на гиперссылку с именем "КартинкаЧО06ПлатежнаяКарта"
		И я активизирую окно 'Авторизация операции'
		И я нажимаю на кнопку с именем 'КомандаEnterПраваяКлавиатура'
		И я нажимаю на кнопку с именем 'КомандаОтветДа'
		И я нажимаю на кнопку с именем 'КомандаEnter'
		И я жду закрытия окна 'Оплата чека' в течение 20 секунд
	исключение
		И я вызываю исключение "Ошибка при пробитии чека"

Сценарий: <06>. Оформление чека - Смешанная оплата
* Закрытие онок клиентского приложения	
	Если предыдущий сценарий выполнен успешно Тогда
		И Я запоминаю в переменную "ЧекБезНалТекСменаСоздан" значение 1
	иначе
		И Я закрываю все окна клиентского приложения
		И клик по координатам "800" "600"

		попытка
			И я нажимаю на гиперссылку с именем "КартинкаПО05ВвестиАннулирование"
			И я нажимаю на кнопку с именем 'КомандаОтветДа'
		исключение
	
	И клик по координатам "800" "600"

* Подбор товаров
	И я нажимаю на гиперссылку с именем "КартинкаЧО02Поиск"
	И в таблице "Товары" я активизирую поле с именем "ТоварыНаименование"
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" я перехожу к строке:
		| 'Ед. изм.' | 'Код'         | 'Наименование'                               |
		| 'шт'       | '00-00000002' | 'Штучный товар без характеристик без НДС Т2' |
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я перехожу к строке:
		| 'Ед. изм.' | 'Код'         | 'Наименование'                            |
		| 'шт'       | '00-00000001' | 'Штучный товар без характеристик без НДС' |
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я перехожу к строке:
		| 'Ед. изм.' | 'Код'         | 'Наименование'                            |
		| 'шт'       | '00-00000005' | 'Услуга' |
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" я завершаю редактирование строки
	
* Пробитие чека
	И Я закрываю окно 'Поиск и подбор товара в РМК'
	И я нажимаю на гиперссылку с именем "КартинкаЧО07СложнаяОплата"
	И я нажимаю на кнопку с именем 'КомандаКарта'
	И я нажимаю на кнопку с именем 'Команда1ПраваяКлавиатура'
	И я нажимаю на кнопку с именем 'Команда0'
	И я нажимаю на кнопку с именем 'Команда0'
	И я нажимаю на кнопку с именем 'КомандаEnter'
	И я нажимаю на кнопку с именем 'КомандаОтветДа'
	И я нажимаю на кнопку с именем 'КомандаНаличные'
	И я нажимаю на кнопку с именем 'КомандаEnter'
	И я жду закрытия окна 'Оплата наличными' в течение 20 секунд

Сценарий: <07>. Проверка округления весового товара
	Если предыдущий сценарий выполнен успешно Тогда
		И Я запоминаю в переменную "ЧекСмешОплатаТекСменаСоздан" значение 1
	иначе
		И Я закрываю все окна клиентского приложения
		И клик по координатам "800" "600"

		попытка
			И я нажимаю на гиперссылку с именем "КартинкаПО05ВвестиАннулирование"
			И я нажимаю на кнопку с именем 'КомандаОтветДа'
		исключение

	И клик по координатам "800" "600"

* Выбор весового товара	
	И я нажимаю на гиперссылку с именем "КартинкаЧО02Поиск"
	И в таблице "Товары" я перехожу к строке:
		| 'Ед. изм.' | 'Код'         | 'Наименование'          |
		| 'кг'       | '00-00000003' | 'Весовой товар без НДС' |
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" я завершаю редактирование строки
	И Я закрываю окно 'Поиск и подбор товара в РМК'

* Изменение количества
	И в таблице "Товары" я перехожу к строке:
		| 'Количество' | 'Номенклатура'          | 'Сумма'  | 'Характеристика'                   | 'Цена'   |
		| '1,000'      | 'Весовой товар без НДС' | '150,00' | '<характеристики не используются>' | '150,00' |
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличествоУпаковок"
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыКоличествоУпаковок' я ввожу текст '1,503'
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" поле с именем 'ТоварыСумма' имеет значение '225,45'

* Пробитие чека
	И я нажимаю на гиперссылку с именем "КартинкаЧО05Наличные"
	И я нажимаю на кнопку с именем 'КомандаEnter'
	И я жду закрытия окна 'Оплата наличными' в течение 20 секунд


Сценарий: <08>. Возврат товара полный в текущей смене - Наличные
* Закрытие онок клиентского приложения	
	Если предыдущий сценарий выполнен успешно Тогда
	иначе
		И Я закрываю все окна клиентского приложения
		И клик по координатам "800" "600"

		попытка
			И я нажимаю на гиперссылку с именем "КартинкаПО05ВвестиАннулирование"
			И я нажимаю на кнопку с именем 'КомандаОтветДа'
		исключение

	И клик по координатам "800" "600"

* Проверка созданного чека нужного формата
	Если переменная "$ЧекНалТекСменаСоздан$" имеет значение 0 Тогда
		И я вызываю исключение "Проверка невозможна т.к. не создан чек необходимого формата."

* Выбор чека для оформления возврата
	И я нажимаю на гиперссылку с именем "КартинкаЧО04Возврат"
	И в таблице "СписокЧеков" я перехожу к строке:
		| 'Касса (ККМ)' | 'Номер' | 'Статус чека ККМ' |
		| 'Касса ККМ'   | '1'     | 'Пробитый'        |
	И я нажимаю на кнопку с именем 'КомандаВыбрать'

* Указание причины возврата
	И я нажимаю на кнопку с именем 'КомандаВыбрать'

* Пробитие возврата
	попытка
		И я нажимаю на гиперссылку с именем "КартинкаЧО05Наличные"
		И я нажимаю на кнопку с именем 'КомандаEnter'
		И я жду закрытия окна 'Оплата наличными' в течение 20 секунд
	исключение
		И я вызываю исключение "Ошибка при пробитии чека на возврат"
		
Сценарий: <09>. Возврат товара полный в текущей смене - Безнал
* Закрытие онок клиентского приложения	
	Если предыдущий сценарий выполнен успешно Тогда
	иначе
		И Я закрываю все окна клиентского приложения
		И клик по координатам "800" "600"

		попытка
			И я нажимаю на гиперссылку с именем "КартинкаПО05ВвестиАннулирование"
			И я нажимаю на кнопку с именем 'КомандаОтветДа'
		исключение
			
	И клик по координатам "800" "600"

* Проверка созданного чека нужного формата
	Если переменная "$ЧекБезНалТекСменаСоздан$" имеет значение 0 Тогда
		И я вызываю исключение "Проверка невозможна т.к. не создан чек необходимого формата."

* Выбор чека для оформления возврата
	И я нажимаю на гиперссылку с именем "КартинкаЧО04Возврат"
	И в таблице "СписокЧеков" я перехожу к строке:
		| 'Касса (ККМ)' | 'Номер' | 'Статус чека ККМ' |
		| 'Касса ККМ'   | '4'     | 'Пробитый'        |
	И я нажимаю на кнопку с именем 'КомандаВыбрать'

* Указание причины возврата
	Тогда открылось окно 'Выбор причины возврата'
	И я нажимаю на кнопку с именем 'КомандаВыбрать'

* Пробитие возврата
	попытка
		Когда я нажимаю на гиперссылку с именем "КартинкаЧО06ПлатежнаяКарта"
		И я перехожу к следующему реквизиту
		И я нажимаю на кнопку с именем 'КомандаОтветДа'
		И я нажимаю на кнопку с именем 'КомандаEnter'
		И я жду закрытия окна 'Оплата чека' в течение 20 секунд
	исключение
		И я вызываю исключение "Ошибка при пробитии чека на возврат"

Сценарий: <10>. Возврат товара полный со скидкой в текущей смене - Наличные
* Закрытие онок клиентского приложения	
	Если предыдущий сценарий выполнен успешно Тогда
	иначе
		И Я закрываю все окна клиентского приложения
		И клик по координатам "800" "600"

		попытка
			И я нажимаю на гиперссылку с именем "КартинкаПО05ВвестиАннулирование"
			И я нажимаю на кнопку с именем 'КомандаОтветДа'
		исключение

	И клик по координатам "800" "600"

* Проверка созданного чека нужного формата
	Если переменная "$ЧекСкидкаНалТекСменаСоздан$" имеет значение 0 Тогда
		И я вызываю исключение "Проверка невозможна т.к. не создан чек необходимого формата."

* Выбор чека для оформления возврата
	И я нажимаю на гиперссылку с именем "КартинкаЧО04Возврат"
	И в таблице "СписокЧеков" я перехожу к строке:
		| 'Касса (ККМ)' | 'Номер' | 'Статус чека ККМ' |
		| 'Касса ККМ'   | '2'     | 'Пробитый'        |
	И я нажимаю на кнопку с именем 'КомандаВыбрать'

* Указание причины возврата
	И я нажимаю на кнопку с именем 'КомандаВыбрать'

* Пробитие возврата
	попытка
		И я нажимаю на гиперссылку с именем "КартинкаЧО05Наличные"
		И я нажимаю на кнопку с именем 'КомандаEnter'
		И я жду закрытия окна 'Оплата наличными' в течение 20 секунд
	исключение
		И я вызываю исключение "Ошибка при пробитии чека на возврат"
		
Сценарий: <11>. Возврат товара полный со скидкой в текущей смене - Безнал
* Закрытие онок клиентского приложения	
	Если предыдущий сценарий выполнен успешно Тогда
	иначе
		И Я закрываю все окна клиентского приложения
		И клик по координатам "800" "600"

		попытка
			И я нажимаю на гиперссылку с именем "КартинкаПО05ВвестиАннулирование"
			И я нажимаю на кнопку с именем 'КомандаОтветДа'
		исключение
			
	И клик по координатам "800" "600"

* Проверка созданного чека нужного формата
	Если переменная "$ЧекСкидкаБезНалТекСменаСоздан$" имеет значение 0 Тогда
		И я вызываю исключение "Проверка невозможна т.к. не создан чек необходимого формата."

* Выбор чека для оформления возврата
	И я нажимаю на гиперссылку с именем "КартинкаЧО04Возврат"
	И в таблице "СписокЧеков" я перехожу к строке:
		| 'Касса (ККМ)' | 'Номер' | 'Статус чека ККМ' |
		| 'Касса ККМ'   | '3'     | 'Пробитый'        |
	И я нажимаю на кнопку с именем 'КомандаВыбрать'

* Указание причины возврата
	Тогда открылось окно 'Выбор причины возврата'
	И я нажимаю на кнопку с именем 'КомандаВыбрать'

* Пробитие возврата
	попытка
		Когда я нажимаю на гиперссылку с именем "КартинкаЧО06ПлатежнаяКарта"
		И я перехожу к следующему реквизиту
		И я нажимаю на кнопку с именем 'КомандаОтветДа'
		И я нажимаю на кнопку с именем 'КомандаEnter'
		И я жду закрытия окна 'Оплата чека' в течение 20 секунд
	исключение
		И я вызываю исключение "Ошибка при пробитии чека на возврат"

Сценарий: <12>. Возврат товара полный в текущей смене - Смешанная оплата
* Закрытие онок клиентского приложения	
	Если предыдущий сценарий выполнен успешно Тогда
	иначе
		И Я закрываю все окна клиентского приложения
		И клик по координатам "800" "600"

		попытка
			И я нажимаю на гиперссылку с именем "КартинкаПО05ВвестиАннулирование"
			И я нажимаю на кнопку с именем 'КомандаОтветДа'
		исключение
			
	И клик по координатам "800" "600"

* Проверка созданного чека нужного формата
	Если переменная "$ЧекСмешОплатаТекСменаСоздан$" имеет значение 0 Тогда
		И я вызываю исключение "Проверка невозможна т.к. не создан чек необходимого формата."

* Выбор чека для оформления возврата
	И я нажимаю на гиперссылку с именем "КартинкаЧО04Возврат"
	И в таблице "СписокЧеков" я перехожу к строке:
		| 'Касса (ККМ)' | 'Номер' | 'Статус чека ККМ' |
		| 'Касса ККМ'   | '5'     | 'Пробитый'        |
	И я нажимаю на кнопку с именем 'КомандаВыбрать'

* Указание причины возврата
	И я нажимаю на кнопку с именем 'КомандаВыбрать'

* Пробитие возврата
	И я нажимаю на гиперссылку с именем "КартинкаЧО07СложнаяОплата"
	
	Если текущее окно "равно" ожидаемому окну 'Оплата чека' Тогда
		И я перехожу к следующему реквизиту
		И я нажимаю на кнопку с именем 'КомандаКарта'
		И я нажимаю на кнопку с именем 'КомандаОтветДа'
		И я нажимаю на кнопку с именем 'КомандаНаличные'
		И я нажимаю на кнопку с именем 'КомандаEnter'
		И я жду закрытия окна 'Оплата чека' в течение 20 секунд
	Иначе
		И я вызываю исключение "Что-то пошло не так. Открылось не то окно."

Сценарий: <13>. Оформление чека для возврата вне смены - Оплата наличными
* Закрытие онок клиентского приложения	
	* Закрытие онок клиентского приложения	
	Если предыдущий сценарий выполнен успешно Тогда
	иначе
		И Я закрываю все окна клиентского приложения
		И клик по координатам "800" "600"

		попытка
			И я нажимаю на гиперссылку с именем "КартинкаПО05ВвестиАннулирование"
			И я нажимаю на кнопку с именем 'КомандаОтветДа'
		исключение

	И клик по координатам "800" "600"

* Подбор товаров
	И я нажимаю на гиперссылку с именем "КартинкаЧО02Поиск"
	И в таблице "Товары" я активизирую поле с именем "ТоварыНаименование"
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" я перехожу к строке:
		| 'Ед. изм.' | 'Код'         | 'Наименование'                               |
		| 'шт'       | '00-00000002' | 'Штучный товар без характеристик без НДС Т2' |
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я перехожу к строке:
		| 'Ед. изм.' | 'Код'         | 'Наименование'                            |
		| 'шт'       | '00-00000001' | 'Штучный товар без характеристик без НДС' |
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я перехожу к строке:
		| 'Ед. изм.' | 'Код'         | 'Наименование'                            |
		| 'шт'       | '00-00000005' | 'Услуга' |
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" я завершаю редактирование строки

* Пробитие чека
	И Я закрываю окно 'Поиск и подбор товара в РМК'
	И я нажимаю на гиперссылку с именем "КартинкаЧО05Наличные"
	И я нажимаю на кнопку с именем 'КомандаEnter'
	И я жду закрытия окна 'Оплата наличными' в течение 20 секунд

Сценарий: <14>. Оформление чека с ручной скидкой для возврата вне смены- Оплата наличными
* Закрытие онок клиентского приложения	
	Если предыдущий сценарий выполнен успешно Тогда
		И Я запоминаю в переменную "ЧекНалЗакСменаСоздан" значение 1
	иначе
		И Я закрываю все окна клиентского приложения
		И клик по координатам "800" "600"

		попытка
			И я нажимаю на гиперссылку с именем "КартинкаПО05ВвестиАннулирование"
			И я нажимаю на кнопку с именем 'КомандаОтветДа'
		исключение

	И клик по координатам "800" "600"

* Подбор товаров
	И я нажимаю на гиперссылку с именем "КартинкаЧО02Поиск"
	И в таблице "Товары" я активизирую поле с именем "ТоварыНаименование"
	И в таблице "Товары" я перехожу к строке:
		| 'Ед. изм.' | 'Код'         | 'Наименование'                               |
		| 'шт'       | '00-00000002' | 'Штучный товар без характеристик без НДС Т2' |
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я перехожу к строке:
		| 'Ед. изм.' | 'Код'         | 'Наименование'                            |
		| 'шт'       | '00-00000001' | 'Штучный товар без характеристик без НДС' |
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я перехожу к строке:
		| 'Ед. изм.' | 'Код'         | 'Наименование'                            |
		| 'шт'       | '00-00000005' | 'Услуга' |
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" я завершаю редактирование строки
	И Я закрываю окно 'Поиск и подбор товара в РМК'

	Когда я нажимаю на гиперссылку с именем "КартинкаПО22РучныеСкидки"
	И я нажимаю на кнопку с именем 'КомандаСкидкаПроцентВЧеке'
	И я нажимаю на кнопку с именем 'Команда1ПраваяКлавиатура'
	И я нажимаю на кнопку с именем 'Команда5'
	И я нажимаю на кнопку с именем 'КомандаEnter'

* Пробитие чека
	И я нажимаю на гиперссылку с именем "КартинкаЧО05Наличные"
	Если элемент формы 'К оплате' стал равен '382,50' Тогда
		И я нажимаю на кнопку с именем 'КомандаEnter'
		И я жду закрытия окна 'Оплата наличными' в течение 20 секунд
	Иначе
		Иначе я вызываю исключение "Ошибка расчета скидки. "

Сценарий: <15>. Оформление чека с ручной скидкой для возврата вне смены- Безналичная оплата
* Закрытие онок клиентского приложения	
	Если предыдущий сценарий выполнен успешно Тогда
		И Я запоминаю в переменную "ЧекСкидкаНалЗакСменаСоздан" значение 1
	иначе
		И Я закрываю все окна клиентского приложения
		И клик по координатам "800" "600"

		попытка
			И я нажимаю на гиперссылку с именем "КартинкаПО05ВвестиАннулирование"
			И я нажимаю на кнопку с именем 'КомандаОтветДа'
		исключение

	И клик по координатам "800" "600"

* Подбор товаров
	И я нажимаю на гиперссылку с именем "КартинкаЧО02Поиск"
	И в таблице "Товары" я активизирую поле с именем "ТоварыНаименование"
	И в таблице "Товары" я перехожу к строке:
		| 'Ед. изм.' | 'Код'         | 'Наименование'                               |
		| 'шт'       | '00-00000002' | 'Штучный товар без характеристик без НДС Т2' |
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я перехожу к строке:
		| 'Ед. изм.' | 'Код'         | 'Наименование'                            |
		| 'шт'       | '00-00000001' | 'Штучный товар без характеристик без НДС' |
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я перехожу к строке:
		| 'Ед. изм.' | 'Код'         | 'Наименование'                            |
		| 'шт'       | '00-00000005' | 'Услуга' |
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" я завершаю редактирование строки
	И Я закрываю окно 'Поиск и подбор товара в РМК'

	Когда я нажимаю на гиперссылку с именем "КартинкаПО22РучныеСкидки"
	И я нажимаю на кнопку с именем 'КомандаСкидкаПроцентВЧеке'
	И я нажимаю на кнопку с именем 'Команда1ПраваяКлавиатура'
	И я нажимаю на кнопку с именем 'Команда5'
	И я нажимаю на кнопку с именем 'КомандаEnter'

* Пробитие чека
	Когда я нажимаю на гиперссылку с именем "КартинкаЧО06ПлатежнаяКарта"
	И я активизирую окно 'Авторизация операции'
	И я нажимаю на кнопку с именем 'КомандаEnterПраваяКлавиатура'
	И я нажимаю на кнопку с именем 'КомандаОтветДа'

	Если элемент формы 'Всего к оплате (тг)' стал равен '382,50' Тогда
		И я нажимаю на кнопку с именем 'КомандаEnter'
		И я жду закрытия окна 'Оплата наличными' в течение 20 секунд
	Иначе
		Иначе я вызываю исключение "Ошибка расчета скидки. "



Сценарий: <16>. Оформление чека для возврата вне смены - Оплата безналом

* Закрытие онок клиентского приложения	
	Если предыдущий сценарий выполнен успешно Тогда
		И Я запоминаю в переменную "ЧекСкидкаБезНалЗакСменаСоздан" значение 1
	иначе
		И Я закрываю все окна клиентского приложения
		И клик по координатам "800" "600"
		
		попытка
			И я нажимаю на гиперссылку с именем "КартинкаПО05ВвестиАннулирование"
			И я нажимаю на кнопку с именем 'КомандаОтветДа'
		исключение

	И клик по координатам "800" "600"

* Подбор товаров
	И я нажимаю на гиперссылку с именем "КартинкаЧО02Поиск"
	И в таблице "Товары" я активизирую поле с именем "ТоварыНаименование"
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" я перехожу к строке:
		| 'Ед. изм.' | 'Код'         | 'Наименование'                               |
		| 'шт'       | '00-00000002' | 'Штучный товар без характеристик без НДС Т2' |
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я перехожу к строке:
		| 'Ед. изм.' | 'Код'         | 'Наименование'                            |
		| 'шт'       | '00-00000001' | 'Штучный товар без характеристик без НДС' |
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я перехожу к строке:
		| 'Ед. изм.' | 'Код'         | 'Наименование'                            |
		| 'шт'       | '00-00000005' | 'Услуга' |
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" я завершаю редактирование строки
	И Я закрываю окно 'Поиск и подбор товара в РМК'

* Пробитие чека
	попытка
		Когда я нажимаю на гиперссылку с именем "КартинкаЧО06ПлатежнаяКарта"
		И я активизирую окно 'Авторизация операции'
		И я нажимаю на кнопку с именем 'КомандаEnterПраваяКлавиатура'
		И я нажимаю на кнопку с именем 'КомандаОтветДа'
		И я нажимаю на кнопку с именем 'КомандаEnter'
		И я жду закрытия окна 'Оплата чека' в течение 20 секунд
	исключение
		И я вызываю исключение "Ошибка при пробитии чека"

Сценарий: <17>. Z - отчет. Проверка закрытия кассовой смены
* Закрытие онок клиентского приложения	
	Если предыдущий сценарий выполнен успешно Тогда
		И Я запоминаю в переменную "ЧекБезНалЗакСменаСоздан" значение 1
	иначе
		И Я закрываю все окна клиентского приложения
		И клик по координатам "800" "600"
		
		попытка
			И я нажимаю на гиперссылку с именем "КартинкаПО05ВвестиАннулирование"
			И я нажимаю на кнопку с именем 'КомандаОтветДа'
		исключение

	И клик по координатам "800" "600"
	И я нажимаю на гиперссылку с именем "КартинкаПО11Выход"

* Закрытие кассовой смены
	Когда я активизирую окно 'РМК: Арида(ptr-46): РМК (управляемый режим)'
	И я нажимаю на гиперссылку с именем "ДекорацияЗакрытиеСмены"
	И я нажимаю на кнопку с именем 'КомандаОтветДа'
	И я нажимаю на кнопку с именем 'ФормаЗакрытьСмену'
	И я жду закрытия окна 'Проверка непробитых чеков: Закрытие кассовой смены' в течение 20 секунд
	И Я закрываю окно 'Закрытие кассовой смены'

Сценарий: <18>. Открытие кассовой смены
* Открытие смены
	И Я закрываю все окна клиентского приложения
	Тогда я активизирую окно 'РМК: Арида(ptr-46): РМК (управляемый режим)'
	И я нажимаю на гиперссылку с именем "ДекорацияОткрытиеСмены"
	Когда я активизирую окно 'РМК: Арида(ptr-46): РМК (управляемый режим)'
	И я нажимаю на гиперссылку с именем "ДекорацияРегистрацияПродаж"
	И я нажимаю на гиперссылку с именем "КартинкаЧО01Меню"
	
Сценарий: <19>. Возврат товара полный в закрытой смене - Наличные
* Закрытие онок клиентского приложения	
	Если предыдущий сценарий выполнен успешно Тогда
	иначе
		И Я закрываю все окна клиентского приложения
		И клик по координатам "800" "600"

		попытка
			И я нажимаю на гиперссылку с именем "КартинкаПО05ВвестиАннулирование"
			И я нажимаю на кнопку с именем 'КомандаОтветДа'
		исключение
			И я нажимаю на гиперссылку с именем "КартинкаПО05ВвестиАннулирование"
			И я нажимаю на кнопку с именем 'КомандаОтветДа'

	И клик по координатам "800" "600"

* Проверка созданного чека нужного формата
	Если переменная "$ЧекНалЗакСменаСоздан$" имеет значение 0 Тогда
		И я вызываю исключение "Проверка невозможна т.к. не создан чек необходимого формата."

* Выбор чека для оформления возврата
	И я нажимаю на гиперссылку с именем "КартинкаЧО04Возврат"
	И в таблице "СписокЧеков" я перехожу к строке:
		| 'Касса (ККМ)' | 'Номер' | 'Статус чека ККМ' |
		| 'Касса ККМ'   | '12'     | 'Архивный'        |
	И я нажимаю на кнопку с именем 'КомандаВыбрать'

* Указание причины возврата
	И я нажимаю на кнопку с именем 'КомандаВыбрать'

* Пробитие возврата
	И я нажимаю на гиперссылку с именем "КартинкаЧО05Наличные"
	попытка
		И я нажимаю на кнопку с именем 'КомандаEnter'
		И я жду закрытия окна 'Оплата наличными' в течение 20 секунд
	исключение
		И я вызываю исключение "Ошибка при пробитии чека на возврат"
		
Сценарий: <20>. Возврат товара полный в закрытой смене - Безнал
* Закрытие онок клиентского приложения	
	Если предыдущий сценарий выполнен успешно Тогда
	иначе
		И Я закрываю все окна клиентского приложения
		И клик по координатам "800" "600"

	Если в таблице 'Товары' количество строк "больше" 0
		попытка
			И я нажимаю на гиперссылку с именем "КартинкаПО05ВвестиАннулирование"
			И я нажимаю на кнопку с именем 'КомандаОтветДа'
		исключение

	И клик по координатам "800" "600"

* Проверка созданного чека нужного формата
	Если переменная "$ЧекБезНалЗакСменаСоздан$" имеет значение 0 Тогда
		И я вызываю исключение "Проверка невозможна т.к. не создан чек необходимого формата."

* Выбор чека для оформления возврата
	И я нажимаю на гиперссылку с именем "КартинкаЧО04Возврат"
	И в таблице "СписокЧеков" я перехожу к строке:
		| 'Касса (ККМ)' | 'Номер' | 'Статус чека ККМ' |
		| 'Касса ККМ'   | '15'     | 'Архивный'        |
	И я нажимаю на кнопку с именем 'КомандаВыбрать'

* Указание причины возврата
	И я нажимаю на кнопку с именем 'КомандаВыбрать'

* Пробитие возврата
	попытка
		Когда я нажимаю на гиперссылку с именем "КартинкаЧО06ПлатежнаяКарта"
		И я перехожу к следующему реквизиту
		И я нажимаю на кнопку с именем 'КомандаОтветДа'
		И я нажимаю на кнопку с именем 'КомандаEnter'
		И я жду закрытия окна 'Оплата чека' в течение 20 секунд
	исключение
		И я вызываю исключение "Ошибка при пробитии чека на возврат"

Сценарий: <21>. Возврат товара полный со скидкой в закрытой смене - Наличные
* Закрытие онок клиентского приложения	
	Если предыдущий сценарий выполнен успешно Тогда
	иначе
		И Я закрываю все окна клиентского приложения
		И клик по координатам "800" "600"

	Если в таблице 'Товары' количество строк "больше" 0
		попытка
			И я нажимаю на гиперссылку с именем "КартинкаПО05ВвестиАннулирование"
			И я нажимаю на кнопку с именем 'КомандаОтветДа'
		исключение

	И клик по координатам "800" "600"

* Проверка созданного чека нужного формата
	Если переменная "$ЧекСкидкаНалЗакСменаСоздан$" имеет значение 0 Тогда
		И я вызываю исключение "Проверка невозможна т.к. не создан чек необходимого формата."

* Выбор чека для оформления возврата
	И я нажимаю на гиперссылку с именем "КартинкаЧО04Возврат"
	И в таблице "СписокЧеков" я перехожу к строке:
		| 'Касса (ККМ)' | 'Номер' | 'Статус чека ККМ' |
		| 'Касса ККМ'   | '13'     | 'Архивный'        |
	И я нажимаю на кнопку с именем 'КомандаВыбрать'

* Указание причины возврата
	И я нажимаю на кнопку с именем 'КомандаВыбрать'

* Пробитие возврата
	И я нажимаю на гиперссылку с именем "КартинкаЧО05Наличные"
	попытка
		И я нажимаю на кнопку с именем 'КомандаEnter'
		И я жду закрытия окна 'Оплата наличными' в течение 20 секунд
	исключение
		И я вызываю исключение "Ошибка при пробитии чека на возврат"
		
Сценарий: <22>. Возврат товара полный со скидкой в закрытой смене - Безнал
* Закрытие онок клиентского приложения	
	Если предыдущий сценарий выполнен успешно Тогда
	иначе
		И Я закрываю все окна клиентского приложения
		И клик по координатам "800" "600"

	Если в таблице 'Товары' количество строк "больше" 0
		попытка
			И я нажимаю на гиперссылку с именем "КартинкаПО05ВвестиАннулирование"
			И я нажимаю на кнопку с именем 'КомандаОтветДа'
		исключение

	И клик по координатам "800" "600"

* Проверка созданного чека нужного формата
	Если переменная "$ЧекСкидкаБезНалЗакСменаСоздан$" имеет значение 0 Тогда
		И я вызываю исключение "Проверка невозможна т.к. не создан чек необходимого формата."

* Выбор чека для оформления возврата
	И я нажимаю на гиперссылку с именем "КартинкаЧО04Возврат"
	И в таблице "СписокЧеков" я перехожу к строке:
		| 'Касса (ККМ)' | 'Номер' | 'Статус чека ККМ' |
		| 'Касса ККМ'   | '14'     | 'Архивный'        |
	И я нажимаю на кнопку с именем 'КомандаВыбрать'

* Указание причины возврата
	И я нажимаю на кнопку с именем 'КомандаВыбрать'

* Пробитие возврата
	попытка
		Когда я нажимаю на гиперссылку с именем "КартинкаЧО06ПлатежнаяКарта"
		И я перехожу к следующему реквизиту
		И я нажимаю на кнопку с именем 'КомандаОтветДа'
		И я нажимаю на кнопку с именем 'КомандаEnter'
		И я жду закрытия окна 'Оплата чека' в течение 20 секунд
	исключение
		И я вызываю исключение "Ошибка при пробитии чека на возврат"

Сценарий: <23>. Х - отчет. Сменный отчет без гашения
* Закрытие онок клиентского приложения	
	Если предыдущий сценарий выполнен успешно Тогда
	иначе
		И Я закрываю все окна клиентского приложения
		И клик по координатам "800" "600"

		попытка
			И я нажимаю на гиперссылку с именем "КартинкаПО05ВвестиАннулирование"
			И я нажимаю на кнопку с именем 'КомандаОтветДа'
		исключение

	И я нажимаю на гиперссылку с именем "КартинкаПО11Выход"

* Сменный отчет без гашения
	Когда я активизирую окно 'РМК: Арида(ptr-46): РМК (управляемый режим)'
	И я нажимаю на гиперссылку с именем "ДекорацияОтчетБезГашения"	

Сценарий: <24>. Z - отчет. Проверка закрытия кассовой смены
* Закрытие онок клиентского приложения	
	И Я закрываю все окна клиентского приложения

* Закрытие кассовой смены
	Когда я активизирую окно 'РМК: Арида(ptr-46): РМК (управляемый режим)'
	И я нажимаю на гиперссылку с именем "ДекорацияЗакрытиеСмены"
	И я нажимаю на кнопку с именем 'КомандаОтветДа'
	И я нажимаю на кнопку с именем 'ФормаЗакрытьСмену'
	И я жду закрытия окна 'Проверка непробитых чеков: Закрытие кассовой смены' в течение 20 секунд
	И Я закрываю окно 'Закрытие кассовой смены'
	И я нажимаю на кнопку с именем 'КнопкаЗакрыть'
	И я нажимаю на гиперссылку с именем "ДекорацияЗакрыть"

* Закрытие клиента тестирования
	И я закрываю сеанс текущего клиента тестирования