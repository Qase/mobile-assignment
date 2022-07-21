package com.veprek.honza.rocketlaunch.ui.component.error

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import com.veprek.honza.rocketlaunch.R
import com.veprek.honza.rocketlaunch.ui.theme.horizontalPadding
import com.veprek.honza.rocketlaunch.ui.theme.verticalPadding

@Composable
fun Error() {
    Column(
        Modifier
            .fillMaxSize()
            .verticalScroll(rememberScrollState())
            .padding(horizontal = horizontalPadding),
        verticalArrangement = Arrangement.spacedBy(verticalPadding)
    ) {
        Text(stringResource(R.string.error))
    }
}
