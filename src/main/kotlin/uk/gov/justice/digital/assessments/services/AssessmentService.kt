package uk.gov.justice.digital.assessments.services

import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.stereotype.Service
import uk.gov.justice.digital.assessments.api.AssessmentDto
import uk.gov.justice.digital.assessments.jpa.entities.AssessmentEntity
import uk.gov.justice.digital.assessments.jpa.repositories.AssessmentRepository
import java.time.LocalDateTime

@Service
class AssessmentService (private val assessmentRepository: AssessmentRepository) {

    companion object {
        val log: Logger = LoggerFactory.getLogger(this::class.java)
    }

    fun createNewAssessment(supervisionId : String?) : AssessmentDto {
        val assessment = assessmentRepository.save(AssessmentEntity(supervisionId = supervisionId, createdDate = LocalDateTime.now()))
        return AssessmentDto.from(assessment)
    }

}