import 'package:flutter/material.dart';

class SWPJobSearch {
  String? message;
  UserSearchDataParse? userSearchDataParse;
  SWPJobSearch();

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "message": message,
      "data": userSearchDataParse,
    };
    return map;
  }

  SWPJobSearch.fromMap(Map<String, dynamic> map) {
    message = map['message'];
    var userSearchingData = map['data'] as Map<String, dynamic>? ?? {};
    userSearchDataParse = UserSearchDataParse.fromMap(userSearchingData);
  }
}

class UserSearchDataParse {
  JobSearchDetailedData? jobSearchDetailedData;
  UserFilterParse? userFilterParse;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "jobs": jobSearchDetailedData,
      "attributes": userFilterParse,
    };
    return map;
  }

  UserSearchDataParse.fromMap(Map<String, dynamic> map) {
    var userJobDataParse = map['jobs'] as Map<String, dynamic>? ?? {};
    jobSearchDetailedData = JobSearchDetailedData.fromMap(userJobDataParse);
    var userFilterData = map['attributes'] as Map<String, dynamic>? ?? {};
    userFilterParse = UserFilterParse.fromMap(userFilterData);
  }
}

class JobSearchDetailedData {
  String? firstPageUrl, lastPageUrl, nextPageUrl, path, prevPageUrl;
  int? perPage, to, total, from, lastPage, currentPage;
  List<JobSearchData?>? jobSearchList;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "current_page": currentPage,
      "data": jobSearchList,
      "first_page_url": firstPageUrl,
      "from": from,
      "last_page": lastPage,
      "next_page_url": nextPageUrl,
      "path": path,
      "per_page": perPage,
      "prev_page_url": prevPageUrl,
      "to": to,
      "total": total,
    };
    return map;
  }

  JobSearchDetailedData.fromMap(Map<String, dynamic> map) {
    currentPage = map['current_page'];
    var jobSearchDataParsing = map['data'] as List? ?? [];
    jobSearchList =
        jobSearchDataParsing.map((i) => JobSearchData.fromMap(i)).toList();
    firstPageUrl = map['first_page_url'];
    from = map['from'];
    lastPage = map['last_page'];
    lastPageUrl = map['last_page_url'];
    nextPageUrl = map['next_page_url'];
    path = map['path'];
    perPage = map['per_page'];
    prevPageUrl = map['prev_page_url'];
    to = map['to'];
    total = map['total'];
  }
}

class JobSearchData {
  int? id, licenseReqId, empId, applicantCount;
  var distance;
  String? title,
      shiftTimings = '',
      shiftSchedule = '',
      weeklyWorkingHours = '',
      hiringManagerFirstName = '',
      hiringManagerLastName = '',
      salary,
      applicationStatus,
      empType,
      contractType,
      salaryWage,
      desc,
      address,
      postalCode,
      salaryPer,
      city,
      jobCreatedDate,
      companyName,
      venueType,
      logoUrl;
  bool? isUrgent,
      immediateStart,
      canApplicantChat,
      isAgentPosted,
      hasStarred,
      hasApplied,
      isNew,
      hasRemoved;
  List<Course>? coursesList;
  List<JobBenefits>? benefitsList;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "id": id,
      "employer_id": empId,
      "title": title,
      "shift_timings": shiftTimings,
      "shift_schedule": shiftSchedule,
      "employment_type": empType,
      "working_hours": weeklyWorkingHours,
      "license_required_course_id": licenseReqId,
      "contract_type": contractType,
      "description": desc,
      "address": address,
      "city": city,
      "applicants_count": applicantCount,
      "postal_code": postalCode,
      "application_status": applicationStatus,
      "created_at": jobCreatedDate,
      "salary": salary,
      "salary_per": salaryPer,
      "salary_wage": salaryWage,
      "company_name": companyName,
      "logo_url": logoUrl,
      "venue_type": venueType,
      "hiring_manager_first_name": hiringManagerFirstName,
      "hiring_manager_last_name": hiringManagerLastName,
      "distance": distance ?? -1,
      "is_immediate": immediateStart,
    };
    if (canApplicantChat!) {
      map.addAll({"can_applicant_chat": 1});
    } else {
      map.addAll({
        "can_applicant_chat": 0,
      });
    }
    if (hasRemoved!) {
      map.addAll({"has_removed": 1});
    } else {
      map.addAll({
        "has_removed": 0,
      });
    }
    if (isNew!) {
      map.addAll({"is_new": 1});
    } else {
      map.addAll({
        "is_new": 0,
      });
    }
    if (isAgentPosted!) {
      map.addAll({"is_agent_posted": 1});
    } else {
      map.addAll({
        "is_agent_posted": 0,
      });
    }
    if (isUrgent!) {
      map.addAll({"is_urgent": 1});
    } else {
      map.addAll({
        "is_urgent": 0,
      });
    }
    if (hasStarred!) {
      map.addAll({"has_starred": 1});
    } else {
      map.addAll({
        "has_starred": 0,
      });
    }
    if (hasApplied!) {
      map.addAll({"has_applied": 1});
    } else {
      map.addAll({
        "has_applied": 0,
      });
    }

    return map;
  }

  JobSearchData.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    empId = map['employer_id'];
    title = map['title'];
    empType = map['employment_type'];
    weeklyWorkingHours = map['working_hours'];
    licenseReqId = map['license_required_course_id'];
    contractType = map['contract_type'];
    desc = map['description'];
    address = map['address'];
    city = map['city'];
    applicationStatus = map['application_status'];
    shiftTimings = map['shift_timings'];
    shiftSchedule = map['shift_schedule'];
    postalCode = map['postal_code'];
    salary = map['salary'];
    salaryPer = map['salary_per'];
    jobCreatedDate = map['created_at'];
    logoUrl = map['logo_url'] ?? '';
    salaryWage = map['salary_wage'];
    applicantCount = map['applicants_count'];
    venueType = map['venue_type'];
    hiringManagerFirstName = map['hiring_manager_first_name'];
    hiringManagerLastName = map['hiring_manager_last_name'];
    companyName = map['company_name'];
    if (map['can_applicant_chat'] == 0) {
      canApplicantChat = false;
    } else {
      canApplicantChat = true;
    }
    if (map['is_immediate'] == 0) {
      immediateStart = false;
    } else {
      immediateStart = true;
    }
    if (map['is_agent_posted'] == 0) {
      isAgentPosted = false;
    } else {
      isAgentPosted = true;
    }
    // var employerDataParse = map['employer'] as Map<String, dynamic> ?? {};
    if (map['is_urgent'] == 0) {
      isUrgent = false;
    } else {
      isUrgent = true;
    }
    if (map['has_removed'] == 1) {
      hasRemoved = true;
    } else {
      hasRemoved = false;
    }
    if (map['has_starred'] == 1) {
      hasStarred = true;
    } else {
      hasStarred = false;
    }
    if (map['has_applied'] == 1) {
      hasApplied = true;
    } else {
      hasApplied = false;
    }
    if (map['is_new'] == 1) {
      isNew = true;
    } else {
      isNew = false;
    }
    salary = map['salary'];
    distance = map['distance'] ?? -1;
    var coursesDataList = map['job_licenses'] as List? ?? [];
    coursesList = coursesDataList.map((i) => Course.fromMap(i)).toList();
    var benefitsDataList = map['job_benefits'] as List? ?? [];
    benefitsList = benefitsDataList.map((i) => JobBenefits.fromMap(i)).toList();
  }
}

