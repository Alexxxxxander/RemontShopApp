using RemontApp.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace RemontApp.UI
{
    /// <summary>
    /// Логика взаимодействия для AddAplicationWindow.xaml
    /// </summary>
    public partial class AddAplicationWindow : Window
    {
        private DB.Application _currentApplication = new DB.Application();
        public AddAplicationWindow(DB.Application currentApplication)
        {
            InitializeComponent();
            if (currentApplication != null)
            {
                _currentApplication = currentApplication;
            }
            try
            {
                // Устанавливаем DataContext на сам объект _currentApplication
                DataContext = _currentApplication;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }


            // Заполняем комбо-боксы
            CmbBoxClient.ItemsSource = RemontPracticeEntities.GetContext().Clients.Select(x => x.Phone).ToList();
            CmbBoxExecutor.ItemsSource = RemontPracticeEntities.GetContext().Employees.ToList().Select(x => x.Surname).ToList();
            CmbBoxProblem.ItemsSource = RemontPracticeEntities.GetContext().ProblemTypes.ToList().Select(x => x.Name).ToList();
            CmbBoxStatus.ItemsSource = RemontPracticeEntities.GetContext().StatusApplications.Select(x => x.Name).ToList();

            // Устанавливаем значения в комбо-боксы на основе текущего элемента
            CmbBoxClient.SelectedItem = _currentApplication.Client?.Phone;
            CmbBoxExecutor.SelectedItem = _currentApplication.Employee?.Surname;
            CmbBoxProblem.SelectedItem = _currentApplication.ProblemType?.Name;
            CmbBoxStatus.SelectedItem = _currentApplication.StatusApplication?.Name;


            if (_currentApplication.Id > 0)
            {
                // Здесь можно обработать другие значения
            }
            else
            {
                DatePickTxtBox.Text = DateTime.Now.ToString();
                CmbBoxStatus.SelectedIndex = 0;
            }

        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                // Переносим логику сохранения в метод
                SaveApplication();
                MessageBox.Show("Информация сохранена");
                Close(); // Закрываем окно после сохранения
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        private void SaveApplication()
        {
            // Проверяем, что установлены значения в комбо-боксах
            if (CmbBoxClient.SelectedItem == null || CmbBoxExecutor.SelectedItem == null ||
                CmbBoxProblem.SelectedItem == null || CmbBoxStatus.SelectedItem == null)
            {
                MessageBox.Show("Не все поля заполнены");
                return;
            }

            // Заполняем свойства объекта _currentApplication на основе выбранных значений в комбо-боксах
            _currentApplication.Client = RemontPracticeEntities.GetContext().Clients
                .FirstOrDefault(x => x.Phone == CmbBoxClient.SelectedItem.ToString());

            _currentApplication.Employee = RemontPracticeEntities.GetContext().Employees
                .FirstOrDefault(x => x.Surname == CmbBoxExecutor.SelectedItem.ToString());

            _currentApplication.ProblemType = RemontPracticeEntities.GetContext().ProblemTypes
                .FirstOrDefault(x => x.Name == CmbBoxProblem.SelectedItem.ToString());

            _currentApplication.StatusApplication = RemontPracticeEntities.GetContext().StatusApplications
                .FirstOrDefault(x => x.Name == CmbBoxStatus.SelectedItem.ToString());

            // Дополнительные проверки и установки свойств...

            // Сохраняем изменения в базе данных
            if (_currentApplication.Id == 0)
            {
                RemontPracticeEntities.GetContext().Applications.Add(_currentApplication);
            }

            RemontPracticeEntities.GetContext().SaveChanges();
        }
    }
}

