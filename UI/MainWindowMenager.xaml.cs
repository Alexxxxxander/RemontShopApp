using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Text;
using LiveCharts;
using LiveCharts.Wpf;
using System.Threading.Tasks;
using System.Timers;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using RemontApp.DB;

namespace RemontApp.UI
{
    /// <summary>
    /// Логика взаимодействия для MainWindowMenager.xaml
    /// </summary>
    public partial class MainWindowMenager : Window
    {
        public class Issues
        {
            public string Type { get; set; }
            public int Count { get; set; }
        }

        private Timer databaseCheckTimer;
        private RemontPracticeEntities context = RemontPracticeEntities.GetContext();


        public MainWindowMenager()
        {
            InitializeComponent();

            LBoxApplications.ItemsSource = RemontPracticeEntities.GetContext().Applications.ToList();

            int completedApplications = RemontPracticeEntities.GetContext().Applications.Where(x => x.DateEnd > DateTime.MinValue).ToList().Count();
            TxtBlockNumApplications.Text += completedApplications;
            var dates = RemontPracticeEntities.GetContext().Applications.Where(x => x.DateEnd > DateTime.MinValue).ToList();
            TimeSpan timeSpan = TimeSpan.Zero;
            foreach (var date in dates)
            {
                timeSpan += (TimeSpan)((DateTime)date.DateEnd - date.DateStart);
            }
            TimeSpan avg = TimeSpan.FromTicks(timeSpan.Ticks / completedApplications);
            TxtBlockAvgTime.Text += avg.Days + " дней, " + avg.Hours + " часов, " + avg.Minutes + " минут.";
            
            List<Issues> issuesList = new List<Issues>();

            var originalIssues = RemontPracticeEntities.GetContext().Applications.ToList();
            foreach (var issue in originalIssues)
            {
                Issues currentIssue = new Issues() { Count = 1, Type = issue.ProblemType.Name };
                if(issuesList.Select(x => x.Type).ToList().Contains(currentIssue.Type)){
                    issuesList.Where(x => x.Type == currentIssue.Type).ToList().First().Count++;
                }
                else
                {
                    issuesList.Add(currentIssue);
                }
            }
            
            lstIssues.ItemsSource = issuesList.OrderByDescending(x => x.Count);

            databaseCheckTimer = new Timer(60000); // 1 минута = 60 000 миллисекунд
            databaseCheckTimer.Elapsed += async (sender, e) => await CheckDatabaseChangesAsync();
            databaseCheckTimer.Start();


        }

        

        private async Task CheckDatabaseChangesAsync()
        {
            try
            {
                using (null)
                {
                    // Ваш запрос для проверки изменений в таблице
                    var changes = DB.RemontPracticeEntities.GetContext().Applications
                        .ToList()
                        .Where(entity => entity.LastModify > DateTime.Now.AddMinutes((double)-1)); // Пример условия изменений за последнюю минуту

                    if (changes.Any())
                    {
                        // Обработка изменений, например, обновление UI
                        Dispatcher.Invoke(() =>
                        {
                            MessageBox.Show($"Изменилась запись");
                            LBoxApplications.ItemsSource = RemontPracticeEntities.GetContext().Applications.ToList();
                        });
                    }
                }
            }
            catch (Exception ex)
            {
                // Обработка ошибок, например, логирование
                Console.WriteLine($"Error checking database changes: {ex.Message}");
            }
            await Task.CompletedTask;
        }




        private void BtnQRCode_Click(object sender, RoutedEventArgs e)
        {

        }

        private void BtnExit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void BtnDeleteApplication_Click(object sender, RoutedEventArgs e)
        {

            DB.Application selected = (sender as Button).DataContext as DB.Application;
            try
            {
                RemontPracticeEntities.GetContext().Applications.Remove(selected);
                RemontPracticeEntities.GetContext().SaveChanges();
                MessageBox.Show("Запись удалена");
                LBoxApplications.ItemsSource = RemontPracticeEntities.GetContext().Applications.ToList();
            }
            catch(Exception ex) {
                MessageBox.Show(ex.Message );
            }


        }

        private void TxtBoxSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            if( TxtBoxSearch.Text.Length > 0 )
            {
                LBoxApplications.ItemsSource = RemontPracticeEntities.GetContext().Applications.ToList().Where(x => x.Appliance.Contains(TxtBoxSearch.Text)).ToList();
            }
            else
            {
                LBoxApplications.ItemsSource = RemontPracticeEntities.GetContext().Applications.ToList() ;
            }

        }

        private void BtnAddAplication_Click(object sender, RoutedEventArgs e)
        {
            AddAplicationWindow addAplicationWindow = new AddAplicationWindow(null);
            addAplicationWindow.Show();
        }

        private void BtnEditApplication_Click(object sender, RoutedEventArgs e)
        {
            AddAplicationWindow addAplicationWindow = new AddAplicationWindow((sender as Button).DataContext as DB.Application);
            addAplicationWindow.Show();
        }
    }
}