/*class Employer {
  int id;
  String name;
  Brand brand;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "id": id,
      "name": name,
      "brand": brand.toMap(),
    };
    return map;
  }

  Employer.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    var brandDataParse = map['brand'] as Map<String, dynamic> ?? {};
    brand = Brand.fromMap(brandDataParse);
  }
}*/

class Brand {
  String? logoUrl;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "logo_url": logoUrl,
    };
    return map;
  }

  Brand.fromMap(Map<String, dynamic> map) {
    logoUrl = map['logo_url'];
  }
}

class Course {
  int? id;
  String? courseName;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "id": id,
      "course_name": courseName,
    };
    return map;
  }

  Course.fromMap(Map<String, dynamic> map) {
    id = map['course_id'];
    courseName = map['course']['course_name'];
  }
}

class JobBenefits {
  int? id;
  String? benefitTitle;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "id": id,
      "title": benefitTitle,
    };
    return map;
  }

  JobBenefits.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    benefitTitle = map['benefit']['title'];
  }
}

class UserFilterParse {
  int? distanceRange;
  String? postCode, sortBy, lat, lng;
  bool? showRemovedJobs;
  List? licenceList;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "postcode": postCode,
      "distance_range": distanceRange,
      "sort_by": sortBy,
      "latitude": lat,
      "longitude": lng,
      "include_removed": showRemovedJobs,
      "licenses": licenceList,
    };
    if (showRemovedJobs!) {
      map.addAll({"include_removed": 1});
    } else {
      map.addAll({
        "include_removed": 0,
      });
    }
    return map;
  }

  UserFilterParse.fromMap(Map<String, dynamic> map) {
    debugPrint('1. SERVER RESPONSE FILTER: $map');
    postCode = map['postcode'];
    distanceRange = map['distance_range'];
    sortBy = map['sort_by'];
    lat = map['latitude'];
    lng = map['longitude'];
    if (map['include_removed'] == 0) {
      showRemovedJobs = false;
    } else {
      showRemovedJobs = true;
    }
    licenceList = map['licenses'];
  }
}

//*************************************************************/
class JobDetailData {
  JobSearchData? jobSearchList;
  String? message;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "data": jobSearchList,
      "message": message,
    };
    return map;
  }

  JobDetailData.fromMap(Map<String, dynamic> map) {
    message = map['message'];
    var userFilterData = map['data'] as Map<String, dynamic>? ?? {};
    jobSearchList = JobSearchData.fromMap(userFilterData);
  }
}
