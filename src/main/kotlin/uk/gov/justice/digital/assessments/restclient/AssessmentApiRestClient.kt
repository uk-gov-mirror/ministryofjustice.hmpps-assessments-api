package uk.gov.justice.digital.assessments.restclient

import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.beans.factory.annotation.Qualifier
import org.springframework.http.HttpStatus
import org.springframework.stereotype.Component
import org.springframework.web.reactive.function.client.ClientResponse
import reactor.core.publisher.Mono
import uk.gov.justice.digital.assessments.restclient.assessmentapi.OASysAssessmentDto
import uk.gov.justice.digital.assessments.restclient.assessmentupdateapi.OASysErrorResponse
import uk.gov.justice.digital.assessments.services.exceptions.EntityNotFoundException
import uk.gov.justice.digital.assessments.services.exceptions.OASysClientException

@Component
class AssessmentApiRestClient {
  @Autowired
  @Qualifier("assessmentApiWebClient")
  internal lateinit var webClient: AuthenticatingRestClient

  companion object {
    val log: Logger = LoggerFactory.getLogger(this::class.java)
  }

  fun getOASysAssessment(
    oasysSetPk: Long,
  ): OASysAssessmentDto? {
    log.info("Retrieving OASys Assessment $oasysSetPk")
    return webClient
      .get("/assessments/oasysSetPk/$oasysSetPk")
      .retrieve()
      .onStatus(HttpStatus::is4xxClientError) { handleAssessmentError(oasysSetPk, it) }
      .onStatus(HttpStatus::is5xxServerError) { throw OASysClientException("Failed to retrieve Oasys assessment $oasysSetPk") }
      .bodyToMono(OASysAssessmentDto::class.java)
      .block().also { log.info("Retrieved OASys Assessment $oasysSetPk") }
  }

  fun handleAssessmentError(
    oasysSetPk: Long?,
    clientResponse: ClientResponse
  ): Mono<out Throwable?>? {
    return when (clientResponse.statusCode()) {
      HttpStatus.NOT_FOUND -> {
        AssessmentUpdateRestClient.log.error("Oasys assessment $oasysSetPk not found")
        clientResponse.bodyToMono(OASysErrorResponse::class.java)
          .map { error -> EntityNotFoundException(error.developerMessage) }
      }
      else -> handleError(clientResponse)
    }
  }

  private fun handleError(clientResponse: ClientResponse): Mono<out Throwable?>? {
    val httpStatus = clientResponse.statusCode()
    log.error("Unexpected exception with status $httpStatus")
    return clientResponse.bodyToMono(String::class.java).map { error ->
      OASysClientException(error)
    }.or(Mono.error(OASysClientException("Unexpected exception with no body and status $httpStatus")))
  }
}