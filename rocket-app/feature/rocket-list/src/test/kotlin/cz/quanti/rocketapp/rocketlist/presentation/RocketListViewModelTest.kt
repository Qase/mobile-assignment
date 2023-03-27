package cz.quanti.rocketapp.rocketlist.presentation

import app.cash.turbine.test
import cz.quanti.rocketapp.rocketdata.domain.GetRocketsUseCase
import cz.quanti.rocketapp.rocketdata.model.Rocket
import io.kotest.matchers.shouldBe
import io.mockk.coEvery
import io.mockk.coVerify
import io.mockk.mockk
import io.mockk.verify
import java.time.LocalDate
import kotlinx.coroutines.test.runTest
import org.junit.Test

class RocketListViewModelTest {

    @Test
    fun `should provide rockets from usecase`() = runTest {
        val rocket = Rocket(
            id = 1,
            name = "Falcon 1",
            firstFlight = LocalDate.parse("2006-03-24"),
            overview = "Falcon 1 was an expendable launch system privately developed and manufactured by SpaceX during 2006-2009",
            parameters = mockk()
        )
        val getRocketsUseCase = mockk<GetRocketsUseCase> {
            coEvery { getRockets() } returns listOf(rocket)
        }

        val viewModel = RocketListViewModel(getRocketsUseCase)
        viewModel.rockets.test {
            expectMostRecentItem().rockets.first() shouldBe RocketItemState(1, "Falcon 1", "First flight: 24.03.2006")
        }
        coVerify { getRocketsUseCase.getRockets() }
    }
}