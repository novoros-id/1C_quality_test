///////////////////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2022, ООО 1С-Софт
// Все права защищены. Эта программа и сопроводительные материалы предоставляются 
// в соответствии с условиями лицензии Attribution 4.0 International (CC BY 4.0)
// Текст лицензии доступен по ссылке:
// https://creativecommons.org/licenses/by/4.0/legalcode
///////////////////////////////////////////////////////////////////////////////////////////////////////

#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	КэшЗначений = Новый Структура("МассивУзловПланаОбмена, ОтборПоДатеВозникновения, ОтборУзловПланаОбмена, ОтборТипыПредупреждений");
	
	ОтборыПоПереданнымПараметрам();
	
	Элементы.СтраницыФормы.ТекущаяСтраница = Элементы.СтраницаОтборы;
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
	ПредставлениеОтбораПоПериоду();
	ПредставлениеОтбораУзловОбмена();
	ПредставлениеОтбораПоТипамПредупреждений();
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура ПредставлениеОтбораПоПериодуНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	
	Диалог = Новый ДиалогРедактированияСтандартногоПериода();
	Диалог.Период = КэшЗначений.ОтборПоДатеВозникновения;
	Диалог.Показать(Новый ОписаниеОповещения("ПослеОтбораПоДатеВозникновения", ЭтотОбъект));
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеОтбораПоДатеВозникновения(Результат, ДополнительныеПараметры) Экспорт
	
	Если ТипЗнч(Результат) <> Тип("СтандартныйПериод") Тогда
		
		Возврат;
		
	КонецЕсли;
	
	КэшЗначений.ОтборПоДатеВозникновения = Результат;
	ПредставлениеОтбораПоПериоду();
	
КонецПроцедуры

