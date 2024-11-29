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
    public partial class WorkRequest : Form
    {

        Model.Request Request; //Глобальная переданная заявка или null для новой заявки
        public WorkRequest()
        {
            InitializeComponent();
        }
        /// <summary>
        /// Конструктор с параметром
        /// </summary>
        /// <param name="id">Номер выбранной заявки</param>
        public WorkRequest(int id)
        {
            InitializeComponent();
            if (id > 0) //Режим редактирования выбранной заявки
            {
                //Получить всю информацию о заявке, номер которой передался в форму
                Request = Helper.DBRequest.Request.Where(r => r.RequestID == id).FirstOrDefault();
            }
            else
            {
                Request = null;
            }

        }

        private void label11_Click(object sender, EventArgs e)
        {

        }

        private void buttonBack_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        /// <summary>
        /// Фиксировать в БД
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void buttonFixed_Click(object sender, EventArgs e)
        {
            //Добавление
            if(Request == null)
            {
                Request = new Model.Request(); //1.
                //2.
                Request.RequestDate = DateTime.Parse(textBoxDate.Text);
                Request.RequestDeviceID = (int)comboBoxEquipment.SelectedValue;
                Request.RequestDefectID = (int)comboBoxProblem.SelectedValue;
                Request.RequestClientID = (int)comboBoxClient.SelectedValue;
                Request.RequestDescription = textBoxDiscription.Text;
                Request.RequestStatusID = (int)comboBoxStatus.SelectedValue;
                Request.RequestMasterID = (int)comboBoxMaster.SelectedValue;
                Request.RequestTime = int.Parse(textBoxTime.Text);
                Request.RequestPrioryID = (int)comboBoxPriory.SelectedValue;
                Request.RequestStageID = (int)comboBoxStage.SelectedValue;
                Request.RequestComment = textBoxComment.Text;
                //3.
                Helper.DBRequest.Request.Add(Request);
                //4.
                try
                {
                    Helper.DBRequest.SaveChanges();
                    MessageBox.Show("Данные успешно добавлены");

                }
                catch (Exception)
                {

                    MessageBox.Show("Данные не добавлены");
                    return;
                }
                this.Close();
            }
            else //Редактирование
            {
                Request.RequestDate = DateTime.Parse(textBoxDate.Text);
                Request.RequestDeviceID = (int)comboBoxEquipment.SelectedValue;
                Request.RequestDefectID = (int)comboBoxProblem.SelectedValue;
                Request.RequestClientID = (int)comboBoxClient.SelectedValue;
                Request.RequestDescription = textBoxDiscription.Text;
                Request.RequestStatusID = (int)comboBoxStatus.SelectedValue;
                Request.RequestMasterID = (int)comboBoxMaster.SelectedValue;
                Request.RequestTime = int.Parse(textBoxTime.Text);
                Request.RequestPrioryID = (int)comboBoxPriory.SelectedValue;
                Request.RequestStageID = (int)comboBoxStage.SelectedValue;
                Request.RequestComment = textBoxComment.Text;
                try
                {
                    Helper.DBRequest.SaveChanges();
                    MessageBox.Show("Данные успешно отредактированны");

                }
                catch (Exception)
                {

                    MessageBox.Show("Данные не отредактированны");
                    return;
                }
                this.Close();
            }
        }

        private void WorkRequest_Load(object sender, EventArgs e)
        {
            //Текущая дата
            textBoxDate.Text = DateTime.Now.ToShortDateString();
            //Настройка всех ComboBox
            comboBoxEquipment.DataSource = Helper.DBRequest.Device.ToList();
            comboBoxEquipment.DisplayMember = "DeviceName";
            comboBoxEquipment.ValueMember = "DeviceID";

            comboBoxProblem.DataSource = Helper.DBRequest.Defect.ToList();
            comboBoxProblem.DisplayMember = "DefectName";
            comboBoxProblem.ValueMember = "DefectID";

            comboBoxClient.DataSource = Helper.DBRequest.User.ToList();
            comboBoxClient.DisplayMember = "UserFullName";
            comboBoxClient.ValueMember = "UserID";

            comboBoxStatus.DataSource = Helper.DBRequest.Status.ToList();
            comboBoxStatus.DisplayMember = "StatusName";
            comboBoxStatus.ValueMember = "StatusID";
            comboBoxStatus.SelectedValue = 1;

            comboBoxMaster.DataSource = Helper.DBRequest.User.Where(u => u.UserRoleID == 2).ToList();
            comboBoxMaster.DisplayMember = "UserFullName";
            comboBoxMaster.ValueMember = "UserID";

            comboBoxPriory.DataSource = Helper.DBRequest.Priory.ToList();
            comboBoxPriory.DisplayMember = "PrioryName";
            comboBoxPriory.ValueMember = "PrioryID";

            comboBoxStage.DataSource = Helper.DBRequest.Stage.ToList();
            comboBoxStage.DisplayMember = "StageName";
            comboBoxStage.ValueMember = "StageID";
            comboBoxStage.SelectedValue = 3;
            //Длительность текущей заявки
            textBoxTime.Text = "0";

            //Для создания новой заявки
            if (Request == null)
            {
                //Заполняем заблокированные элементы значениями по умолчанию
                textBoxDate.Text = DateTime.Now.ToShortDateString();
                comboBoxStatus.SelectedValue = 1;
                comboBoxStage.SelectedValue = 3;
                textBoxTime.Text = "0";
            }
            else //Случай выбранной заявки
            {
                //Заполняем все элеменнты интерфейса
                comboBoxEquipment.SelectedValue = Request.RequestDeviceID;
                comboBoxProblem.SelectedValue = Request.RequestDefectID;
                comboBoxClient.SelectedValue = Request.RequestClientID;
                comboBoxMaster.SelectedValue = Request.RequestMasterID;
                comboBoxPriory.SelectedValue = Request.RequestPrioryID;
                textBoxDate.Text = Request.RequestDate.ToShortDateString();
                comboBoxStatus.SelectedValue = Request.RequestStatusID;
                comboBoxStage.SelectedValue = Request.RequestStageID;
                textBoxTime.Text = Request.RequestTime.ToString();
            }
            //В зависимости от роли пользователя включим элементы интерфейса
            if (Helper.userNow.UserRoleID == 3) //Оператор
            {
                comboBoxMaster.Enabled = true;
                if (Request == null)
                {
                    comboBoxEquipment.Enabled = comboBoxProblem.Enabled = comboBoxClient.Enabled = true;
                    textBoxDiscription.Enabled = comboBoxPriory.Enabled = true;
                }
            }
            if (Helper.userNow.UserRoleID == 2)
            {
                textBoxTime.Enabled = comboBoxStage.Enabled = textBoxComment.Enabled = true;
            }
        }
    }
}
