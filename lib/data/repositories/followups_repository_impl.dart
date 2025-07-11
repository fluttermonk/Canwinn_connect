import 'package:canwinn_project/Constants/custom_toast.dart';
import 'package:canwinn_project/data/network/base_api_services.dart';
import 'package:canwinn_project/data/network/network_api_services.dart';
import 'package:canwinn_project/domain/repositories/followups_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class FollowupsRepositoryImpl implements FollowupsRepository {
  final BaseApiServices _apiService = NetworkApiServices();
  @override
  Future<bool> addFollowUp({
    required String followupsType,
    required String followupsDate,
    required String followupsTime,
    required String note,
    int? status,
    int? leadId,
  }) async {
    try {
      final formData = FormData.fromMap({
        'lead_id': leadId.toString(),
        'follow_up_type': followupsType,
        'follow_up_date': followupsDate,
        'follow_up_time': followupsTime,
        'note': note,
        'status': status.toString(),
      });
       final response = await _apiService.getMultipartPostApiResponse(
           "https://taskmaster.electionmaster.in/public/api/store-follow-ups"
           ,formData );
      // final response = await _apiService.getMultipartPostApiResponse(
      //   "https://taskmaster.electionmaster.in/public/api/store-follow-ups",
      //   formData,
      // );
      CustomToast().showCustomToast(response['message'] ?? 'Success');
      return true;
    } catch (e) {
      CustomToast().showCustomToast("Follow-up failed: $e");
      return false;
    }
  }
  @override
  Future<bool> changeFollowupStatus({
    required int id,
    required int status,
    required String remarks,
  }) async {
    try {
      final formData = FormData.fromMap({
        'id': id.toString(),
        'status': status.toString(),
        'remarks': remarks,
      });
      final response = await _apiService.getMultipartPostApiResponse(
        "https://taskmaster.electionmaster.in/public/api/change-lead-followup-status",
        formData,
      );
      CustomToast().showCustomToast(response['message'] ?? 'Status updated');
      return true;
    } catch (e) {
      CustomToast().showCustomToast("Status update failed: $e");
      return false;
    }
  }
  Future<bool> RegisterUser({required String name , required String email,required String password,required String password_confirmation })
  async{
    try{
      final formData = FormData.fromMap(
          {
            "name":name,
            "email":email,
            "password":password,
            "password_confirmation":password_confirmation
          }
      );
      final res = await _apiService.getMultipartPostApiResponse(
          "https://connect.electionmaster.in/public/api/register",
          formData);
      CustomToast().showCustomToast(res['message'] ?? 'Success');
      return true;

    }catch(ex){
      CustomToast().showCustomToast("Follow-up failed: $ex");
      return false;
    }

  }
}