&НаКлиенте
Процедура ПредставлениеОтбораПоПериодуОчистка(Элемент, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	
КонецПроцедуры

&НаКлиенте
Процедура ПредставлениеОтбораСинхронизацийНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	
	ПараметрыОткрытия = Новый Структура;
	ПараметрыОткрытия.Вставить("МассивУзловПланаОбмена", КэшЗначений.МассивУзловПланаОбмена);
	ПараметрыОткрытия.Вставить("ОтборУзловПланаОбмена", КэшЗначений.ОтборУзловПланаОбмена);
	
	ОписаниеОповещения = Новый ОписаниеОповещения("ПослеОтбораУзловОбменов", ЭтотОбъект);
	
	ОткрытьФорму("РегистрСведений.РезультатыОбменаДанными.Форма.ОтборСинхронизаций", ПараметрыОткрытия, ЭтотОбъект, , , , ОписаниеОповещения);
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеОтбораУзловОбменов(Результат, ДополнительныеПараметры) Экспорт
	
	Если ТипЗнч(Результат) <> Тип("Массив") Тогда
		
		Возврат;
		
	КонецЕсли;
	
	КэшЗначений.ОтборУзловПланаОбмена = Результат;
	ПредставлениеОтбораУзловОбмена();
	
КонецПроцедуры

&НаКлиенте
Процедура ПредставлениеОтбораСинхронизацийОчистка(Элемент, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	
КонецПроцедуры

&НаКлиенте
Процедура ПредставлениеОтбораТиповПредупрежденийНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	
	ПараметрыОткрытия = Новый Структура;
	ПараметрыОткрытия.Вставить("ОтборТипыПредупреждений", КэшЗначений.ОтборТипыПредупреждений);
	
	ОписаниеОповещения = Новый ОписаниеОповещения("ПослеОтбораПоТипуПредупреждений", ЭтотОбъект);
	
	ОткрытьФорму("РегистрСведений.РезультатыОбменаДанными.Форма.ОтборПредупрежденийПоТипам", ПараметрыОткрытия, ЭтотОбъект, , , , ОписаниеОповещения);
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеОтбораПоТипуПредупреждений(Результат, ДополнительныеПараметры) Экспорт
	
	Если ТипЗнч(Результат) <> Тип("Массив") Тогда
		
		Возврат;
		
	КонецЕсли;
	
	КэшЗначений.ОтборТипыПредупреждений = Результат;
	ПредставлениеОтбораПоТипамПредупреждений();
	
КонецПроцедуры

&НаКлиенте
Процедура ПредставлениеОтбораТиповПредупрежденийОчистка(Элемент, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура УдалитьПредупреждения(Команда)
	
	УдалитьПредупрежденияВДлительнойОперации();
	ПослеНачалаДлительнойОперации();
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура ПредставлениеОтбораПоПериоду()
	
	Если НЕ ЗначениеЗаполнено(КэшЗначений.ОтборПоДатеВозникновения) Тогда
		
		ПредставлениеОтбораПоПериоду = НСтр("ru ='Отбор не установлен'", ОбщегоНазначенияКлиент.КодОсновногоЯзыка());
		
	Иначе
		
		ПредставлениеОтбораПоПериоду = СокрЛП(КэшЗначений.ОтборПоДатеВозникновения);
		
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ПредставлениеОтбораУзловОбмена()
	
	Если КэшЗначений.ОтборУзловПланаОбмена = Неопределено
		ИЛИ КэшЗначений.ОтборУзловПланаОбмена.Количество() = 0 Тогда
		
		ПредставлениеОтбораСинхронизаций = НСтр("ru ='Отбор не установлен'", ОбщегоНазначенияКлиент.КодОсновногоЯзыка());
		
	ИначеЕсли КэшЗначений.ОтборУзловПланаОбмена.Количество() = 1 Тогда
		
		ПредставлениеОтбораСинхронизаций = Строка(КэшЗначений.ОтборУзловПланаОбмена[0]);
		
	Иначе
		
		ШаблонТекста = НСтр("ru ='%1%2 (и еще %3 шт.)'", ОбщегоНазначенияКлиент.КодОсновногоЯзыка());
		Троеточие = ?(СтрДлина(СокрЛП(КэшЗначений.ОтборУзловПланаОбмена[0])) > 29, "...", "");
		КоличествоЕще = КэшЗначений.ОтборУзловПланаОбмена.Количество() - 1;
		
		ПредставлениеОтбораСинхронизаций = СтрШаблон(ШаблонТекста, Лев(СокрЛП(КэшЗначений.ОтборУзловПланаОбмена[0]), 30), Троеточие, КоличествоЕще);
		
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ПредставлениеОтбораПоТипамПредупреждений()
	
	Если КэшЗначений.ОтборТипыПредупреждений = Неопределено
		ИЛИ КэшЗначений.ОтборТипыПредупреждений.Количество() = 0 Тогда
		
		ПредставлениеОтбораТиповПредупреждений = НСтр("ru ='Отбор не установлен'", ОбщегоНазначенияКлиент.КодОсновногоЯзыка());
		
	ИначеЕсли КэшЗначений.ОтборТипыПредупреждений.Количество() = 1 Тогда
		
		ПредставлениеОтбораТиповПредупреждений = Строка(КэшЗначений.ОтборТипыПредупреждений[0]);
		
	ИначеЕсли КэшЗначений.ОтборТипыПредупреждений.Количество() > 8 Тогда
		
		ПредставлениеОтбораТиповПредупреждений = НСтр("ru ='Все типы предупреждений'", ОбщегоНазначенияКлиент.КодОсновногоЯзыка());
		
	Иначе
		
		ШаблонТекста = НСтр("ru ='%1%2 (и еще %3 шт.)'", ОбщегоНазначенияКлиент.КодОсновногоЯзыка());
		Троеточие = ?(СтрДлина(СокрЛП(КэшЗначений.ОтборТипыПредупреждений[0])) > 29, "...", "");
		КоличествоЕще = КэшЗначений.ОтборТипыПредупреждений.Количество() - 1;
		
		ПредставлениеОтбораТиповПредупреждений = СтрШаблон(ШаблонТекста, Лев(СокрЛП(КэшЗначений.ОтборТипыПредупреждений[0]), 30), Троеточие, КоличествоЕще);
		
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ПоказатьОшибкуПользователю()
	
	Элементы.СтраницыФормы.ТекущаяСтраница = Элементы.СтраницаОшибка;
	ОписаниеОшибки = ДлительнаяОперация.ПодробноеПредставлениеОшибки;
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеНачалаДлительнойОперации()
	
	Если ТипЗнч(ДлительнаяОперация) = Тип("Структура")
		И ДлительнаяОперация.Статус = "Ошибка" Тогда
		
		ПоказатьОшибкуПользователю();
		Возврат;
		
	КонецЕсли;
	
	Элементы.СтраницыФормы.ТекущаяСтраница = Элементы.СтраницаДлительнаяОперация;
	
	ПараметрыОжидания = ДлительныеОперацииКлиент.ПараметрыОжидания(ЭтотОбъект);
	ПараметрыОжидания.ВыводитьОкноОжидания = Ложь;
	ПараметрыОжидания.ВыводитьСообщения = Истина;
	ПараметрыОжидания.ВыводитьПрогрессВыполнения = Истина;
	ПараметрыОжидания.ОповещениеОПрогрессеВыполнения = Новый ОписаниеОповещения("ПрогрессУдаленияПредупрежденийСинхронизации", ЭтотОбъект); 
	
	ОповещениеОЗавершении = Новый ОписаниеОповещения("ПослеЗавершенияДлительнойОперации", ЭтотОбъект);
	ДлительныеОперацииКлиент.ОжидатьЗавершение(ДлительнаяОперация, ОповещениеОЗавершении, ПараметрыОжидания);
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗавершенияДлительнойОперации(Результат, ДополнительныеПараметры) Экспорт
	
	Если ТипЗнч(ДлительнаяОперация) = Тип("Структура")
		И ДлительнаяОперация.Статус = "Ошибка" Тогда
		
		ПоказатьОшибкуПользователю();
		Возврат;
		
	КонецЕсли;
	
	Элементы.СтраницыФормы.ТекущаяСтраница = Элементы.СтраницаГотово;
	
КонецПроцедуры

&НаКлиенте
Процедура ПрогрессУдаленияПредупрежденийСинхронизации(Результат, ДополнительныеПараметры) Экспорт
	
	Если Результат = Неопределено
		ИЛИ Результат.Статус <> "Выполняется" Тогда
		
		Возврат;
		
	КонецЕсли;
	
	Если Результат.Прогресс <> Неопределено Тогда
		
		Индикация = ?(Результат.Прогресс.Процент < 1, 1, Результат.Прогресс.Процент);
		Элементы.Индикация.Подсказка = Результат.Прогресс.Текст;
		
	КонецЕсли;
	
КонецПроцедуры

&НаСервере
Процедура ОтборыПоПереданнымПараметрам()
	
	Параметры.Свойство("МассивУзловПланаОбмена", КэшЗначений.МассивУзловПланаОбмена);
	Параметры.Свойство("ОтборПоДатеВозникновения", КэшЗначений.ОтборПоДатеВозникновения);
	Параметры.Свойство("ОтборУзловОбменов", КэшЗначений.ОтборУзловПланаОбмена);
	Параметры.Свойство("ОтборТипыПредупреждений", КэшЗначений.ОтборТипыПредупреждений); 
	
	Если НЕ Параметры.Свойство("ТолькоСкрытыеЗаписи", ТолькоСкрытыеЗаписи) Тогда
		
		ТолькоСкрытыеЗаписи = Ложь;
		
	КонецЕсли;
	
КонецПроцедуры

&НаСервере
Процедура РазобратьПредупрежденияПоТипам(ПараметрыУдаления)
	
	ОтборТипыПредупрежденийОбменов = Новый Массив;
	ОтборТипыПредупрежденийВерсий = Новый Массив;
	
	ЗначенияОбменов = Новый Массив;
	ЗначенияОбменов.Добавить(Перечисления.ТипыПроблемОбменаДанными.АдминистративнаяОшибкаПриложения);
	ЗначенияОбменов.Добавить(Перечисления.ТипыПроблемОбменаДанными.ОшибкаПроверкиСконвертированногоОбъекта);
	ЗначенияОбменов.Добавить(Перечисления.ТипыПроблемОбменаДанными.ОшибкаВыполненияКодаОбработчиковПриОтправкеДанных);
	ЗначенияОбменов.Добавить(Перечисления.ТипыПроблемОбменаДанными.НепроведенныйДокумент);
	ЗначенияОбменов.Добавить(Перечисления.ТипыПроблемОбменаДанными.НезаполненныеРеквизиты);
	ЗначенияОбменов.Добавить(Перечисления.ТипыПроблемОбменаДанными.ОшибкаВыполненияКодаОбработчиковПриПолученииДанных);
	
	ЗначенияВерсий = Новый Массив;
	Если ОбщегоНазначения.ПодсистемаСуществует("СтандартныеПодсистемы.ВерсионированиеОбъектов") Тогда
		
		МенеджерПеречисления = Перечисления["ТипыВерсийОбъекта"];
		ЗначенияВерсий.Добавить(МенеджерПеречисления.НепринятыеДанныеПоКоллизии);
		ЗначенияВерсий.Добавить(МенеджерПеречисления.ПринятыеДанныеПоКоллизии);
		ЗначенияВерсий.Добавить(МенеджерПеречисления.НепринятыйПоДатеЗапретаОбъектНеСуществуетВБазе);
		ЗначенияВерсий.Добавить(МенеджерПеречисления.НепринятыйПоДатеЗапретаОбъектСуществуетВБазе);
		
	КонецЕсли;
	
	Если КэшЗначений.ОтборТипыПредупреждений.Количество() > 0 Тогда
		
		Для каждого ЭлементМассива Из КэшЗначений.ОтборТипыПредупреждений Цикл
			
			Если ЗначенияОбменов.Найти(ЭлементМассива) <> Неопределено Тогда
				
				ОтборТипыПредупрежденийОбменов.Добавить(ЭлементМассива);
				
			КонецЕсли;
			
			Если ЗначенияВерсий.Найти(ЭлементМассива) <> Неопределено Тогда
				
				ОтборТипыПредупрежденийВерсий.Добавить(ЭлементМассива);
				
			КонецЕсли;
			
		КонецЦикла;
		
	Иначе
		
		ОтборТипыПредупрежденийОбменов = ЗначенияОбменов;
		ОтборТипыПредупрежденийВерсий = ЗначенияВерсий;
		
	КонецЕсли;
	
	ПараметрыУдаления.Вставить("ОтборТипыПредупрежденийОбменов", ОтборТипыПредупрежденийОбменов);
	ПараметрыУдаления.Вставить("ОтборТипыПредупрежденийВерсий", ОтборТипыПредупрежденийВерсий);
	
КонецПроцедуры

&НаСервере
Процедура УдалитьПредупрежденияВДлительнойОперации()
	
	Если ДлительнаяОперация <> Неопределено Тогда
		
		ДлительныеОперации.ОтменитьВыполнениеЗадания(ДлительнаяОперация.ИдентификаторЗадания);
		
	КонецЕсли;
	
	Элементы.СтраницыФормы.ТекущаяСтраница = Элементы.СтраницаДлительнаяОперация;
	
	ПараметрыВыполнения = ДлительныеОперации.ПараметрыВыполненияВФоне(УникальныйИдентификатор);
	ПараметрыВыполнения.НаименованиеФоновогоЗадания = НСтр("ru = 'Удаление предупреждений синхронизации'", ОбщегоНазначения.КодОсновногоЯзыка());
	
	ПараметрыУдаления = Новый Структура;
	ПараметрыУдаления.Вставить("ОтборПоДатеВозникновения", КэшЗначений.ОтборПоДатеВозникновения);
	ПараметрыУдаления.Вставить("ОтборУзловПланаОбмена", КэшЗначений.ОтборУзловПланаОбмена);
	ПараметрыУдаления.Вставить("ТолькоСкрытыеЗаписи", ТолькоСкрытыеЗаписи);
	РазобратьПредупрежденияПоТипам(ПараметрыУдаления);
	
	КоличествоОпераций = ПараметрыУдаления.ОтборТипыПредупрежденийОбменов.Количество() + ПараметрыУдаления.ОтборТипыПредупрежденийВерсий.Количество();
	
	ПараметрыУдаления.Вставить("КоличествоОперацийМаксимум", КоличествоОпераций);
	ПараметрыУдаления.Вставить("КоличествоОперацийТекущийШаг", 0);
	
	ПараметрыМетода = Новый Структура("ПараметрыУдаления", ПараметрыУдаления);
	ДлительнаяОперация = ДлительныеОперации.ВыполнитьВФоне("РегистрыСведений.РезультатыОбменаДанными.ОчиститьПредупрежденияСинхронизации", ПараметрыМетода, ПараметрыВыполнения);
	
	Элементы.ФормаУдалитьПредупреждения.Доступность = Ложь;
	
КонецПроцедуры

#КонецОбласти