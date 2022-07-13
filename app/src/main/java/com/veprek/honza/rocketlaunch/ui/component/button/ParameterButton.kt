package com.veprek.honza.rocketlaunch.ui.component.button

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.size
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

@Preview(showBackground = true)
@Composable
fun ParameterButton() {
    CustomButton(modifier = Modifier.size(96.dp), onClick = {}) {
        Column(horizontalAlignment = Alignment.CenterHorizontally) {
            Text("90m", fontSize = 26.sp, fontWeight = FontWeight.Bold)
            Text("height", fontSize = 18.sp, style = MaterialTheme.typography.subtitle1)
        }
    }
}
