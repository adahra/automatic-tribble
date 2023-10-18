import 'package:coba_learn/widget/button_shape.dart';
import 'package:coba_learn/widget/progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum DownloadStatus {
  notDownloaded,
  fetchingDownload,
  downloading,
  downloaded,
}

class DownloadButton extends StatelessWidget {
  const DownloadButton({
    super.key,
    required this.status,
    this.downloadProgress = 0,
    required this.onDownload,
    required this.onCancel,
    required this.onOpen,
    this.transitionDuration = const Duration(
      milliseconds: 500,
    ),
  });

  final DownloadStatus status;
  final double downloadProgress;
  final VoidCallback onDownload;
  final VoidCallback onCancel;
  final VoidCallback onOpen;
  final Duration transitionDuration;

  bool get _isDownloading => status == DownloadStatus.downloading;

  bool get _isFetching => status == DownloadStatus.fetchingDownload;

  bool get _isDownloaded => status == DownloadStatus.downloaded;

  void _onPressed() {
    switch (status) {
      case DownloadStatus.notDownloaded:
        onDownload();
        break;
      case DownloadStatus.fetchingDownload:
        break;
      case DownloadStatus.downloading:
        onCancel();
        break;
      case DownloadStatus.downloaded:
        onOpen();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onPressed,
      child: Stack(
        children: [
          ButtonShapeWidget(
            isDownloading: _isDownloading,
            isDownloaded: _isDownloaded,
            isFetching: _isFetching,
            transitionDuration: transitionDuration,
          ),
          Positioned.fill(
            child: AnimatedOpacity(
                opacity: _isDownloading || _isFetching ? 1.0 : 0.0,
                duration: transitionDuration,
                curve: Curves.ease,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ProgressIndicatorWidget(
                      downloadProgress: downloadProgress,
                      isDownloading: _isDownloading,
                      isFetching: _isFetching,
                    ),
                    if (_isDownloading)
                      const Icon(
                        Icons.stop,
                        size: 14.0,
                        color: CupertinoColors.activeBlue,
                      ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
