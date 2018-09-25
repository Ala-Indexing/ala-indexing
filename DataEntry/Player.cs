       private void playerToolStripMenuItem_Click(object sender, EventArgs e)
        {
            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Filter = "player.csv | player.csv";
            ofd.ShowDialog();
            if (ofd.FileName.Equals(String.Empty)) return;
            if (!File.Exists(ofd.FileName)) return;
            StreamReader sr = new StreamReader(ofd.FileName);
            sr.ReadLine();
            while (!sr.EndOfStream)
            {
                data.Add(ReadRow(sr));
            }
            sr.Close();
            List<string> thelist = new List<string>();
            thelist.Add("PlayerCode");
            thelist.Add("TeamCode");
            thelist.Add("LastName");
            thelist.Add("FirstName");
            thelist.Add("UniformNumber");
            thelist.Add("Class");
            thelist.Add("Position");
            thelist.Add("Height");
            thelist.Add("Weight");
            thelist.Add("HomeTown");
            thelist.Add("HomeState");
            thelist.Add("HomeCountry");
            thelist.Add("LastSchool");
            foreach (List<string> l in data)
            {
                //MessageBox.Show(thelist.Count + ":" + l.Count);
                StringBuilder sb = new StringBuilder();
                sb.Append("insert into Player(");
                for (int i = 0; i < thelist.Count; i++)
                {
                    sb.Append(thelist[i]);
                    if (i < (thelist.Count - 1)) sb.Append(',');
                }
                sb.Append(") VALUES(");
                for (int i = 0; i < thelist.Count; i++)
                {
                    sb.Append('@').Append(thelist[i]);
                    if (i < (thelist.Count - 1)) sb.Append(',');
                }
                sb.Append(");");
                //MessageBox.Show(sb.ToString());
                SqlCommand sc = new SqlCommand(sb.ToString(), SqlStuff.theConnection);
                for (int i = 0; i < thelist.Count; i++)
                {
                    sc.Parameters.AddWithValue("@" + thelist[i], l[i]);
                }
                sc.ExecuteNonQuery();
            }
        }
