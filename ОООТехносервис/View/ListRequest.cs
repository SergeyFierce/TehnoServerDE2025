using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ОООТехносервис.Classes;

namespace ОООТехносервис.View
{
    public partial class ListRequest : Form
    {
        public ListRequest()
        {
            InitializeComponent();
        }

        public void ShowRequests()
        {
            // Получить из БД все заявки
            List<Model.Request> list = Classes.Helper.DBRequest.Request.ToList();

            //Анализ вошедшей роли
            switch(Helper.userNow.UserRoleID)
            {
                case 1:
                    list = list.Where(r => r.RequestClientID == Helper.userNow.UserID).ToList();
                    buttonAddRequest.Visible = true;
                    buttonReport.Visible = false;
                    buttonEditRequest.Visible = false;
                    break;
                case 2:
                    list = list.Where(r => r.RequestMasterID == Helper.userNow.UserID).ToList();
                    buttonAddRequest.Visible = false;
                    buttonReport.Visible = false;
                    buttonEditRequest.Visible = true;
                    break;
                case 3:
                    buttonAddRequest.Visible = true;
                    buttonReport.Visible = false;
                    buttonEditRequest.Visible = true;
                    break;
                case 4:
                    buttonAddRequest.Visible = false;
                    buttonReport.Visible = true;
                    buttonEditRequest.Visible = false;
                    break;

            }

            ////Фильтрация по заявкам для заказчиика
            //if(Helper.userNow.UserRoleID == 1)
            //{
            //   list = list.Where(r => r.RequestClientID == Helper.userNow.UserID).ToList();

            //}
            ////Фильтрация по заявкам для мастера
            //if (Helper.userNow.UserRoleID == 2)
            //{
            //    list = list.Where(r => r.RequestClientID == Helper.userNow.UserID).ToList();

            //}
            ////Фильтрация по заявкам для оператора
            //if (Helper.userNow.UserRoleID == 3)
            //{
            //    list = list.Where(r => r.RequestClientID == Helper.userNow.UserID).ToList();

            //}
            ////Фильтрация по заявкам для менеджера
            //if (Helper.userNow.UserRoleID == 4)
            //{
            //    list = list.Where(r => r.RequestClientID == Helper.userNow.UserID).ToList();

            //}
            //List<Model.Request> listClient = list.Where(r => r.RequestClientID );
            //Фильтровать по статусу
            int numberStatus = (int)comboBoxStatus.SelectedIndex;
            if (numberStatus > 0 )
            {
                list = list.Where(r => r.RequestStatusID == numberStatus).ToList();
            }
            //Поиск по номеру
            if (textBoxNumber.Text !="")
            {
                list = list.Where(r => r.RequestID.ToString().Contains(textBoxNumber.Text)).ToList();
            }


            this.dataGridViewRequest.Rows.Clear(); // Очистили все строки
            // Цикл по перебору всех заявок
            int i = 0;
            foreach (Model.Request request in list)
            {
                this.dataGridViewRequest.Rows.Add();
                dataGridViewRequest.Rows[i].Cells[0].Value = request.RequestID;
                dataGridViewRequest.Rows[i].Cells[1].Value = request.RequestDate.ToLongDateString();
                dataGridViewRequest.Rows[i].Cells[2].Value = request.Device.DeviceName;
                dataGridViewRequest.Rows[i].Cells[3].Value = request.User.UserFullName;
                dataGridViewRequest.Rows[i].Cells[4].Value = request.Status.StatusName;
                dataGridViewRequest.Rows[i].Cells[5].Value = request.User1.UserFullName;
                dataGridViewRequest.Rows[i].Cells[6].Value = request.Stage.StageName;
                i++;
            }
        }

        private void buttonExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        /// <summary>
        ///  При загрузке окна отобразить список заявок
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void ListRequest_Load(object sender, EventArgs e)
        {
            // Заполнить ComboBox статусами из БД
            List<Model.Status> statuses = Classes.Helper.DBRequest.Status.ToList();
            //Новый статус
            Model.Status status = new Model.Status();
            status.StatusID = 0;
            status.StatusName = "Все статутсы";
            //Добавить новый статус к статусам из БД
            statuses.Insert(0, status);
            //statuses.Add(status);
            comboBoxStatus.DataSource = statuses;
            // Какое поле будет видеть пользователь
            comboBoxStatus.DisplayMember = "StatusName";
            //Получать
            comboBoxStatus.ValueMember = "StatusID";
            comboBoxStatus.SelectedIndex = 0;
            //Отобразить список заявок
            ShowRequests();



            //// Отобразить список заявок в сетке
            //dataGridViewRequest.DataSource = list;
        }

        private void comboBoxStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            ShowRequests();
        }

        /// <summary>
        /// Ввод номера заявки для поиска
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void textBoxNumber_TextChanged(object sender, EventArgs e)
        {
            ShowRequests();
        }

        private void buttonAddRequest_Click(object sender, EventArgs e)
        {
            View.WorkRequest workRequest = new View.WorkRequest(0);
            this.Hide();
            workRequest.ShowDialog();
            this.Show();
        }
        /// <summary>
        /// Редактировать выбранную запись
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void buttonEditRequest_Click(object sender, EventArgs e)
        {
            //Проверили, что есть выбранная строка
            if (dataGridViewRequest.SelectedRows.Count > 0) 
            {
                //Номер выбранной заявки
                int id = (int) dataGridViewRequest.CurrentRow.Cells[0].Value;
                MessageBox.Show("Номер " + dataGridViewRequest.CurrentRow.Cells[0].Value);
                //Открыли окна и передали в него номер выбранной заявки через конструктор
                View.WorkRequest workRequest = new View.WorkRequest(id);
                this.Hide();
                workRequest.ShowDialog();
                this.Show();
            }
            else
            {
                MessageBox.Show("Не выбрана заявка для редактирования");
            }
            
        }

        private void ListRequest_Shown(object sender, EventArgs e)
        {
            ShowRequests();
        }

        private void ListRequest_Activated(object sender, EventArgs e)
        {
            ShowRequests();
        }
    }
}
