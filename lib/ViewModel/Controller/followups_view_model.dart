import 'package:canwinn_project/Constants/custom_toast.dart';
import 'package:canwinn_project/data/repositories/followups_repository_impl.dart';
import 'package:canwinn_project/domain/repositories/followups_repository.dart';
import 'package:get/get.dart';

class FollowupsViewModel extends GetxController {
  final FollowupsRepository _repository = FollowupsRepositoryImpl();
  var isAddingFollowups = false.obs;
  Future<void> addFollowup({
    required String followupsType,
    required String followupsDate,
    required String followupsTime,
    required String note,
    int? status,
    int? leadId,
  }) async {
    try {
      isAddingFollowups.value = true;
      final result = await _repository.addFollowUp(
        followupsType: followupsType,
        followupsDate: followupsDate,
        followupsTime: followupsTime,
        note: note,
        status: status,
        leadId: leadId,
      );

      if (result != null) {
        Get.back();
      }
    } catch (e) {
      CustomToast().showCustomToast("Unexpected error: $e");
    } finally {
      isAddingFollowups.value = false;
    }
  }

  var followupStatusList = ["Done", "Not Done", "Reshedule"].obs;
  RxString selectedStatusType = "".obs;

  RxList<String> selectedStatusTypeList = <String>[].obs;

  var isChangingStatus = false.obs;
  Future<void> changeFollowupStatus({
    required int id,
    required int status,
    required String remarks,
    required leadId,
    required dynamic followUpsListData,
  }) async {
    try {
      isChangingStatus.value = true;

      final result = await _repository.changeFollowupStatus(
        id: id,
        status: status,
        remarks: remarks,
      );

      if (result != null) {
        Get.back();
        if (status.toString() == "3") {
          // Get.to(() => UpdateFollowUpsScreen(leadId: leadId));
          return;
        }
      }
    } catch (e) {
      CustomToast().showCustomToast("Unexpected error: $e");
    } finally {
      isChangingStatus.value = false;
    }
  }
}
