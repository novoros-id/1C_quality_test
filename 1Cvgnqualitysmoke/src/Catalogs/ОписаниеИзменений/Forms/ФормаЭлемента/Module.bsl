
&НаКлиенте
Процедура КомментарийНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	ОписаниеИзмененийКлиент.ОписаниеИзмененийФормаЭлементаКомментарииНачалоВыбора(ЭтаФорма, Элемент, ДанныеВыбора, СтандартнаяОбработка);
КонецПроцедуры

&НаКлиенте
Процедура ОписаниеСвойствОписаниеНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	СтандартнаяОбработка = Ложь;
	ТекущаяСтрока = Элементы.ОписаниеСвойств.ТекущиеДанные;
	ЗначениеОписания = ТекущаяСтрока.Описание;
	
	ПараметрыВывода = Новый Структура("ПриемникОписания",ЗначениеОписания);
	
	ОткрытьФорму("Справочник.ОписаниеИзменений.Форма.ФормаОписания",ПараметрыВывода,,,,,,РежимОткрытияОкнаФормы.БлокироватьОкноВладельца);

КонецПроцедуры

&НаСервере
Процедура ЗаполнитьОписаниеСвойствНаСервере()
	СправочникОбъект = РеквизитФормыВЗначение("Объект");
	СпрОбъект = ОписаниеСвойствЗаполнение.ЗаполнитьЗначенияСвойствТЧОписаниеСвойств(СправочникОбъект);
	ЗначениеВРеквизитФормы(СпрОбъект,"Объект");
	ЭтотОбъект.Модифицированность = Истина;
КонецПроцедуры

&НаКлиенте
Процедура ЗаполнитьОписаниеСвойств(Команда)
	ЗаполнитьОписаниеСвойствНаСервере();
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	Элементы.ЗаполнитьОписаниеСвойств.Доступность = НЕ Объект.Расширение;
КонецПроцедуры

