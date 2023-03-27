package cz.quanti.rocketapp.rocketdata.domain

import cz.quanti.rocketapp.rocketdata.model.Rocket
import io.kotest.matchers.shouldBe
import io.mockk.coEvery
import io.mockk.mockk
import kotlinx.coroutines.test.runTest
import org.junit.Test
import java.time.LocalDate

class GetRocketsUseCaseTest {

    @Test
    fun `should provide rockets from repository` () = runTest {
        val rocket = Rocket(
            id = 1,
            name = "Falcon 1",
            firstFlight = LocalDate.parse("2006-03-24"),
            overview = "Falcon 1 was an expendable launch system privately developed and manufactured by SpaceX during 2006-2009",
            parameters = mockk()
        )

        val repository = mockk<RocketRepository> {
            coEvery { getRockets() } returns listOf(rocket)
        }

        val useCase = GetRocketsUseCase(repository)
        val rockets = useCase.getRockets()

        rockets.first() shouldBe rocket
    }
}