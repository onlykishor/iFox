SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[autosubjects] ADD  CONSTRAINT [DF_autosubjects_total]  DEFAULT (1) FOR [total]
GO

ALTER TABLE [dbo].[autosubjects] ADD  CONSTRAINT [DF_autosubjects_selected]  DEFAULT (0) FOR [selected]
GO

ALTER TABLE [dbo].[billdetails] ADD  CONSTRAINT [DF_billdetails_referer]  DEFAULT ((0)) FOR [referer]
GO

ALTER TABLE [dbo].[billdetails] ADD  CONSTRAINT [DF_billdetails_billno]  DEFAULT ((0)) FOR [billno]
GO

ALTER TABLE [dbo].[billdetails] ADD  CONSTRAINT [DF_billdetails_productid]  DEFAULT ((0)) FOR [productid]
GO

ALTER TABLE [dbo].[billdetails] ADD  CONSTRAINT [DF_billdetails_qty]  DEFAULT ((0)) FOR [qty]
GO

ALTER TABLE [dbo].[billdetails] ADD  CONSTRAINT [DF_billdetails_rate]  DEFAULT ((0)) FOR [rate]
GO

ALTER TABLE [dbo].[billdetails] ADD  CONSTRAINT [DF_billdetails_total]  DEFAULT ((0)) FOR [total]
GO

ALTER TABLE [dbo].[bills] ADD  CONSTRAINT [DF_bills_name]  DEFAULT ('') FOR [name]
GO

ALTER TABLE [dbo].[bills] ADD  CONSTRAINT [DF_bills_total]  DEFAULT ((0)) FOR [total]
GO

ALTER TABLE [dbo].[bills] ADD  CONSTRAINT [DF_bills_discount]  DEFAULT ((0)) FOR [discount]
GO

ALTER TABLE [dbo].[bills] ADD  CONSTRAINT [DF_bills_amount]  DEFAULT ((0)) FOR [amount]
GO

ALTER TABLE [dbo].[bills] ADD  CONSTRAINT [DF_bills_cons]  DEFAULT ((0)) FOR [cons]
GO

ALTER TABLE [dbo].[feetemp] ADD  CONSTRAINT [DF_feetemp_amount]  DEFAULT (0) FOR [amount]
GO

ALTER TABLE [dbo].[feetemp] ADD  CONSTRAINT [DF_feetemp_checked]  DEFAULT (0) FOR [checked]
GO

ALTER TABLE [dbo].[invoicedetails] ADD  CONSTRAINT [DF_invoicedetails_batchno]  DEFAULT ('') FOR [batchno]
GO

ALTER TABLE [dbo].[invoicedetails] ADD  CONSTRAINT [DF_invoicedetails_qty]  DEFAULT ((0)) FOR [qty]
GO

ALTER TABLE [dbo].[invoicedetails] ADD  CONSTRAINT [DF_invoicedetails_free]  DEFAULT ((0)) FOR [free]
GO

ALTER TABLE [dbo].[invoicedetails] ADD  CONSTRAINT [DF_invoicedetails_rate]  DEFAULT ((0)) FOR [rate]
GO

ALTER TABLE [dbo].[invoicedetails] ADD  CONSTRAINT [DF_invoicedetails_mrp]  DEFAULT ((0)) FOR [mrp]
GO

ALTER TABLE [dbo].[invoicedetails] ADD  CONSTRAINT [DF_invoicedetails_total]  DEFAULT ((0)) FOR [total]
GO

ALTER TABLE [dbo].[invoicedetails] ADD  CONSTRAINT [DF_invoicedetails_sold]  DEFAULT ((0)) FOR [sold]
GO

ALTER TABLE [dbo].[issues] ADD  DEFAULT ((0)) FOR [admno]
GO

ALTER TABLE [dbo].[issues] ADD  DEFAULT ((0)) FOR [card]
GO

ALTER TABLE [dbo].[issues] ADD  DEFAULT ((0)) FOR [bookid]
GO

ALTER TABLE [dbo].[issues] ADD  DEFAULT ((0)) FOR [returned]
GO

ALTER TABLE [dbo].[issues] ADD  DEFAULT ((0)) FOR [fine]
GO

ALTER TABLE [dbo].[products] ADD  CONSTRAINT [DF_products_dropped]  DEFAULT ((0)) FOR [dropped]
GO

ALTER TABLE [dbo].[register] ADD  CONSTRAINT [DF_register_selected]  DEFAULT (0) FOR [selected]
GO

ALTER TABLE [dbo].[register] ADD  CONSTRAINT [DF_register_dueamount]  DEFAULT (0) FOR [dueamount]
GO

ALTER TABLE [dbo].[register] ADD  CONSTRAINT [DF_register_routeid]  DEFAULT (0) FOR [stopid]
GO

ALTER TABLE [dbo].[tc] ADD  CONSTRAINT [DF_tc_father]  DEFAULT ('') FOR [father]
GO

ALTER TABLE [dbo].[tc] ADD  CONSTRAINT [DF_tc_religion]  DEFAULT (' ') FOR [religion]
GO

ALTER TABLE [dbo].[tc] ADD  CONSTRAINT [DF_tc_caste]  DEFAULT ('') FOR [caste]
GO

ALTER TABLE [dbo].[tc] ADD  CONSTRAINT [DF_tc_subcaste]  DEFAULT ('') FOR [subcaste]
GO

ALTER TABLE [dbo].[tc] ADD  CONSTRAINT [DF_tc_leavingclass]  DEFAULT ('') FOR [leavingclass]
GO

ALTER TABLE [dbo].[tc] ADD  CONSTRAINT [DF_tc_subjects]  DEFAULT ('') FOR [subjects]
GO

ALTER TABLE [dbo].[tc] ADD  CONSTRAINT [DF_tc_medium]  DEFAULT ('') FOR [medium]
GO

ALTER TABLE [dbo].[tc] ADD  CONSTRAINT [DF_tc_class]  DEFAULT ('') FOR [class]
GO

ALTER TABLE [dbo].[tc] ADD  CONSTRAINT [DF_tc_leavingreason]  DEFAULT ('') FOR [leavingreason]
GO

ALTER TABLE [dbo].[tc] ADD  CONSTRAINT [DF_tc_idmark1]  DEFAULT ('') FOR [idmark1]
GO

ALTER TABLE [dbo].[tc] ADD  CONSTRAINT [DF_tc_idmark2]  DEFAULT ('') FOR [idmark2]
GO

ALTER TABLE [dbo].[tc] ADD  CONSTRAINT [DF_tc_qualified]  DEFAULT ('') FOR [qualified]
GO


CREATE TRIGGER [dbo].[trUpdMoveSentToOutBox]
ON [dbo].[msgoutbox]
AFTER UPDATE
AS

SET NOCOUNT ON
INSERT INTO
	msgsent
	(msgdate, recipient, message, status, sentdate, retries)
SELECT msgdate, recipient, message, status, getdate(), 1
  FROM inserted
 WHERE status = 'SENT'

DELETE FROM msgoutbox 
 WHERE msgid IN (SELECT msgid 
                   FROM inserted 
                  WHERE status = 'SENT')
GO
