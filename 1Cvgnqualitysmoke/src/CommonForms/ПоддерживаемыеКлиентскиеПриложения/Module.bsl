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
	
	Если ТипЗнч(Параметры.ПоддерживаемыеКлиенты) = Тип("Структура") Тогда 
		ЗаполнитьЗначенияСвойств(ЭтотОбъект, Параметры.ПоддерживаемыеКлиенты);
	КонецЕсли;
	
	КартинкаДоступна = БиблиотекаКартинок.ВнешняяКомпонентаДоступна;
	КартинкаНеДоступна = БиблиотекаКартинок.ВнешняяКомпонентаНеДоступна;
	
	Элементы.Windows_x86_1СПредприятие.Картинка = ?(Windows_x86, КартинкаДоступна, КартинкаНеДоступна);
	Элементы.Windows_x86_Chrome.Картинка = ?(Windows_x86_Chrome, КартинкаДоступна, КартинкаНеДоступна);
	Элементы.Windows_x86_Firefox.Картинка = ?(Windows_x86_Firefox, КартинкаДоступна, КартинкаНеДоступна);
	Элементы.Windows_x86_MSIE.Картинка = ?(Windows_x86_MSIE, КартинкаДоступна, КартинкаНеДоступна);
	Элементы.Windows_x86_64_1СПредприятие.Картинка = ?(Windows_x86_64, КартинкаДоступна, КартинкаНеДоступна);
	Элементы.Windows_x86_64_Chrome.Картинка = ?(Windows_x86_Chrome, КартинкаДоступна, КартинкаНеДоступна);
	Элементы.Windows_x86_64_Firefox.Картинка = ?(Windows_x86_Firefox, КартинкаДоступна, КартинкаНеДоступна);
	Элементы.Windows_x86_64_MSIE.Картинка = ?(Windows_x86_64_MSIE, КартинкаДоступна, КартинкаНеДоступна);
	Элементы.Linux_x86_1СПредприятие.Картинка = ?(Linux_x86, КартинкаДоступна, КартинкаНеДоступна);
	Элементы.Linux_x86_Chrome.Картинка = ?(Linux_x86_Chrome, КартинкаДоступна, КартинкаНеДоступна);
	Элементы.Linux_x86_Firefox.Картинка = ?(Linux_x86_Firefox, КартинкаДоступна, КартинкаНеДоступна);
	Элементы.Linux_x86_64_1СПредприятие.Картинка = ?(Linux_x86_64, КартинкаДоступна, КартинкаНеДоступна);
	Элементы.Linux_x86_64_Chrome.Картинка = ?(Linux_x86_64_Chrome, КартинкаДоступна, КартинкаНеДоступна);
	Элементы.Linux_x86_64_Firefox.Картинка = ?(Linux_x86_64_Firefox, КартинкаДоступна, КартинкаНеДоступна);
	Элементы.MacOS_x86_64_1СПредприятие.Картинка = ?(MacOS_x86_64, КартинкаДоступна, КартинкаНеДоступна);
	Элементы.MacOS_x86_64_Safari.Картинка = ?(MacOS_x86_64_Safari, КартинкаДоступна, КартинкаНеДоступна);
	Элементы.MacOS_x86_64_Chrome.Картинка = ?(MacOS_x86_64_Chrome, КартинкаДоступна, КартинкаНеДоступна);
	Элементы.MacOS_x86_64_Firefox.Картинка = ?(MacOS_x86_64_Firefox, КартинкаДоступна, КартинкаНеДоступна);
	
КонецПроцедуры

#КонецОбласти