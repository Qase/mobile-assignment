package com.veprek.honza.rocketlaunch.ui.component.button

import androidx.compose.foundation.layout.RowScope
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.Button
import androidx.compose.material.ButtonDefaults
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import com.veprek.honza.rocketlaunch.ui.theme.Pink

@Composable
fun CustomButton(
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    content: @Composable RowScope.() -> Unit
) {
    Button(
        colors = ButtonDefaults.buttonColors(
            backgroundColor = Pink,
            contentColor = Color.White
        ),
        shape = RoundedCornerShape(15.dp),
        onClick = onClick,
        modifier = modifier,
        content = content
    )
}
