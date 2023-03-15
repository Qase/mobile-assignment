package com.example.rocket_list.system

import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.material.Icon
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.example.rocket_list.R
import com.example.rocket_repo.data.rockets
import com.example.rocket_repo.model.Rocket
import java.time.LocalDate
import java.time.format.DateTimeFormatter

@Composable
fun RocketCard(rocket: Rocket, navigateToRocketDetail: (String) -> Unit) {
    Row(
        verticalAlignment = Alignment.CenterVertically,
        modifier = Modifier
            .background(Color.White)
            .fillMaxSize()
            .padding(8.dp)
            .clickable { navigateToRocketDetail(rocket.id) }
    ) {
        Image(
            painter = painterResource(id = R.drawable.rocket),
            contentDescription = "Rocket icon",
            modifier = Modifier
                .size(30.dp)
        )

        Spacer(modifier = Modifier.width(10.dp))

        Column(
            modifier = Modifier.weight(1f)
        ) {
            Text(
                text = rocket.name,
                style = MaterialTheme.typography.h6
            )

            Spacer(modifier = Modifier.height(4.dp))

            Text(
                text = "First flight: ${formatDate(rocket.firstFlight)}",
                style = MaterialTheme.typography.subtitle1
            )
        }
        
        Icon(
            painter = painterResource(id = R.drawable.arrow),
            tint = Color.LightGray,
            contentDescription = null,
        )
    }
}

fun formatDate(date: LocalDate): String {
    val formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy")
    return date.format(formatter)
}

@Preview
@Composable
fun RocketCardPreview() {
    RocketCard(rockets[0], {})
}