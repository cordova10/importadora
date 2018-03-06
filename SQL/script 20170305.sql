USE [business_db]
GO
/****** Object:  Table [dbo].[adm_usuario]    Script Date: 05/03/2018 21:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_usuario](
	[usr_id] [int] IDENTITY(1,1) NOT NULL,
	[usr_usuario] [varchar](20) NOT NULL,
	[usr_password] [varchar](50) NOT NULL,
	[usr_nombre] [varchar](60) NOT NULL,
	[usr_fecha_tran] [datetime] NOT NULL,
	[usr_usuario_tran] [int] NOT NULL,
	[usr_eliminado] [bit] NOT NULL,
 CONSTRAINT [PK_admin_usuario] PRIMARY KEY CLUSTERED 
(
	[usr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fac_cliente]    Script Date: 05/03/2018 21:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fac_cliente](
	[cli_id] [int] IDENTITY(1,1) NOT NULL,
	[cli_nombres] [varchar](100) NOT NULL,
	[cli_direccion] [varchar](200) NULL,
	[cli_telefono] [varchar](15) NULL,
	[cli_email] [varchar](100) NULL,
	[cli_no_registro] [varchar](10) NULL,
	[cli_tipo_pago] [int] NULL,
	[cli_limite_credito] [decimal](18, 2) NULL,
	[cli_retencion_porcentaje] [decimal](18, 2) NULL,
	[cli_activo] [bit] NOT NULL,
	[cli_fecha_tran] [datetime] NOT NULL,
	[cli_usuario_tran] [int] NOT NULL,
	[cli_eliminado] [int] NOT NULL,
 CONSTRAINT [PK_fac_cliente] PRIMARY KEY CLUSTERED 
(
	[cli_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fac_cxc]    Script Date: 05/03/2018 21:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fac_cxc](
	[cxc_id] [int] IDENTITY(1,1) NOT NULL,
	[cxc_fecha] [date] NULL,
	[cxc_factura] [int] NULL,
	[cxc_cliente] [int] NULL,
	[cxc_monto] [decimal](18, 2) NULL,
	[cxc_dias_credito] [int] NULL,
	[cxc_fecha_trans] [datetime] NULL,
	[cxc_usuario_trans] [int] NULL,
 CONSTRAINT [PK_fac_cuenta_cobrar] PRIMARY KEY CLUSTERED 
(
	[cxc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fac_cxc_detalle]    Script Date: 05/03/2018 21:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fac_cxc_detalle](
	[cde_id] [int] IDENTITY(1,1) NOT NULL,
	[cde_cuenta] [int] NULL,
	[cde_fecha] [date] NULL,
	[cde_abono] [decimal](18, 2) NULL,
	[cde_no_documento] [varchar](10) NULL,
	[cde_fecha_tran] [datetime] NULL,
	[cde_usuario_tran] [int] NULL,
 CONSTRAINT [PK_fac_cxc_detalle] PRIMARY KEY CLUSTERED 
(
	[cde_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fac_factura]    Script Date: 05/03/2018 21:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fac_factura](
	[fac_id] [int] IDENTITY(1,1) NOT NULL,
	[fac_serie] [varchar](10) NOT NULL,
	[fac_tipo_factura] [int] NOT NULL,
	[fac_tipo_pago] [int] NOT NULL,
	[fac_caja] [int] NULL,
	[fac_fecha] [date] NOT NULL,
	[fac_numero] [int] NOT NULL,
	[fac_no_registro] [varchar](10) NULL,
	[fac_id_cliente] [int] NULL,
	[fac_cliente] [varchar](70) NULL,
	[fac_vendedor] [int] NULL,
	[fac_retension] [decimal](18, 4) NULL,
	[fac_monto] [decimal](18, 4) NULL,
	[fac_impuesto] [decimal](18, 4) NULL,
	[fac_total] [decimal](18, 4) NULL,
	[fac_nota] [varchar](70) NULL,
	[fac_usuario_tran] [int] NULL,
	[fac_fecha_tran] [datetime] NULL,
	[fac_eliminado] [bit] NULL,
 CONSTRAINT [PK_fac_factura] PRIMARY KEY CLUSTERED 
(
	[fac_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fac_factura_detalle]    Script Date: 05/03/2018 21:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fac_factura_detalle](
	[fde_id] [int] IDENTITY(1,1) NOT NULL,
	[fde_factura] [int] NULL,
	[fde_producto] [varchar](30) NULL,
	[fde_descripcion] [varchar](70) NULL,
	[fde_cantidad] [int] NULL,
	[fde_unidad_medida] [varchar](10) NULL,
	[fde_precio_unitario] [decimal](18, 2) NULL,
	[fde_descuento_porcen] [decimal](18, 2) NULL,
	[fde_descuento_monto] [decimal](18, 2) NULL,
	[fde_costo] [decimal](18, 2) NULL,
	[fde_usuario_tran] [int] NULL,
	[fde_fecha_tran] [datetime] NULL,
 CONSTRAINT [PK_fac_factura_detalle] PRIMARY KEY CLUSTERED 
(
	[fde_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fac_pedido]    Script Date: 05/03/2018 21:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fac_pedido](
	[ped_id] [int] IDENTITY(1,1) NOT NULL,
	[ped_numero] [int] NOT NULL,
	[ped_fecha] [date] NOT NULL,
	[ped_cliente] [int] NOT NULL,
	[ped_vendedor] [int] NOT NULL,
	[ped_estado] [int] NULL,
	[ped_factura] [int] NULL,
	[ped_eliminado] [bit] NULL,
	[ped_usuario_tran] [int] NULL,
	[ped_fecha_tran] [datetime] NULL,
 CONSTRAINT [PK_fac_pedido] PRIMARY KEY CLUSTERED 
(
	[ped_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fac_pedido_detalle]    Script Date: 05/03/2018 21:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fac_pedido_detalle](
	[pde_id] [int] IDENTITY(1,1) NOT NULL,
	[pde_pedido] [int] NULL,
	[pde_cantidad] [int] NULL,
	[pde_producto] [int] NULL,
	[pde_precio_uni] [decimal](18, 2) NULL,
	[pde_descuento_porcen] [decimal](18, 2) NULL,
	[fde_descuento_monto] [decimal](18, 2) NULL,
	[pde_costo] [decimal](18, 2) NULL,
	[pde_eliminado] [bit] NULL,
	[pde_usuario_tran] [int] NULL,
	[pde_fecha_tran] [datetime] NULL,
 CONSTRAINT [PK_fac_pedido_detalle] PRIMARY KEY CLUSTERED 
(
	[pde_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fac_pedido_estado]    Script Date: 05/03/2018 21:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fac_pedido_estado](
	[pes_id] [int] IDENTITY(1,1) NOT NULL,
	[pes_estado] [varchar](50) NULL,
 CONSTRAINT [PK_fac_pedido_estado] PRIMARY KEY CLUSTERED 
(
	[pes_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fac_precio]    Script Date: 05/03/2018 21:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fac_precio](
	[pre_id] [int] IDENTITY(1,1) NOT NULL,
	[pre_descripcion] [varchar](70) NULL,
	[pre_activo] [bit] NULL,
	[pre_fecha_tran] [datetime] NULL,
	[pre_usuario_tran] [int] NULL,
 CONSTRAINT [PK_fac_precio] PRIMARY KEY CLUSTERED 
(
	[pre_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fac_precio_detalle]    Script Date: 05/03/2018 21:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fac_precio_detalle](
	[pde_id] [int] IDENTITY(1,1) NOT NULL,
	[pde_precio] [int] NULL,
	[pde_producto] [int] NULL,
	[pde_valor] [decimal](18, 2) NULL,
	[pde_activo] [bit] NULL,
	[pde_fecha_tran] [datetime] NULL,
	[pde_usuario_tran] [int] NULL,
 CONSTRAINT [PK_fac_precio_detalle] PRIMARY KEY CLUSTERED 
(
	[pde_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fac_tipo_factura]    Script Date: 05/03/2018 21:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fac_tipo_factura](
	[tfa_id] [int] IDENTITY(1,1) NOT NULL,
	[tfa_tipo_factura] [varchar](50) NOT NULL,
	[tfa_eliminado] [bit] NOT NULL,
	[tfa_usuario_tran] [int] NULL,
	[tfa_fecha_tran] [datetime] NULL,
 CONSTRAINT [PK_fac_tipo_factura] PRIMARY KEY CLUSTERED 
(
	[tfa_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fac_tipo_pago]    Script Date: 05/03/2018 21:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fac_tipo_pago](
	[tpa_id] [int] IDENTITY(1,1) NOT NULL,
	[tpa_tipo_pago] [varchar](50) NOT NULL,
	[tpa_num_dias] [int] NOT NULL,
	[tpa_eliminado] [bit] NOT NULL,
	[tpa_usuario_tran] [int] NULL,
	[tpa_fecha_tran] [datetime] NULL,
 CONSTRAINT [PK_fac_tipo_pago] PRIMARY KEY CLUSTERED 
(
	[tpa_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fac_vendedor]    Script Date: 05/03/2018 21:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fac_vendedor](
	[ven_id] [int] IDENTITY(1,1) NOT NULL,
	[ven_codigo] [varchar](10) NULL,
	[ven_nombre] [varchar](70) NULL,
	[ven_activo] [bit] NULL,
 CONSTRAINT [PK_fac_vendedor] PRIMARY KEY CLUSTERED 
(
	[ven_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[inv_despacho]    Script Date: 05/03/2018 21:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inv_despacho](
	[des_id] [int] IDENTITY(1,1) NOT NULL,
	[des_factura] [int] NOT NULL,
	[des_fecha] [date] NOT NULL,
	[des_cliente] [varchar](70) NOT NULL,
	[des_direccion] [varchar](200) NULL,
	[des_aplicado] [bit] NULL,
	[des_comentario] [varchar](100) NULL,
	[des_fecha_tran] [datetime] NOT NULL,
	[des_usuario_tran] [int] NOT NULL,
	[des_eliminado] [bit] NOT NULL,
 CONSTRAINT [PK_inv_despacho] PRIMARY KEY CLUSTERED 
(
	[des_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[inv_despacho_detalle]    Script Date: 05/03/2018 21:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inv_despacho_detalle](
	[ddt_id] [int] IDENTITY(1,1) NOT NULL,
	[ddt_despacho] [int] NOT NULL,
	[ddt_cantidad] [int] NOT NULL,
	[ddt_producto] [int] NOT NULL,
	[ddt_descripcion] [varchar](70) NULL,
	[ddt_costo] [decimal](18, 2) NULL,
	[ddt_ubicacion] [int] NULL,
	[ddt_fecha_tran] [datetime] NOT NULL,
	[ddt_usuario_tran] [int] NOT NULL,
	[ddt_eliminado] [bit] NOT NULL,
 CONSTRAINT [PK_inv_despacho_detalle] PRIMARY KEY CLUSTERED 
(
	[ddt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[inv_producto]    Script Date: 05/03/2018 21:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inv_producto](
	[pro_id] [int] IDENTITY(1,1) NOT NULL,
	[pro_codigo] [varchar](15) NOT NULL,
	[pro_codigo_bar] [varchar](15) NULL,
	[pro_descripcion] [varchar](70) NULL,
	[pro_unidad_medida] [int] NULL,
	[pro_tipo] [int] NULL,
	[pro_existencia_min] [int] NOT NULL,
	[pro_existencia_max] [int] NOT NULL,
	[pro_proveedor] [int] NULL,
	[pro_activo] [bit] NOT NULL,
	[pro_fecha_tran] [datetime] NOT NULL,
	[pro_usuario_tran] [int] NOT NULL,
	[pro_eliminado] [bit] NOT NULL,
 CONSTRAINT [PK_inv_producto] PRIMARY KEY CLUSTERED 
(
	[pro_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[inv_producto_stock]    Script Date: 05/03/2018 21:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inv_producto_stock](
	[sto_id] [int] IDENTITY(1,1) NOT NULL,
	[sto_cantidad] [int] NOT NULL,
	[sto_producto] [int] NOT NULL,
	[sto_ubicacion] [int] NULL,
	[sto_costo] [decimal](18, 4) NOT NULL,
	[sto_fecha_tran] [datetime] NOT NULL,
	[sto_usuario_tran] [int] NOT NULL,
	[sto_eliminado] [bit] NOT NULL,
 CONSTRAINT [PK_inv_producto_stock] PRIMARY KEY CLUSTERED 
(
	[sto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[inv_producto_tipo]    Script Date: 05/03/2018 21:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inv_producto_tipo](
	[pti_id] [int] IDENTITY(1,1) NOT NULL,
	[pti_descripcion] [varchar](50) NULL,
	[pti_visible] [bit] NULL,
	[pti_fecha_tran] [datetime] NOT NULL,
	[pti_usuario_tran] [int] NOT NULL,
	[pti_eliminado] [bit] NOT NULL,
 CONSTRAINT [PK_inv_producto_tipo] PRIMARY KEY CLUSTERED 
(
	[pti_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[inv_proveedor]    Script Date: 05/03/2018 21:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inv_proveedor](
	[prv_id] [int] IDENTITY(1,1) NOT NULL,
	[prv_nombre] [varchar](70) NOT NULL,
	[prv_direccion] [varchar](200) NULL,
	[prv_telefono] [varchar](15) NULL,
	[prv_fecha_trans] [datetime] NOT NULL,
	[prv_usuario_trans] [int] NOT NULL,
	[prv_eliminado] [bit] NOT NULL,
 CONSTRAINT [PK_inv_proveedor] PRIMARY KEY CLUSTERED 
(
	[prv_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[inv_trans]    Script Date: 05/03/2018 21:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inv_trans](
	[tra_id] [int] IDENTITY(1,1) NOT NULL,
	[tra_fecha] [date] NULL,
	[tra_usuario] [varchar](20) NULL,
	[tra_tipo] [int] NULL,
	[tra_comentario] [varchar](150) NULL,
	[tra_fecha_trans] [datetime] NULL,
	[tra_usuario_trans] [int] NULL,
	[tra_eliminado] [bit] NULL,
 CONSTRAINT [PK_inv_trans] PRIMARY KEY CLUSTERED 
(
	[tra_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[inv_trans_detalle]    Script Date: 05/03/2018 21:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inv_trans_detalle](
	[tde_id] [int] IDENTITY(1,1) NOT NULL,
	[tde_trans] [int] NOT NULL,
	[tde_cantidad] [int] NULL,
	[tde_producto] [int] NULL,
	[tde_descripcion] [varchar](70) NULL,
	[tde_costo] [decimal](18, 4) NULL,
	[tde_ubicacion] [int] NULL,
	[tde_fecha_trans] [datetime] NULL,
	[tde_usuario_trans] [int] NULL,
	[tde_eliminado] [bit] NULL,
 CONSTRAINT [PK_inv_trans_detalle] PRIMARY KEY CLUSTERED 
(
	[tde_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[inv_ubicacion]    Script Date: 05/03/2018 21:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inv_ubicacion](
	[ubi_id] [int] IDENTITY(1,1) NOT NULL,
	[ubi_codigo] [varchar](10) NOT NULL,
	[ubi_descripcion] [varchar](70) NULL,
	[ubi_activo] [bit] NOT NULL,
	[ubi_fecha_tran] [datetime] NOT NULL,
	[ubi_usuario_tran] [int] NOT NULL,
	[ubi_eliminado] [bit] NOT NULL,
 CONSTRAINT [PK_inv_ubicacion] PRIMARY KEY CLUSTERED 
(
	[ubi_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[inv_unidad_medida]    Script Date: 05/03/2018 21:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inv_unidad_medida](
	[uni_id] [int] IDENTITY(1,1) NOT NULL,
	[uni_descripcion] [varchar](50) NULL,
	[uni_fecha_tran] [datetime] NOT NULL,
	[ubi_usuario_tran] [int] NOT NULL,
	[ubi_eliminado] [bit] NOT NULL,
 CONSTRAINT [PK_inv_unidad_medida] PRIMARY KEY CLUSTERED 
(
	[uni_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[adm_usuario] ON 

INSERT [dbo].[adm_usuario] ([usr_id], [usr_usuario], [usr_password], [usr_nombre], [usr_fecha_tran], [usr_usuario_tran], [usr_eliminado]) VALUES (1, N'Christian', N'123456', N'Christian Cordova', CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[adm_usuario] OFF
SET IDENTITY_INSERT [dbo].[fac_pedido] ON 

INSERT [dbo].[fac_pedido] ([ped_id], [ped_numero], [ped_fecha], [ped_cliente], [ped_vendedor], [ped_estado], [ped_factura], [ped_eliminado], [ped_usuario_tran], [ped_fecha_tran]) VALUES (1, 1001, CAST(N'2017-06-01' AS Date), 1, 1, 1, NULL, 0, 1, CAST(N'2017-06-20T00:00:00.000' AS DateTime))
INSERT [dbo].[fac_pedido] ([ped_id], [ped_numero], [ped_fecha], [ped_cliente], [ped_vendedor], [ped_estado], [ped_factura], [ped_eliminado], [ped_usuario_tran], [ped_fecha_tran]) VALUES (2, 1002, CAST(N'2017-06-05' AS Date), 1, 1, 2, NULL, 0, 1, CAST(N'2017-06-20T00:00:00.000' AS DateTime))
INSERT [dbo].[fac_pedido] ([ped_id], [ped_numero], [ped_fecha], [ped_cliente], [ped_vendedor], [ped_estado], [ped_factura], [ped_eliminado], [ped_usuario_tran], [ped_fecha_tran]) VALUES (3, 1003, CAST(N'2017-06-05' AS Date), 1, 1, 3, NULL, 0, 1, CAST(N'2017-06-05T00:00:00.000' AS DateTime))
INSERT [dbo].[fac_pedido] ([ped_id], [ped_numero], [ped_fecha], [ped_cliente], [ped_vendedor], [ped_estado], [ped_factura], [ped_eliminado], [ped_usuario_tran], [ped_fecha_tran]) VALUES (4, 1004, CAST(N'2017-06-05' AS Date), 1, 1, 1, NULL, 0, 1, CAST(N'2017-06-05T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[fac_pedido] OFF
SET IDENTITY_INSERT [dbo].[fac_pedido_detalle] ON 

INSERT [dbo].[fac_pedido_detalle] ([pde_id], [pde_pedido], [pde_cantidad], [pde_producto], [pde_precio_uni], [pde_descuento_porcen], [fde_descuento_monto], [pde_costo], [pde_eliminado], [pde_usuario_tran], [pde_fecha_tran]) VALUES (1, 1, 1, 1, CAST(500.00 AS Decimal(18, 2)), NULL, NULL, NULL, 0, 1, CAST(N'2017-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[fac_pedido_detalle] ([pde_id], [pde_pedido], [pde_cantidad], [pde_producto], [pde_precio_uni], [pde_descuento_porcen], [fde_descuento_monto], [pde_costo], [pde_eliminado], [pde_usuario_tran], [pde_fecha_tran]) VALUES (2, 2, 1, 1, CAST(600.00 AS Decimal(18, 2)), NULL, NULL, NULL, 0, 1, CAST(N'2017-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[fac_pedido_detalle] ([pde_id], [pde_pedido], [pde_cantidad], [pde_producto], [pde_precio_uni], [pde_descuento_porcen], [fde_descuento_monto], [pde_costo], [pde_eliminado], [pde_usuario_tran], [pde_fecha_tran]) VALUES (3, 3, 2, 1, CAST(350.00 AS Decimal(18, 2)), NULL, NULL, NULL, 0, 1, CAST(N'2017-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[fac_pedido_detalle] ([pde_id], [pde_pedido], [pde_cantidad], [pde_producto], [pde_precio_uni], [pde_descuento_porcen], [fde_descuento_monto], [pde_costo], [pde_eliminado], [pde_usuario_tran], [pde_fecha_tran]) VALUES (4, 4, 1, 1, CAST(100.00 AS Decimal(18, 2)), NULL, NULL, NULL, 0, 1, CAST(N'2017-06-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[fac_pedido_detalle] OFF
SET IDENTITY_INSERT [dbo].[fac_pedido_estado] ON 

INSERT [dbo].[fac_pedido_estado] ([pes_id], [pes_estado]) VALUES (1, N'Analisis')
INSERT [dbo].[fac_pedido_estado] ([pes_id], [pes_estado]) VALUES (2, N'Aprobado')
INSERT [dbo].[fac_pedido_estado] ([pes_id], [pes_estado]) VALUES (3, N'Rechazado')
SET IDENTITY_INSERT [dbo].[fac_pedido_estado] OFF
SET IDENTITY_INSERT [dbo].[fac_tipo_factura] ON 

INSERT [dbo].[fac_tipo_factura] ([tfa_id], [tfa_tipo_factura], [tfa_eliminado], [tfa_usuario_tran], [tfa_fecha_tran]) VALUES (1, N'Consumidor Final', 0, NULL, NULL)
INSERT [dbo].[fac_tipo_factura] ([tfa_id], [tfa_tipo_factura], [tfa_eliminado], [tfa_usuario_tran], [tfa_fecha_tran]) VALUES (2, N'Credito Fiscal', 0, NULL, NULL)
INSERT [dbo].[fac_tipo_factura] ([tfa_id], [tfa_tipo_factura], [tfa_eliminado], [tfa_usuario_tran], [tfa_fecha_tran]) VALUES (3, N'Ticket', 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[fac_tipo_factura] OFF
SET IDENTITY_INSERT [dbo].[fac_tipo_pago] ON 

INSERT [dbo].[fac_tipo_pago] ([tpa_id], [tpa_tipo_pago], [tpa_num_dias], [tpa_eliminado], [tpa_usuario_tran], [tpa_fecha_tran]) VALUES (1, N'Contado', 0, 0, NULL, NULL)
INSERT [dbo].[fac_tipo_pago] ([tpa_id], [tpa_tipo_pago], [tpa_num_dias], [tpa_eliminado], [tpa_usuario_tran], [tpa_fecha_tran]) VALUES (2, N'Credito 30 Dias', 30, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[fac_tipo_pago] OFF
SET IDENTITY_INSERT [dbo].[fac_vendedor] ON 

INSERT [dbo].[fac_vendedor] ([ven_id], [ven_codigo], [ven_nombre], [ven_activo]) VALUES (1, N'V001', N'William Perez', NULL)
SET IDENTITY_INSERT [dbo].[fac_vendedor] OFF
SET IDENTITY_INSERT [dbo].[inv_producto] ON 

INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (86, N'767101010320   ', N'767101010320   ', N'GUANTE DE HULE L', 1, 1, 144, 1440, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (87, N'767101010221   ', N'767101010221   ', N'GUANTE DE HULE M', 1, 1, 144, 1440, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (88, N'767101010122   ', N'767101010122   ', N'GUANTE DE HULE S', 1, 1, 144, 1440, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (89, N'767101020428   ', N'767101020428   ', N'GUANTE DE HULE XL', 1, 1, 144, 1440, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (90, N'767101030328   ', N'767101030328   ', N'GUANTE NEOPRENO L', 1, 1, 144, 1440, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (91, N'767101030229   ', N'767101030229   ', N'GUANTE NEOPRENO M', 1, 1, 144, 1440, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (92, N'767101030120   ', N'767101030120   ', N'GUANTE NEOPRENO S', 1, 1, 144, 1440, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (93, N'767101030427   ', N'767101030427   ', N'GUENTE NEOPRENO XL', 1, 1, 144, 1440, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (94, N'6260009100417  ', N'6260009100417  ', N'GUANTE INDUSTRIAL HAWBASH', 1, 1, 100, 1440, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (95, N'5180001180453  ', N'5180001180453  ', N'GUANTE DE CUERO', 1, 1, 144, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (96, N'7419900900908  ', N'7419900900908  ', N'ESCOBA METALICA', 1, 1, 200, 4000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (97, N'7453662855212  ', N'7453662855212  ', N'RASTRILLO PLASTICO PEQUEÑO', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (98, N'6957115550088  ', N'6957115550088  ', N'CEPILLO P/ INODORO 5008', 1, 1, 100, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (99, N'6934560127362  ', N'6934560127362  ', N'MASCON EN RED', 1, 1, 400, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (100, N'6932456806339  ', N'6932456806339  ', N'MASCON CUADRADO BJL04-35', 1, 1, 400, 1200, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (101, N'6935685436582  ', N'6935685436582  ', N'MASCON EN RED ALAMBRE', 1, 1, 800, 5000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (102, N'7419900902087  ', N'7419900902087  ', N'PITON P/ MANGUERA PLASTICO ', 1, 1, 100, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (103, N'7419900902100  ', N'7419900902100  ', N'PITON PISTOLA METALICO', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (104, N'7419900902094  ', N'7419900902094  ', N'PITON PISTOLA PLASTICO', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (105, N'7419900902292  ', N'7419900902292  ', N'SURTIDOR P/ MANGUERA', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (106, N'2319372197651  ', N'2319372197651  ', N'SURTIDOR DE FUENTE', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (107, N'7419900903336  ', N'7419900903336  ', N'GANCHO PARA HAMACA PAR', 1, 1, 50, 100, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (108, N'00-90508983219', N'00-90508983219', N'DESARMADORES 14338-2', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (109, N'7419900903367  ', N'7419900903367  ', N'REGLETA MULTIUSO', 1, 1, 200, 1200, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (110, N'7406145001903  ', N'7406145001903  ', N'VENTOSA ROJA PEQUEÑA', 1, 1, 100, 600, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (111, N'7406145001897  ', N'7406145001897  ', N'VENTOSA ROJA GRANDE', 1, 1, 100, 600, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (112, N'7419900901783  ', N'7419900901783  ', N'VENTOSA NEGRA GRANDE', 1, 1, 100, 600, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (113, N'7419900901790  ', N'7419900901790  ', N'VENTOSA P/ INODORO NEGRA PEQUEÑA', 1, 1, 100, 600, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (114, N'7419900903633  ', N'7419900903633  ', N'LAZO NYLON # 5', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (115, N'7419900903640  ', N'7419900903640  ', N'LAZO NYLON # 6', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (116, N'7419900903657  ', N'7419900903657  ', N'LAZO NYLON # 8', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (117, N'7419900900977  ', N'7419900900977  ', N'CORDEL NYLON DELGADO', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (118, N'7419900900984  ', N'7419900900984  ', N'CORDEL NYLON GRUESO', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (119, N'4605885695165  ', N'4605885695165  ', N'SET DE AVIONES', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (120, N'6903282204484  ', N'6903282204484  ', N'JEEP 10789', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (121, N'6333201301213  ', N'6333201301213  ', N'SET DE MINI SERIE 399-198SA', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (122, N'6333201303217  ', N'6333201303217  ', N'SET DE MINI SERIE 399-130SA', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (123, N'6333201301237  ', N'6333201301237  ', N'SET DE MINI SERIE 399-158HA', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (124, N'6333201525885  ', N'6333201525885  ', N'SET DE CARROS', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (125, N'6333201301220  ', N'6333201301220  ', N'SET DE CARROS', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (126, N'2014085525257  ', N'2014085525257  ', N'TRAILER 336-2', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (127, N'1234567890234  ', N'1234567890234  ', N'CARRITO N°005', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (128, N'1230932895552  ', N'1230932895552  ', N'FURGONSITO 6668', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (129, N'1236654455562  ', N'1236654455562  ', N'CARRO 737-6668', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (130, N'1966222133003  ', N'1966222133003  ', N'CARRITO 1994', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (131, N'9620010236339  ', N'9620010236339  ', N'CARRITO', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (132, N'8599920155553  ', N'8599920155553  ', N'CARRO 12360', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (133, N'2009121000379  ', N'2009121000379  ', N'CARRO 20768', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (134, N'2014081640039  ', N'2014081640039  ', N'CARRO HD26075', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (135, N'2014081640091  ', N'2014081640091  ', N'CARRO HD26074', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (136, N'6956931012008  ', N'6956931012008  ', N'CARRO 1168-1', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (137, N'2013150131317  ', N'2013150131317  ', N'CARTON DE CARRO 15013', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (138, N'9453469825768  ', N'9453469825768  ', N'SET DE TRACTOR 001', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (139, N'3307542000138  ', N'3307542000138  ', N'SET DE MUÑEQUITA 301D', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (140, N'6950568531468  ', N'6950568531468  ', N'PELOTA ESPONJA BALL5', 1, 1, 300, 3000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (141, N'6635778000675  ', N'6635778000675  ', N'MUÑEQUTA FASHION GIRL', 1, 1, 300, 3000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (142, N'6894524591571  ', N'6894524591571  ', N'MUÑECA CON VESTIDO 10944F-1', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (143, N'761442531003   ', N'761442531003   ', N'MUÑECA YY13C', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (144, N'6000869490039  ', N'6000869490039  ', N'MUÑECA  118A-7', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (145, N'6956591300583  ', N'6956591300583  ', N'MUÑECA 652', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (146, N'6952344524459  ', N'6952344524459  ', N'MUÑECA 3088B', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (147, N'60056993465    ', N'60056993465    ', N'MUÑECA 555', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (148, N'6942936100796  ', N'6942936100796  ', N'MUÑECA SURTIDA', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (149, N'6914606010490  ', N'6914606010490  ', N'MUÑEQUITA FROZEN', 1, 1, 300, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (150, N'8528205610012  ', N'8528205610012  ', N'LENTES ACUATICOS 8801', 1, 1, 300, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (151, N'6920000048007  ', N'6920000048007  ', N'TROMPETA 2008-2', 1, 1, 300, 3000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (152, N'5201558800011  ', N'5201558800011  ', N'ROMPECABEZA B65', 1, 1, 300, 3000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (153, N'6985575236358  ', N'6985575236358  ', N'PANDERETA MEDIA LUNA', 1, 1, 300, 3000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (154, N'6985575236365  ', N'6985575236365  ', N'PANDERETA 668', 1, 1, 300, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (155, N'6985575236372  ', N'6985575236372  ', N'PANDERETA 606-2', 1, 1, 300, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (156, N'6983456789122  ', N'6983456789122  ', N'TAMBOR 733A9', 1, 1, 300, 3000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (157, N'6906456496067  ', N'6906456496067  ', N'BRASIER HAWAIANO YJ-02', 1, 1, 100, 600, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (158, N'6906456496104  ', N'6906456496104  ', N'FALDA HAWAIANA YJ-11', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (159, N'2012182970758  ', N'2012182970758  ', N'ANTIFAZ BR078', 1, 1, 300, 3000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (160, N'6906456496029  ', N'6906456496029  ', N'COLLAR HAWAIANO', 1, 1, 300, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (161, N'6906456495135  ', N'6906456495135  ', N'PORRAS', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (162, N'6941100025101  ', N'6941100025101  ', N'SOMBREROS 2515/2510', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (163, N'6941100025224  ', N'6941100025224  ', N'SOMBREROS 2522/2253', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (164, N'4710955672318  ', N'4710955672318  ', N'SOMBREROS DE COLORES', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (165, N'7419900902926  ', N'7419900902926  ', N'PECHERAS 13103-02', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (166, N'8809029391517  ', N'8809029391517  ', N'PECHERAS 13103-04', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (167, N'7419900901356  ', N'7419900901356  ', N'CADENA P/ PERRO 2.0 X 48', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (168, N'7419900901363  ', N'7419900901363  ', N'CADENA P/ PERRO 2.5 X 48', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (169, N'7419900901370  ', N'7419900901370  ', N'CADENA P/ PERRO 3.0 X 48', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (170, N'7419900901387  ', N'7419900901387  ', N'CADENA P/ PERRO 3.5 X 48', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (171, N'5992811550124  ', N'5992811550124  ', N'BILLETERA P/ CABALLERO', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (172, N'7296030022164  ', N'7296030022164  ', N'BILLETERA P/ DAMA', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (173, N'6927384990090  ', N'6927384990090  ', N'RASPADOR DE QUESO', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (174, N'6925874853900  ', N'6925874853900  ', N'SET DE MOLDE P/ PALETA', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (175, N'6925874858523  ', N'6925874858523  ', N'SET DE MOLDE P/ PALETA 5852', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (176, N'6923953698930  ', N'6923953698930  ', N'MAGNETICOS P/ REFRIGUERADOR', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (177, N'7419900902902  ', N'7419900902902  ', N'SALERITOS DE VIDRIO', 1, 1, 300, 3000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (178, N'8429283260581  ', N'8429283260581  ', N'COLADOR METALICO TL22', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (179, N'4000576487898  ', N'4000576487898  ', N'SET DE COMIDERAS BW-5', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (180, N'6916898789801  ', N'6916898789801  ', N'EXPRIMIDOR DE LIMON 0839', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (181, N'6931693221516  ', N'6931693221516  ', N'VASO EXPRIMIDRO DE NARANJA 215-1', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (182, N'6901301002004  ', N'6901301002004  ', N'BATIDOR MANUAL 100205', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (183, N'5707283110000  ', N'5707283110000  ', N'TIJERA N°8', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (184, N'6635778000668  ', N'6635778000668  ', N'TIJERA P/ COCINA', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
GO
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (185, N'6922200690109  ', N'6922200690109  ', N'TIJERA 9010D', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (186, N'6908790048407  ', N'6908790048407  ', N'TIJERA 9009D', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (187, N'6922200690086  ', N'6922200690086  ', N'TIJERA 9008D', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (188, N'2901110106812  ', N'2901110106812  ', N'CORTA HUEVO N6028', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (189, N'6097228138886  ', N'6097228138886  ', N'CUCHILLO DE SIERRA', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (190, N'6982295692730  ', N'6982295692730  ', N'UTENSILIOS P/ COCINA', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (191, N'6925461720738  ', N'6925461720738  ', N'CUCHARON ESCURRIDOR LS-16', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (192, N'8420116000602  ', N'8420116000602  ', N'CUCHARON P/ SORBETE 0939', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (193, N'0-350000000194', N'0-350000000194', N'ESPATULA MSR-2010', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (194, N'6938546245811  ', N'6938546245811  ', N'ESPATULA 1001-1', 1, 1, 500, 4000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (195, N'6930548013528  ', N'6930548013528  ', N'PORTA CUCHARA N°108', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (196, N'6938546245989  ', N'6938546245989  ', N'CUCHARA PEQUEÑA', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (197, N'6920110417113  ', N'6920110417113  ', N'CUCHARA COQUERA', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (198, N'7296051093853  ', N'7296051093853  ', N'TENAZA DUO 2912', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (199, N'6935898072492  ', N'6935898072492  ', N'PORTACALIENTE 807110', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (200, N'6936069521221  ', N'6936069521221  ', N'PORTACALIENTE 2 PCS', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (201, N'7502218671209  ', N'7502218671209  ', N'SET DE COLADORES BR1209', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (202, N'7419900900458  ', N'7419900900458  ', N'PELADOR DE VERDURAS 777', 1, 1, 1000, 5000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (203, N'7419900900854  ', N'7419900900854  ', N'DESTAPADOR DE GASEOSA', 1, 1, 1000, 6000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (204, N'6941934406497  ', N'6941934406497  ', N'SET DE MATAMOSCA', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (205, N'6959223512361  ', N'6959223512361  ', N'JARRA EN CAJA', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (206, N'7419900901318  ', N'7419900901318  ', N'ATOMIZADOR DE 1 LITRO', 1, 1, 300, 3000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (207, N'7419900903329  ', N'7419900903329  ', N'ATOMIZADOR DE 1/2 LITRO', 1, 1, 500, 6000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (208, N'0-58445159005', N'0-58445159005', N'PICHEL OM209-1', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (209, N'6920000111862  ', N'6920000111862  ', N'PICHEL 202', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (210, N'8430852595720  ', N'8430852595720  ', N'SET DE VASO TEQUILERO YJ6128', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (211, N'6985754254586  ', N'6985754254586  ', N'SET DE TAZA CON PAILA', 1, 1, 100, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (212, N'6635778000682  ', N'6635778000682  ', N'TAZA MELAMINA 4-01', 1, 1, 200, 3000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (213, N'6985698713705  ', N'6985698713705  ', N'TAZA DE CERAMICA', 1, 1, 300, 3000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (214, N'6985698713613  ', N'6985698713613  ', N'TAZA LSK-6', 1, 1, 300, 3000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (215, N'1381562507800  ', N'1381562507800  ', N'TAZON 8181', 1, 1, 300, 3000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (216, N'6224310040677  ', N'6224310040677  ', N'SET DE CRISTALERIA', 1, 1, 300, 3000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (217, N'6949161264927  ', N'6949161264927  ', N'SET DE COPAS TL12', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (218, N'4012013082016  ', N'4012013082016  ', N'SET DE VASO 107', 1, 1, 100, 6000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (219, N'6635778000613  ', N'6635778000613  ', N'VASO MELAMINA 4-05', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (220, N'6947731711284  ', N'6947731711284  ', N'VASO PLASTICO 1128', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (221, N'7419900900021  ', N'7419900900021  ', N'VASO DC556', 1, 1, 300, 6000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (222, N'6930697720186  ', N'6930697720186  ', N'VASO 1072', 1, 1, 300, 6000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (223, N'6925874850466  ', N'6925874850466  ', N'VASO ACRILICO DE COLORES', 1, 1, 300, 6000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (224, N'8718158140425  ', N'8718158140425  ', N'VASO ACRILICO TRANSPARENTE', 1, 1, 300, 6000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (225, N'7419900900212  ', N'7419900900212  ', N'PLATO DE CHINA XX-02', 1, 1, 100, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (226, N'6635778000699  ', N'6635778000699  ', N'PLATO MELAMINA 2-31', 1, 1, 500, 6000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (227, N'7419900902933  ', N'7419900902933  ', N'PLATO MELAMINA 1-20', 1, 1, 500, 6000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (228, N'3501110368624  ', N'3501110368624  ', N'PLATO HONSO MELAMINA TAZ-9', 1, 1, 300, 3000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (229, N'7419900902261  ', N'7419900902261  ', N'PLATO MELAMINA 2-29', 1, 1, 300, 3000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (230, N'7419900900045  ', N'7419900900045  ', N'PLATO MELAMNA 1105', 1, 1, 300, 3000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (231, N'9414740040430  ', N'9414740040430  ', N'PLATO YX-03', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (232, N'2005898612029  ', N'2005898612029  ', N'MANTEQUILLERA GRANDE', 1, 1, 100, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (233, N'6985475150075  ', N'6985475150075  ', N'AZAFATE 2016', 1, 1, 100, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (234, N'1381562510954  ', N'1381562510954  ', N'ENSALADERA 1095', 1, 1, 100, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (235, N'6930469630128  ', N'6930469630128  ', N'ENSALADERA RF1884', 1, 1, 100, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (236, N'2360000087998  ', N'2360000087998  ', N'ENSALADERA GRANDE RF-0012', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (237, N'7419900902049  ', N'7419900902049  ', N'ENSALADERA 3011', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (238, N'7419900900564  ', N'7419900900564  ', N'PANERA REDONDA 319', 1, 1, 100, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (239, N'7419900901516  ', N'7419900901516  ', N'PANERA OVALADA 318', 1, 1, 100, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (240, N'6931048732568  ', N'6931048732568  ', N'HIELERA 256', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (241, N'6002521075837  ', N'6002521075837  ', N'PRENSA ROPA 620', 1, 1, 500, 6000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (242, N'6927624239859  ', N'6927624239859  ', N'PASTE BA-03', 1, 1, 50, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (243, N'6971028908958  ', N'6971028908958  ', N'ALMOHADITA DX-01', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (244, N'6920000111930  ', N'6920000111930  ', N'JABONERA JY2068', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (245, N'6934567867742  ', N'6934567867742  ', N'JABONERA XTB-5568', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (246, N'6930984901175  ', N'6930984901175  ', N'CEPILLO P/ DIENTE DE NIN@', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (247, N'74119900902544 ', N'74119900902544 ', N'LLAVEROS SURTIDO', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (248, N'7419900902605  ', N'7419900902605  ', N'LLAVERO CINTA METRICA', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (249, N'6925781254128  ', N'6925781254128  ', N'NAIPE KK-01', 1, 1, 100, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (250, N'0-420050113480', N'0-420050113480', N'NAIPE ', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (251, N'129    ', N'129    ', N'CAJA DE CHIBOLA CORRIENTE', 2, 1, 2, 5, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (252, N'130    ', N'130    ', N'CHIBOLA MARMOL', 2, 1, 2, 5, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (253, N'131    ', N'131    ', N'CHIROLON', 2, 1, 2, 5, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (254, N'7419900900328  ', N'7419900900328  ', N'MAIZ POP CORN', 1, 1, 1000, 8000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (255, N'7419900902377  ', N'7419900902377  ', N'CORTACUTICULA', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (256, N'7419900902322  ', N'7419900902322  ', N'CORTAUÑAS CURVO P/ PIE', 1, 1, 300, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (257, N'7419900900991  ', N'7419900900991  ', N'CORTAUÑAS DECORADO GRANDE', 1, 1, 300, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (258, N'7419900901004  ', N'7419900901004  ', N'CORTAUÑAS DECORADO PEQUEÑO', 1, 1, 300, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (259, N'7419900901912  ', N'7419900901912  ', N'CORTAUÑA NIQUELADO BELL DE BOLSILLO', 1, 1, 300, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (260, N'7419900901011  ', N'7419900901011  ', N'CORTAUÑA GRANDE P/ PIE', 1, 1, 300, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (261, N'7419900900892  ', N'7419900900892  ', N'ENCENDEDOR DESECHABLE', 1, 1, 2000, 8000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (262, N'7419900902995  ', N'7419900902995  ', N'ESPEJO METALICO DSM-30', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (263, N'7419900903015  ', N'7419900903015  ', N'ESPEJO DSM-20', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (264, N'7419900901868  ', N'7419900901868  ', N'GANCHO SANDINO', 1, 1, 1000, 8000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (265, N'7419900901882  ', N'7419900901882  ', N'LIJA P/ PIE', 1, 1, 100, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (266, N'7419900902438  ', N'7419900902438  ', N'LIJA P/ PIE PH1', 1, 1, 100, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (267, N'7419900902445  ', N'7419900902445  ', N'LIJA P/ PIE PH8', 1, 1, 100, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (268, N'7419900902452  ', N'7419900902452  ', N'LIJA P/ PIE PH9', 1, 1, 100, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (269, N'7419900902469  ', N'7419900902469  ', N'LIJA P/ PIE PH10', 1, 1, 100, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (270, N'7419900902476  ', N'7419900902476  ', N'LIJA P/ PIE PH11', 1, 1, 100, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (271, N'7419900902483  ', N'7419900902483  ', N'LIJA P/ PIE PH12', 1, 1, 100, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (272, N'7419900902605  ', N'7419900902605  ', N'LIMA DE CARTON P/ UÑAS', 1, 1, 100, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (273, N'7419900900304  ', N'7419900900304  ', N'LIMA METALICA P/ UÑAS', 1, 1, 100, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (274, N'7419900902537  ', N'7419900902537  ', N'LIMA DE METAL P/ UÑAS # S413', 1, 1, 100, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (275, N'7419900902544  ', N'7419900902544  ', N'LIMA DE METAL P/ UÑAS # S416', 1, 1, 100, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (276, N'7419900902551  ', N'7419900902551  ', N'LIMA DE METAL P/ UÑAS # S417', 1, 1, 100, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (277, N'7419900902568  ', N'7419900902568  ', N'LIMA DE METAL P/ UÑAS # S418', 1, 1, 100, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (278, N'7419900900397  ', N'7419900900397  ', N'NAIPE TIPO AMERICANO', 1, 1, 100, 3000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (279, N'7419900900441  ', N'7419900900441  ', N'PEINE RECTO GRANDE', 1, 1, 50, 500, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (280, N'7419900902520  ', N'7419900902520  ', N'PIEDRA POME C/ CEPILLO PH3', 1, 1, 50, 500, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (281, N'7419900902513  ', N'7419900902513  ', N'PIEDRA POME P/ PIE PH2', 1, 1, 50, 500, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (282, N'7419900900489  ', N'7419900900489  ', N'PINZA DE PRECION P/ CEJA', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (283, N'7419900900496  ', N'7419900900496  ', N'PINZA DE TIJERITA P/ CEJA', 1, 1, 50, 50, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (284, N'7419900902506  ', N'7419900902506  ', N'PINZA DE TIJERITA P/ CEJA # 504', 1, 1, 50, 50, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
GO
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (285, N'7419900902490  ', N'7419900902490  ', N'PINZA DE TIJERITA P/ CEJA # 505', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (286, N'7419900900632  ', N'7419900900632  ', N'RIZADOR DE PESTAÑAS', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (287, N'7419900902858  ', N'7419900902858  ', N'SET DE CORTAUÑAS, PINZA,LIMA, X5 # G-2', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (288, N'7419900902889  ', N'7419900902889  ', N'SET DE CORTAUÑAS, PINZA,LIMA, X4 # G-4', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (289, N'4894095210217  ', N'4894095210217  ', N'SET DE GORROS P/ BAÑO 8 PZAS', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (290, N'7419900901189  ', N'7419900901189  ', N'ABRELATA DE MARIPOSA 777', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (291, N'7419900901066  ', N'7419900901066  ', N'CUCHARA PEQUEÑA P/ AZUCAR', 1, 1, 1000, 8000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (292, N'7419900901073  ', N'7419900901073  ', N'CUCHARA SOPERA', 1, 1, 1000, 8000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (293, N'7419900901134  ', N'7419900901134  ', N'CUCHILLO P/ COCINA # 4', 1, 1, 1000, 8000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (294, N'7419900900540  ', N'7419900900540  ', N'RASPADOR DE QUESO', 1, 1, 1000, 8000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (295, N'7419900901646  ', N'7419900901646  ', N'TENEDOR', 1, 1, 1000, 8000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (296, N'7419900903190  ', N'7419900903190  ', N'TOSTADORA MEDIANA DE TORTILLAS', 1, 1, 300, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (297, N'7419900900465  ', N'7419900900465  ', N'PICAHIELO CORRIENTE', 1, 1, 500, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (298, N'7419900902063  ', N'7419900902063  ', N'CEPILLO P/ PILA GRANDE', 1, 1, 120, 1200, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (299, N'7419900902070  ', N'7419900902070  ', N'CEPILLO P/ PILA MEDIANO', 1, 1, 120, 1200, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (300, N'7419900900236  ', N'7419900900236  ', N'GUANTE P/ JARDIN', 1, 1, 120, 1200, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (301, N'7419900900588  ', N'7419900900588  ', N'RATONERA DE MADERA GRANDE', 1, 1, 100, 500, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (302, N'7419900900564  ', N'7419900900564  ', N'RATONERA DE METAL GRANDE', 1, 1, 500, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (303, N'2319372198153  ', N'2319372198153  ', N'RATONERA DE MADERA PEQUEÑA', 1, 1, 100, 500, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (304, N'7419900900571  ', N'7419900900571  ', N'RATONERA DE METAL PEQUEÑA', 1, 1, 500, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (305, N'7419900901516  ', N'7419900901516  ', N'CEPILLO P/ ZAPATO ROJO GRANDE', 1, 1, 500, 3000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (306, N'7419900901523  ', N'7419900901523  ', N'CEPILLO P/ ZAPATO ROJO PEQUEÑO', 1, 1, 500, 3000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (307, N'7419900900939  ', N'7419900900939  ', N'COLLAR P/ PERRO 2.5 X 16', 1, 1, 50, 100, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (308, N'7419900900953  ', N'7419900900953  ', N'COLLAR P/ PERRO 3.5 X 16', 1, 1, 50, 100, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (309, N'7419900900960  ', N'7419900900960  ', N'COLLAR P/ PERRO 3.5 X 26', 1, 1, 50, 100, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (310, N'2319372216130  ', N'2319372216130  ', N'ASIENTO PLASTICO P/ INODORO', 1, 1, 100, 500, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (311, N'2319372198160  ', N'2319372198160  ', N'CINTA METRICA DE 3 METROS INDEX', 1, 1, 100, 500, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (312, N'7453010015985  ', N'7453010015985  ', N'SACUDIDOR', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (313, N'6930548013528  ', N'6930548013528  ', N' COMIDERA', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (314, N'1381562515768  ', N'1381562515768  ', N'PLATO SOPERO GRANDE 1576', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (315, N'1381562528928  ', N'1381562528928  ', N'PLATO CUADRADO 2892', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (316, N'1234560120741  ', N'1234560120741  ', N'MASCON DE ALAMBRE MANGO PLASTICO', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (317, N'688466625005   ', N'688466625005   ', N'HUACAL PEQUEÑO 117', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (318, N'6938367570024  ', N'6938367570024  ', N'HUACAL MEDIANO', 1, 1, 200, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (319, N'913310001233   ', N'913310001233   ', N'RAYADOR DE MANZANA 213', 1, 1, 300, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (320, N'9179911997424  ', N'9179911997424  ', N'DIADEMA DE CONEJO', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (321, N'6935898072478  ', N'6935898072478  ', N'SET DE PORTACALIENTE CON GUANTE', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (322, N'6943349281386  ', N'6943349281386  ', N'EXPRIMIDOR DE AJO DG-19', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (323, N'6436457352876  ', N'6436457352876  ', N'BOLSA CON COLITAS DONITAS', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (324, N'6395220088889  ', N'6395220088889  ', N'DIADEMA DE RATON', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (325, N'7419900902612  ', N'7419900902612  ', N'GLOBOS', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (326, N'6916800862349  ', N'6916800862349  ', N'TORTUGA', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (327, N'1546825972126  ', N'1546825972126  ', N'CACEROLA EN RED', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (328, N'6902016005885  ', N'6902016005885  ', N'JUEGO DE AROS EN AGUA NINTENDO', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (329, N'6140896852698  ', N'6140896852698  ', N'JUEGO DE CARRO EN AGUA', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (330, N'7109697475795  ', N'7109697475795  ', N'CUADRIMOTO EN BLISTER', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (331, N'6901311228777  ', N'6901311228777  ', N'BOLSA DE SOLDADO', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (332, N'6905434387823  ', N'6905434387823  ', N'MUÑECA EN BOLSA', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (333, N'3307542000138  ', N'3307542000138  ', N'MUÑECA Q16', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (334, N'3307542000213  ', N'3307542000213  ', N'MUÑECA CON COCHE 2388B', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (335, N'3307542000206  ', N'3307542000206  ', N'MUÑECA 8138G', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (336, N'3307542000244  ', N'3307542000244  ', N'MUÑECA 005', 1, 1, 100, 1000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (337, N'6969564659564  ', N'6969564659564  ', N'CARRO CONSTRUCTOR SURTIDO', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (338, N'7708310162434  ', N'7708310162434  ', N'CARRO DE CARRERA 19666', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (339, N'6965959566663  ', N'6965959566663  ', N'CARRO 3223', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (340, N'6937526503743  ', N'6937526503743  ', N'CARRO 9668-2', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (341, N'8861234563660  ', N'8861234563660  ', N'CARRO 10819-2', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (342, N'6991206674673  ', N'6991206674673  ', N'CARRO 0303A', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (343, N'8265830068909  ', N'8265830068909  ', N'CARRO JHLS', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (344, N'6140896455530  ', N'6140896455530  ', N'CARRO 553', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (345, N'6988281075327  ', N'6988281075327  ', N'CARTON MICROFONO', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (346, N'8130000200970  ', N'8130000200970  ', N'TETERAS', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (347, N'6910523161161  ', N'6910523161161  ', N'MUÑECOS DE HULE LLORONES', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (348, N'6902214789204  ', N'6902214789204  ', N'MUÑECA 1902', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (349, N'6954331600030  ', N'6954331600030  ', N'MUÑECA ZR-511', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (350, N'6905148038417  ', N'6905148038417  ', N'MUÑECA 328', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (351, N'O578454678545', N'O578454678545', N'JUEGO DE COCINA 105B-12 ( BATIDOR )', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (352, N'6962585300484  ', N'6962585300484  ', N'JUEGO DE COCINA 105B-14', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (353, N'8585236632581  ', N'8585236632581  ', N'JUEGO DE COCINA GRANDE 869-B-1', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (354, N'O741355647280', N'O741355647280', N'JUEGO DE COCINA GRANDE 869 B-2', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (355, N'6922070411965  ', N'6922070411965  ', N'JUEGO DE DOCTOR 61012CD', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_codigo_bar], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (356, N'6921939129164  ', N'6921939129164  ', N'JUEGO DE DOCTOR   ', 1, 1, 200, 2000, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[inv_producto] OFF
SET IDENTITY_INSERT [dbo].[inv_producto_stock] ON 

INSERT [dbo].[inv_producto_stock] ([sto_id], [sto_cantidad], [sto_producto], [sto_ubicacion], [sto_costo], [sto_fecha_tran], [sto_usuario_tran], [sto_eliminado]) VALUES (6, 300, 86, 1, CAST(1.3334 AS Decimal(18, 4)), CAST(N'2018-02-23T22:35:11.450' AS DateTime), 1, 0)
INSERT [dbo].[inv_producto_stock] ([sto_id], [sto_cantidad], [sto_producto], [sto_ubicacion], [sto_costo], [sto_fecha_tran], [sto_usuario_tran], [sto_eliminado]) VALUES (7, 50, 87, 1, CAST(1.2500 AS Decimal(18, 4)), CAST(N'2018-02-23T22:36:17.323' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[inv_producto_stock] OFF
SET IDENTITY_INSERT [dbo].[inv_producto_tipo] ON 

INSERT [dbo].[inv_producto_tipo] ([pti_id], [pti_descripcion], [pti_visible], [pti_fecha_tran], [pti_usuario_tran], [pti_eliminado]) VALUES (1, N'Almacenable', 1, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto_tipo] ([pti_id], [pti_descripcion], [pti_visible], [pti_fecha_tran], [pti_usuario_tran], [pti_eliminado]) VALUES (2, N'Servicio', 1, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[inv_producto_tipo] OFF
SET IDENTITY_INSERT [dbo].[inv_proveedor] ON 

INSERT [dbo].[inv_proveedor] ([prv_id], [prv_nombre], [prv_direccion], [prv_telefono], [prv_fecha_trans], [prv_usuario_trans], [prv_eliminado]) VALUES (1, N'Importadora Canaan', N'Miami. Estados Unidos', N'001-253-8909', CAST(N'2017-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_proveedor] ([prv_id], [prv_nombre], [prv_direccion], [prv_telefono], [prv_fecha_trans], [prv_usuario_trans], [prv_eliminado]) VALUES (2, N'Nuevo', N'San Salvador', N'2222-2221', CAST(N'2017-01-01T00:00:00.000' AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[inv_proveedor] OFF
SET IDENTITY_INSERT [dbo].[inv_trans] ON 

INSERT [dbo].[inv_trans] ([tra_id], [tra_fecha], [tra_usuario], [tra_tipo], [tra_comentario], [tra_fecha_trans], [tra_usuario_trans], [tra_eliminado]) VALUES (43, CAST(N'2018-02-23' AS Date), NULL, 1, N'Inventario Inicial', CAST(N'2018-02-23T22:34:55.390' AS DateTime), 1, 0)
INSERT [dbo].[inv_trans] ([tra_id], [tra_fecha], [tra_usuario], [tra_tipo], [tra_comentario], [tra_fecha_trans], [tra_usuario_trans], [tra_eliminado]) VALUES (44, CAST(N'2018-02-23' AS Date), NULL, 1, N'segunda prueba', CAST(N'2018-02-23T22:36:45.333' AS DateTime), 1, 0)
INSERT [dbo].[inv_trans] ([tra_id], [tra_fecha], [tra_usuario], [tra_tipo], [tra_comentario], [tra_fecha_trans], [tra_usuario_trans], [tra_eliminado]) VALUES (45, CAST(N'2018-02-24' AS Date), NULL, 2, N'Despacho Super Selectos', CAST(N'2018-02-23T22:37:37.077' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[inv_trans] OFF
SET IDENTITY_INSERT [dbo].[inv_trans_detalle] ON 

INSERT [dbo].[inv_trans_detalle] ([tde_id], [tde_trans], [tde_cantidad], [tde_producto], [tde_descripcion], [tde_costo], [tde_ubicacion], [tde_fecha_trans], [tde_usuario_trans], [tde_eliminado]) VALUES (10, 43, 100, 86, N'GUANTE DE HULE L', CAST(1.0000 AS Decimal(18, 4)), 1, CAST(N'2018-02-23T22:35:11.413' AS DateTime), 1, 0)
INSERT [dbo].[inv_trans_detalle] ([tde_id], [tde_trans], [tde_cantidad], [tde_producto], [tde_descripcion], [tde_costo], [tde_ubicacion], [tde_fecha_trans], [tde_usuario_trans], [tde_eliminado]) VALUES (12, 43, 50, 87, N'GUANTE DE HULE M', CAST(1.2500 AS Decimal(18, 4)), 1, CAST(N'2018-02-23T22:36:17.170' AS DateTime), 1, 0)
INSERT [dbo].[inv_trans_detalle] ([tde_id], [tde_trans], [tde_cantidad], [tde_producto], [tde_descripcion], [tde_costo], [tde_ubicacion], [tde_fecha_trans], [tde_usuario_trans], [tde_eliminado]) VALUES (13, 44, 200, 86, N'GUANTE DE HULE L', CAST(1.5000 AS Decimal(18, 4)), 1, CAST(N'2018-02-23T22:39:14.587' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[inv_trans_detalle] OFF
SET IDENTITY_INSERT [dbo].[inv_ubicacion] ON 

INSERT [dbo].[inv_ubicacion] ([ubi_id], [ubi_codigo], [ubi_descripcion], [ubi_activo], [ubi_fecha_tran], [ubi_usuario_tran], [ubi_eliminado]) VALUES (1, N'BOD001', N'Ubicacion 001', 1, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[inv_ubicacion] ([ubi_id], [ubi_codigo], [ubi_descripcion], [ubi_activo], [ubi_fecha_tran], [ubi_usuario_tran], [ubi_eliminado]) VALUES (2, N'BOD002', N'Ubicacion 002', 1, CAST(N'2018-02-03T03:13:35.000' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[inv_ubicacion] OFF
SET IDENTITY_INSERT [dbo].[inv_unidad_medida] ON 

INSERT [dbo].[inv_unidad_medida] ([uni_id], [uni_descripcion], [uni_fecha_tran], [ubi_usuario_tran], [ubi_eliminado]) VALUES (1, N'Unidades', CAST(N'2017-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_unidad_medida] ([uni_id], [uni_descripcion], [uni_fecha_tran], [ubi_usuario_tran], [ubi_eliminado]) VALUES (2, N'Cajas', CAST(N'2017-01-01T00:00:00.000' AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[inv_unidad_medida] OFF
ALTER TABLE [dbo].[adm_usuario] ADD  CONSTRAINT [DF_adm_usuario_usr_fecha_tran]  DEFAULT (getdate()) FOR [usr_fecha_tran]
GO
ALTER TABLE [dbo].[adm_usuario] ADD  CONSTRAINT [DF_adm_usuario_usr_usuario_tran]  DEFAULT ((0)) FOR [usr_usuario_tran]
GO
ALTER TABLE [dbo].[adm_usuario] ADD  CONSTRAINT [DF_adm_usuario_usr_eliminado]  DEFAULT ((0)) FOR [usr_eliminado]
GO
ALTER TABLE [dbo].[fac_cliente] ADD  CONSTRAINT [DF_fac_cliente_cli_dias_pago]  DEFAULT ((0)) FOR [cli_tipo_pago]
GO
ALTER TABLE [dbo].[fac_cliente] ADD  CONSTRAINT [DF_fac_cliente_cli_limite_credito]  DEFAULT ((0)) FOR [cli_limite_credito]
GO
ALTER TABLE [dbo].[fac_cliente] ADD  CONSTRAINT [DF_fac_cliente_cli_retencion_porcentaje]  DEFAULT ((0)) FOR [cli_retencion_porcentaje]
GO
ALTER TABLE [dbo].[fac_cliente] ADD  CONSTRAINT [DF_fac_cliente_cli_fecha_tran]  DEFAULT (getdate()) FOR [cli_fecha_tran]
GO
ALTER TABLE [dbo].[fac_cliente] ADD  CONSTRAINT [DF_fac_cliente_cli_usuario_tran]  DEFAULT ((0)) FOR [cli_usuario_tran]
GO
ALTER TABLE [dbo].[fac_cliente] ADD  CONSTRAINT [DF_fac_cliente_cli_eliminado]  DEFAULT ((0)) FOR [cli_eliminado]
GO
ALTER TABLE [dbo].[fac_factura] ADD  CONSTRAINT [DF_fac_factura_fac_eliminado]  DEFAULT ((0)) FOR [fac_eliminado]
GO
ALTER TABLE [dbo].[fac_tipo_factura] ADD  CONSTRAINT [DF_fac_tipo_factura_tfa_eliminado]  DEFAULT ((0)) FOR [tfa_eliminado]
GO
ALTER TABLE [dbo].[fac_tipo_pago] ADD  CONSTRAINT [DF_fac_tipo_pago_tpa_eliminado]  DEFAULT ((0)) FOR [tpa_eliminado]
GO
ALTER TABLE [dbo].[inv_despacho] ADD  CONSTRAINT [DF_inv_despacho_des_aplicado]  DEFAULT ((0)) FOR [des_aplicado]
GO
ALTER TABLE [dbo].[inv_despacho_detalle] ADD  CONSTRAINT [DF_inv_despacho_detalle_ddt_fecha_tran]  DEFAULT (getdate()) FOR [ddt_fecha_tran]
GO
ALTER TABLE [dbo].[inv_despacho_detalle] ADD  CONSTRAINT [DF_inv_despacho_detalle_ddt_usuario_tran]  DEFAULT ((0)) FOR [ddt_usuario_tran]
GO
ALTER TABLE [dbo].[inv_despacho_detalle] ADD  CONSTRAINT [DF_inv_despacho_detalle_ddt_eliminado]  DEFAULT ((0)) FOR [ddt_eliminado]
GO
ALTER TABLE [dbo].[inv_producto] ADD  CONSTRAINT [DF_inv_producto_pro_activo]  DEFAULT ((1)) FOR [pro_activo]
GO
ALTER TABLE [dbo].[inv_producto] ADD  CONSTRAINT [DF_inv_producto_pro_fecha_tran]  DEFAULT (getdate()) FOR [pro_fecha_tran]
GO
ALTER TABLE [dbo].[inv_producto] ADD  CONSTRAINT [DF_inv_producto_pro_usuario_tran]  DEFAULT ((0)) FOR [pro_usuario_tran]
GO
ALTER TABLE [dbo].[inv_producto] ADD  CONSTRAINT [DF_inv_producto_pro_eliminado]  DEFAULT ((0)) FOR [pro_eliminado]
GO
ALTER TABLE [dbo].[inv_producto_stock] ADD  CONSTRAINT [DF_inv_producto_stock_sto_fecha_tran]  DEFAULT (getdate()) FOR [sto_fecha_tran]
GO
ALTER TABLE [dbo].[inv_producto_stock] ADD  CONSTRAINT [DF_inv_producto_stock_sto_usuario_tran]  DEFAULT ((0)) FOR [sto_usuario_tran]
GO
ALTER TABLE [dbo].[inv_producto_stock] ADD  CONSTRAINT [DF_inv_producto_stock_sto_eliminado]  DEFAULT ((0)) FOR [sto_eliminado]
GO
ALTER TABLE [dbo].[inv_producto_tipo] ADD  CONSTRAINT [DF_inv_producto_tipo_pti_fecha_tran]  DEFAULT (getdate()) FOR [pti_fecha_tran]
GO
ALTER TABLE [dbo].[inv_producto_tipo] ADD  CONSTRAINT [DF_inv_producto_tipo_pti_usuario_tran]  DEFAULT ((0)) FOR [pti_usuario_tran]
GO
ALTER TABLE [dbo].[inv_producto_tipo] ADD  CONSTRAINT [DF_inv_producto_tipo_pti_eliminado]  DEFAULT ((0)) FOR [pti_eliminado]
GO
ALTER TABLE [dbo].[inv_proveedor] ADD  CONSTRAINT [DF_inv_proveedor_prv_fecha_trans]  DEFAULT (getdate()) FOR [prv_fecha_trans]
GO
ALTER TABLE [dbo].[inv_proveedor] ADD  CONSTRAINT [DF_inv_proveedor_prv_usuario_trans]  DEFAULT ((0)) FOR [prv_usuario_trans]
GO
ALTER TABLE [dbo].[inv_proveedor] ADD  CONSTRAINT [DF_inv_proveedor_prv_eliminado]  DEFAULT ((0)) FOR [prv_eliminado]
GO
ALTER TABLE [dbo].[inv_trans] ADD  CONSTRAINT [DF_inv_trans_tra_eliminado]  DEFAULT ((0)) FOR [tra_eliminado]
GO
ALTER TABLE [dbo].[inv_ubicacion] ADD  CONSTRAINT [DF_inv_ubicacion_ubi_activo]  DEFAULT ((1)) FOR [ubi_activo]
GO
ALTER TABLE [dbo].[inv_ubicacion] ADD  CONSTRAINT [DF_inv_ubicacion_ubi_fecha_tran]  DEFAULT (getdate()) FOR [ubi_fecha_tran]
GO
ALTER TABLE [dbo].[inv_ubicacion] ADD  CONSTRAINT [DF_inv_ubicacion_ubi_eliminado]  DEFAULT ((0)) FOR [ubi_eliminado]
GO
ALTER TABLE [dbo].[inv_unidad_medida] ADD  CONSTRAINT [DF_inv_unidad_medida_uni_fecha_tran]  DEFAULT (getdate()) FOR [uni_fecha_tran]
GO
ALTER TABLE [dbo].[inv_unidad_medida] ADD  CONSTRAINT [DF_inv_unidad_medida_ubi_usuario_tran]  DEFAULT ((0)) FOR [ubi_usuario_tran]
GO
ALTER TABLE [dbo].[inv_unidad_medida] ADD  CONSTRAINT [DF_inv_unidad_medida_ubi_eliminado]  DEFAULT ((0)) FOR [ubi_eliminado]
GO
ALTER TABLE [dbo].[fac_cxc_detalle]  WITH CHECK ADD  CONSTRAINT [FK_fac_cxc_detalle_fac_cxc] FOREIGN KEY([cde_cuenta])
REFERENCES [dbo].[fac_cxc] ([cxc_id])
GO
ALTER TABLE [dbo].[fac_cxc_detalle] CHECK CONSTRAINT [FK_fac_cxc_detalle_fac_cxc]
GO
ALTER TABLE [dbo].[fac_factura]  WITH CHECK ADD  CONSTRAINT [FK_fac_factura_fac_cliente] FOREIGN KEY([fac_id_cliente])
REFERENCES [dbo].[fac_cliente] ([cli_id])
GO
ALTER TABLE [dbo].[fac_factura] CHECK CONSTRAINT [FK_fac_factura_fac_cliente]
GO
ALTER TABLE [dbo].[fac_factura]  WITH CHECK ADD  CONSTRAINT [FK_fac_factura_fac_tipo_factura] FOREIGN KEY([fac_tipo_factura])
REFERENCES [dbo].[fac_tipo_factura] ([tfa_id])
GO
ALTER TABLE [dbo].[fac_factura] CHECK CONSTRAINT [FK_fac_factura_fac_tipo_factura]
GO
ALTER TABLE [dbo].[fac_factura]  WITH CHECK ADD  CONSTRAINT [FK_fac_factura_fac_tipo_pago] FOREIGN KEY([fac_tipo_pago])
REFERENCES [dbo].[fac_tipo_pago] ([tpa_id])
GO
ALTER TABLE [dbo].[fac_factura] CHECK CONSTRAINT [FK_fac_factura_fac_tipo_pago]
GO
ALTER TABLE [dbo].[fac_factura]  WITH CHECK ADD  CONSTRAINT [FK_fac_factura_fac_vendedor] FOREIGN KEY([fac_vendedor])
REFERENCES [dbo].[fac_vendedor] ([ven_id])
GO
ALTER TABLE [dbo].[fac_factura] CHECK CONSTRAINT [FK_fac_factura_fac_vendedor]
GO
ALTER TABLE [dbo].[fac_factura_detalle]  WITH CHECK ADD  CONSTRAINT [FK_fac_factura_detalle_fac_factura] FOREIGN KEY([fde_factura])
REFERENCES [dbo].[fac_factura] ([fac_id])
GO
ALTER TABLE [dbo].[fac_factura_detalle] CHECK CONSTRAINT [FK_fac_factura_detalle_fac_factura]
GO
ALTER TABLE [dbo].[fac_pedido]  WITH CHECK ADD  CONSTRAINT [FK_fac_pedido_fac_pedido_estado] FOREIGN KEY([ped_estado])
REFERENCES [dbo].[fac_pedido_estado] ([pes_id])
GO
ALTER TABLE [dbo].[fac_pedido] CHECK CONSTRAINT [FK_fac_pedido_fac_pedido_estado]
GO
ALTER TABLE [dbo].[fac_pedido_detalle]  WITH CHECK ADD  CONSTRAINT [FK_fac_pedido_detalle_fac_pedido] FOREIGN KEY([pde_pedido])
REFERENCES [dbo].[fac_pedido] ([ped_id])
GO
ALTER TABLE [dbo].[fac_pedido_detalle] CHECK CONSTRAINT [FK_fac_pedido_detalle_fac_pedido]
GO
ALTER TABLE [dbo].[fac_precio_detalle]  WITH CHECK ADD  CONSTRAINT [FK_fac_precio_detalle_fac_precio] FOREIGN KEY([pde_precio])
REFERENCES [dbo].[fac_precio] ([pre_id])
GO
ALTER TABLE [dbo].[fac_precio_detalle] CHECK CONSTRAINT [FK_fac_precio_detalle_fac_precio]
GO
ALTER TABLE [dbo].[inv_despacho_detalle]  WITH CHECK ADD  CONSTRAINT [FK_inv_despacho_detalle_inv_despacho] FOREIGN KEY([ddt_despacho])
REFERENCES [dbo].[inv_despacho] ([des_id])
GO
ALTER TABLE [dbo].[inv_despacho_detalle] CHECK CONSTRAINT [FK_inv_despacho_detalle_inv_despacho]
GO
ALTER TABLE [dbo].[inv_producto]  WITH CHECK ADD  CONSTRAINT [FK_inv_producto_inv_producto_tipo] FOREIGN KEY([pro_tipo])
REFERENCES [dbo].[inv_producto_tipo] ([pti_id])
GO
ALTER TABLE [dbo].[inv_producto] CHECK CONSTRAINT [FK_inv_producto_inv_producto_tipo]
GO
ALTER TABLE [dbo].[inv_producto]  WITH CHECK ADD  CONSTRAINT [FK_inv_producto_inv_proveedor] FOREIGN KEY([pro_proveedor])
REFERENCES [dbo].[inv_proveedor] ([prv_id])
GO
ALTER TABLE [dbo].[inv_producto] CHECK CONSTRAINT [FK_inv_producto_inv_proveedor]
GO
ALTER TABLE [dbo].[inv_producto]  WITH CHECK ADD  CONSTRAINT [FK_inv_producto_inv_unidad_medida] FOREIGN KEY([pro_unidad_medida])
REFERENCES [dbo].[inv_unidad_medida] ([uni_id])
GO
ALTER TABLE [dbo].[inv_producto] CHECK CONSTRAINT [FK_inv_producto_inv_unidad_medida]
GO
ALTER TABLE [dbo].[inv_producto_stock]  WITH CHECK ADD  CONSTRAINT [FK_inv_producto_stock_inv_producto] FOREIGN KEY([sto_producto])
REFERENCES [dbo].[inv_producto] ([pro_id])
GO
ALTER TABLE [dbo].[inv_producto_stock] CHECK CONSTRAINT [FK_inv_producto_stock_inv_producto]
GO
ALTER TABLE [dbo].[inv_producto_stock]  WITH CHECK ADD  CONSTRAINT [FK_inv_producto_stock_inv_ubicacion] FOREIGN KEY([sto_ubicacion])
REFERENCES [dbo].[inv_ubicacion] ([ubi_id])
GO
ALTER TABLE [dbo].[inv_producto_stock] CHECK CONSTRAINT [FK_inv_producto_stock_inv_ubicacion]
GO
ALTER TABLE [dbo].[inv_trans_detalle]  WITH CHECK ADD  CONSTRAINT [FK_inv_trans_detalle_inv_producto] FOREIGN KEY([tde_producto])
REFERENCES [dbo].[inv_producto] ([pro_id])
GO
ALTER TABLE [dbo].[inv_trans_detalle] CHECK CONSTRAINT [FK_inv_trans_detalle_inv_producto]
GO
ALTER TABLE [dbo].[inv_trans_detalle]  WITH CHECK ADD  CONSTRAINT [FK_inv_trans_detalle_inv_trans] FOREIGN KEY([tde_trans])
REFERENCES [dbo].[inv_trans] ([tra_id])
GO
ALTER TABLE [dbo].[inv_trans_detalle] CHECK CONSTRAINT [FK_inv_trans_detalle_inv_trans]
GO
ALTER TABLE [dbo].[inv_trans_detalle]  WITH CHECK ADD  CONSTRAINT [FK_inv_trans_detalle_inv_ubicacion] FOREIGN KEY([tde_ubicacion])
REFERENCES [dbo].[inv_ubicacion] ([ubi_id])
GO
ALTER TABLE [dbo].[inv_trans_detalle] CHECK CONSTRAINT [FK_inv_trans_detalle_inv_ubicacion]
GO
