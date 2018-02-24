
/****** Object:  Trigger [dbo].[trg_actualiza_stock]    Script Date: 23/02/2018 22:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER TRIGGER [dbo].[trg_actualiza_stock] ON [dbo].[inv_trans_detalle]
	AFTER INSERT, UPDATE, DELETE
AS 
BEGIN

    SET NOCOUNT ON;

	declare @costo decimal(18,4)

	Declare @id int,
			@trans int,
			@pro int,
			@ubi int,
			@can int,
			@cos decimal(18,4)


    IF EXISTS(SELECT * FROM INSERTED)
	Begin

		-- Si es Update
		IF EXISTS(SELECT * FROM DELETED)
		Begin

			SELECT
				@id = tde_id,
				@trans = tde_trans,
				@can = tde_cantidad,
				@pro = tde_producto,
				@ubi = tde_ubicacion,
				@cos = tde_costo
			FROM DELETED

			IF((Select [tra_tipo] from [dbo].[inv_trans] where [tra_id] = @trans) = 1)
				Begin

					-- Calculando costo
					Select 
						@costo = ((sto_costo * sto_cantidad ) - (@can * @cos)) / ([sto_cantidad] - @can)
						From [dbo].[inv_producto_stock]
						Where [sto_producto] = @pro 
						And [sto_cantidad] > 0

					-- Actualizamos Costo a todo el producto
					Update [dbo].[inv_producto_stock]
						Set sto_costo = @costo
					Where		[sto_producto] = @pro
							And [sto_cantidad] > 0

					-- Actualizamos la cantidad del producto en la ubicacion
					Update [dbo].[inv_producto_stock]
						Set [sto_cantidad] = [sto_cantidad] - @can
					Where		[sto_producto] = @pro
							And [sto_ubicacion] = @ubi
				End
			Else
				Begin
					-- Salida
					Update [dbo].[inv_producto_stock]
						Set [sto_cantidad] = [sto_cantidad] + @can
					Where		[sto_producto] = @pro
							And [sto_ubicacion] = @ubi
				End

		End

		SELECT
			@id = tde_id,
			@trans = tde_trans,
			@can = tde_cantidad,
			@pro = tde_producto,
			@ubi = tde_ubicacion,
			@cos = tde_costo
		FROM INSERTED

		IF NOT EXISTS(Select sto_id from [dbo].[inv_producto_stock] where sto_producto = @pro and sto_ubicacion = @ubi)
			Begin
				-- Si el producto-ubicacion ya existe en la tabla stock
				Insert Into [dbo].[inv_producto_stock]
					Select 
						tde_cantidad,
						tde_producto,
						tde_ubicacion,
						tde_costo,
						GETDATE(),
						tde_usuario_trans,
						0
					from [dbo].[inv_trans_detalle]
					Where tde_id = @id
			End
		Else
			Begin
				-- Si el producto-ubicacion ya existe en la tabla stock
				IF((Select [tra_tipo] from [dbo].[inv_trans] where [tra_id] = @trans) = 1)
					Begin

						-- Entrada
						---------------------------------------------------------------------

						-- Calculando costo
						Select 
							@costo = (([sto_cantidad] * sto_costo ) + (@can * @cos)) / ([sto_cantidad] + @can)
							From [dbo].[inv_producto_stock]
							Where [sto_producto] = @pro 
							And [sto_cantidad] > 0

						-- Actualizamos Costo a todo el producto
						Update [dbo].[inv_producto_stock]
							Set sto_costo = @costo
						Where		[sto_producto] = @pro
								And [sto_cantidad] > 0

						-- Actualizamos la cantidad del producto en la ubicacion
						Update [dbo].[inv_producto_stock]
							Set [sto_cantidad] = [sto_cantidad] + @can
						Where		[sto_producto] = @pro
								And [sto_ubicacion] = @ubi

					End
				Else
					Begin
						-- Salida
						Update [dbo].[inv_producto_stock]
							Set [sto_cantidad] = [sto_cantidad] - @can
						Where		[sto_producto] = @pro
								And [sto_ubicacion] = @ubi

					End
			End

    End
	ELSE
	Begin

			SELECT
				@trans = tde_trans,
				@can = tde_cantidad,
				@pro = tde_producto,
				@ubi = tde_ubicacion,
				@cos = tde_costo
			FROM DELETED


			IF((Select [tra_tipo] from [dbo].[inv_trans] where [tra_id] = @trans) = 1)
				Begin

					-- Calculando costo
					Select 
						@costo = ((sto_costo * sto_cantidad ) - (@can * @cos)) / ([sto_cantidad] - @can)
						From [dbo].[inv_producto_stock]
						Where [sto_producto] = @pro 
						And [sto_cantidad] > 0

					-- Actualizamos Costo a todo el producto
					Update [dbo].[inv_producto_stock]
						Set sto_costo = @costo
					Where		[sto_producto] = @pro
							And [sto_cantidad] > 0

					-- Actualizamos la cantidad del producto en la ubicacion
					Update [dbo].[inv_producto_stock]
						Set [sto_cantidad] = [sto_cantidad] - @can
					Where		[sto_producto] = @pro
							And [sto_ubicacion] = @ubi
				End
			Else
				Begin
					-- Salida
					Update [dbo].[inv_producto_stock]
						Set [sto_cantidad] = [sto_cantidad] + @can
					Where		[sto_producto] = @pro
							And [sto_ubicacion] = @ubi
				End

	End

END
