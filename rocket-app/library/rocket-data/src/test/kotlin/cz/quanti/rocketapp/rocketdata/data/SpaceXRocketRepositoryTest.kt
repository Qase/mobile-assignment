package cz.quanti.rocketapp.rocketdata.data

import cz.quanti.rocketapp.rocketdata.domain.RocketApiService
import cz.quanti.rocketapp.rocketdata.model.Rocket
import io.kotest.matchers.shouldBe
import io.mockk.coEvery
import io.mockk.mockk
import kotlinx.coroutines.test.runTest
import org.junit.Test
import java.time.LocalDate

class SpaceXRocketRepositoryTest {

    @Test
    fun `should provide rockets from api`() = runTest {
        val response = RocketResponse(
            1,
            "Falcon 1",
            "2006-03-24"
        )
        val api = mockk<RocketApiService> {
            coEvery { getRockets() } returns listOf(response)
        }

        val repo = SpaceXRocketRepository(api)
        val rockets = repo.getRockets()

        // The rocketParameters are mocked for RocketResponseExtension
        rockets.first() shouldBe Rocket(1, "Falcon 1", LocalDate.parse(response.firstFlight), "", rocketParameters)
    }
}