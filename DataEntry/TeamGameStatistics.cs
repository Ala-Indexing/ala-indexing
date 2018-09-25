        private void teamGameStatisticsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Filter = "team-game-statistics.csv | team-game-statistics.csv";
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
            thelist.Add("TeamCode");
            thelist.Add("GameCode");
            thelist.Add("RushAtt");
            thelist.Add("RushYard");
            thelist.Add("RushTD");
            thelist.Add("PassAtt");
            thelist.Add("PassComp");
            thelist.Add("PassYard");
            thelist.Add("PassTD");
            thelist.Add("PassInt");
            thelist.Add("PassConv");
            thelist.Add("KickoffRet");
            thelist.Add("KickoffRetYD");
            thelist.Add("KickoffRetTD");
            thelist.Add("PuntRet");
            thelist.Add("PuntRetYard");
            thelist.Add("PuntRetTD");
            thelist.Add("FumRet");
            thelist.Add("FumRetYard");
            thelist.Add("FumRetTD");
            thelist.Add("IntRet");
            thelist.Add("IntRetYard");
            thelist.Add("IntRetTD");
            thelist.Add("MiscRet");
            thelist.Add("MiscRetYard");
            thelist.Add("MiscRetTD");
            thelist.Add("FieldGoalAtt");
            thelist.Add("FieldGoalMade");
            thelist.Add("OffXPKickAtt");
            thelist.Add("OffXPKickMade");
            thelist.Add("Off2XPAtt");
            thelist.Add("Off2XPMade");
            thelist.Add("Def2XPAtt");
            thelist.Add("Def2XPMade");
            thelist.Add("Safety");
            thelist.Add("Points");
            thelist.Add("Punt");
            thelist.Add("PuntYard");
            thelist.Add("Kickoff");
            thelist.Add("KickoffYard");
            thelist.Add("KickoffTouchback");
            thelist.Add("KickoffOutOfBounds");
            thelist.Add("KickoffOnside");
            thelist.Add("Fumble");
            thelist.Add("FumbleLost");
            thelist.Add("TackleSolo");
            thelist.Add("TackleAssist");
            thelist.Add("TackleForLoss");
            thelist.Add("TackleForLossYard");
            thelist.Add("Sack");
            thelist.Add("SackYard");
            thelist.Add("QBHurry");
            thelist.Add("FumbleForced");
            thelist.Add("PassBrokenUp");
            thelist.Add("KickPuntReturned");
            thelist.Add("FirstDownRush");
            thelist.Add("FirstDownPass");
            thelist.Add("FirstDownPenalty");
            thelist.Add("TimeOfPossession");
            thelist.Add("Penalty");
            thelist.Add("PenaltyYard");
            thelist.Add("ThirdDownAtt");
            thelist.Add("ThirdDownConv");
            thelist.Add("FourthDownAtt");
            thelist.Add("FourthDownConv");
            thelist.Add("RedZoneAtt");
            thelist.Add("RedZoneTD");
            thelist.Add("RedZoneFieldGoal");
            foreach (List<string> l in data)
            {
                StringBuilder sb = new StringBuilder();
                sb.Append("insert into TeamGameStatistics(TeamGameStatisticsID,");
                for (int i=0;i<thelist.Count;i++)
                {
                    sb.Append(thelist[i]);
                    if (i < (thelist.Count - 1)) sb.Append(',');
                }
                sb.Append(") VALUES(newid(),");
                for (int i=0;i<thelist.Count;i++)
                {
                    sb.Append('@').Append(thelist[i]);
                    if (i < (thelist.Count - 1)) sb.Append(',');
                }
                sb.Append(");");
                //MessageBox.Show(sb.ToString());
                SqlCommand sc = new SqlCommand(sb.ToString(), SqlStuff.theConnection);
                for (int i=0;i<thelist.Count;i++)
                {
                    sc.Parameters.AddWithValue("@" + thelist[i], l[i]);
                }
                sc.ExecuteNonQuery();
            }
        }
