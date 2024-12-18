## Задача 1

>Ответ: при инициализации проекта в файле main.tf были обнаружены две ошибки: не верно указан параметр platform_id и для выбранного platform_id не верно указан параметр cores

![init](task1/init.png)
![error1](task1/error1.png)
![platforms](task1/platforms.png)
![fix1](task1/fix1.png)
![error2](task1/error2.png)
![fix2](task1/fix2.png)

>После устранения ошибок, код запустился успешно. Подключаемся к консоли ВМ через ssh и выполняем команду  curl ifconfig.me

![apply](task1/apply.png)
![curl](task1/curl.png)
![vm](task1/vm.png)

>На скриншотах видно, что вывод команды curl ifconfig.me соответствует назначенному внешнему ip-адресу.

>Параметр preemptible = true позволяет сделать прерываемую ВМ, а параметр core_fraction=5 определяет долю вычислительного времени физических ядер, которую гарантирует vCPU. В данном случае она составит 5%. Установка таких параметров влияет на конечную стоимость ВМ делая ее минимальной.

## Задача 2

>Заменяем все хардкод-значения для ресурсов yandex_compute_image и yandex_compute_instance на отдельные переменные. Объявляем их в файле variables.tf

![var1](task2/var1.png)
![var2](task2/var2.png)

>После вносим необходимые изменения в файл main.tf

![result](task2/result.png)

>Проверяем terraform plan. Изменений нет.

![plan](task2/plan.png)

## Задача 3

>Создаем файл vms_platform.tf. Переносим в него все переменные первой ВМ и добавляем вторую ВМ. Запускаем terraform apply.

![apply](task3/apply.png)

>Смотрим результат выполнения

![vms](task3/vms.png)

## Задача 4

>Объявляем в файле outputs.tf один output , содержащий: instance_name, external_ip, fqdn для каждой из ВМ в удобном формате.(без хардкода!!!). Запускаем terraform apply. Вывод команды terraform output

![outputs](task4/outputs.png)

## Задача 5

>В файле locals.tf описываем в одном local-блоке имя каждой ВМ, используя интерполяцию ${..} с НЕСКОЛЬКИМИ переменными.

![locals1](task5/locals1.png)

>Заменяем переменные внутри ресурса ВМ на созданные нами local-переменные.

![locals2](task5/locals2.png)
![locals3](task5/locals3.png)

>Применяем изменения.

![apply](task5/apply.png)

## Задача 6


