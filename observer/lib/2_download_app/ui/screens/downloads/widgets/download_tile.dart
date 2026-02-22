import 'package:flutter/material.dart';

import 'download_controler.dart';
import '../../../theme/theme.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({super.key, required this.controller});

  final DownloadController controller;

  // TODO
  Widget _buildStatusIcon() {
    switch (controller.status) {
      case DownloadStatus.notDownloaded:
        return IconButton(
          icon: Icon(Icons.file_download, color: AppColors.iconNormal),
          onPressed: () => controller.startDownload(),
        );
      case DownloadStatus.downloading:
        return Icon(Icons.downloading, color: AppColors.iconNormal);
      case DownloadStatus.downloaded:
        return Icon(Icons.folder, color: AppColors.iconNormal);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO
    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.ressource.name,
                      style: AppTextStyles.label.copyWith(
                        color: AppColors.text,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (controller.status != DownloadStatus.notDownloaded) ...[
                      const SizedBox(height: 4),
                      Text(
                        "${(controller.progress * 100).toStringAsFixed(1)} % completed - "
                        "${(controller.progress * controller.ressource.size).toStringAsFixed(1)} "
                        "of ${controller.ressource.size} MB",
                        style: AppTextStyles.label.copyWith(
                          color: AppColors.textLight,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              _buildStatusIcon(),
            ],
          ),
        );
      },
    );
  }
}
