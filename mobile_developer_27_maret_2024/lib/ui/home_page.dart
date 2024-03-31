import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:gap/gap.dart';
import 'package:mobile_developer_27_maret_2024/common/assets/color/color.dart';
import 'package:mobile_developer_27_maret_2024/data/model/data_list_model.dart';
import 'package:mobile_developer_27_maret_2024/provider/data_list_provider.dart';
import 'package:mobile_developer_27_maret_2024/provider/video_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

enum _MenuText1 {
  produk(key: 'produk', value: 'Produk'),
  materi(key: 'materi', value: 'Materi'),
  layanan(key: 'layanan', value: 'Layanan'),
  alatPembelajaran(key: 'alat pembelajaran', value: 'Alat Pembelajaran');

  final String key;
  final String value;

  const _MenuText1({required this.key, required this.value});
}

enum _ContentType {
  image,
  video;
}

class _HomePageState extends State<HomePage> {
  VideoPlayerController? _controller;
  bool _isVideoInitialize = false;

  int _menuIndexSelected1 = 0;

  late Map<String, Widget> _menuAndWidget1;

  String _menuKeySelected1 = _MenuText1.produk.key;

  bool _isMenuAndWidget1Initialize = false;

  bool _isMenuProdukSelectedIndexInitialize = false;

  int _menuProdukIndex = -1;

  final ReceivePort _port = ReceivePort();

  void _videoInitialize() async {
    final previousVideoController = _controller;
    // final videoController = VideoPlayerController.asset(
    //     "lib/common/assets/video/Edens_Guardian_Official_Kickstarter_Trailer.mp4");

    final videoController = VideoPlayerController.networkUrl(
      Uri.parse(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
    );

    await previousVideoController?.dispose();

    try {
      await videoController.initialize();
    } on Exception catch (e) {
      print('Error initializing video: $e');
    }

    if (mounted) {
      setState(() {
        _controller = videoController;
        _isVideoInitialize = _controller!.value.isInitialized;
      });

      if (_isVideoInitialize) {
        final providerVideo = context.read<VideoProvider>();
        _controller?.addListener(() {
          providerVideo.duration = _controller?.value.duration ?? Duration.zero;
          providerVideo.position = _controller?.value.position ?? Duration.zero;
          providerVideo.isPlay = _controller?.value.isPlaying ?? false;
        });
      }
    }
  }

  void _unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }

  @pragma('vm:entry-point')
  static void downloadCallback(String id, int status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send?.send([id, status, progress]);
  }

  void _bindBackgroundIsolate() async {
    final isSuccess = IsolateNameServer.registerPortWithName(
      _port.sendPort,
      'downloader_send_port',
    );

    if (!isSuccess) {
      _unbindBackgroundIsolate();
      _bindBackgroundIsolate();
    }

    _port.listen((dynamic data) {
      String id = (data as List<dynamic>)[0] as String;
      DownloadTaskStatus status = DownloadTaskStatus.fromInt(data[1] as int);
      int progress = data[2] as int;

      print(
        'Callback on UI isolate: '
        'task ($id) is in status ($status) and process ($progress)%',
      );

      setState(() {});
      print('progress: $progress %');
    });

    FlutterDownloader.registerCallback(downloadCallback);

    bool isAndroid = Platform.isAndroid;
    bool isIos = Platform.isIOS;

    Directory? dir;

    if (isAndroid) {
      dir = await getExternalStorageDirectory();
    } else if (isIos) {
      dir = await getDownloadsDirectory();
    }

    final taskId = await FlutterDownloader.enqueue(
      url: 'https://images.pexels.com/photos/1092644/pexels-photo-1092644.jpeg',
      headers: {},
      // optional: header send with url (auth token etc)
      savedDir: dir?.path ?? '',
      showNotification: false,
      openFileFromNotification: false,
    );

    // print('uri.parse(): ${Uri.parse('https://images.pexels.com/photos/159711/books-bookstore-book-reading-159711.jpeg').}');

    print('taskId: $taskId');
  }

  @override
  void initState() {
    _videoInitialize();

    _bindBackgroundIsolate();

    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  AppBar _buildAppBar(BuildContext context) {
    late final String logoUrl;

    Widget title() {
      return CachedNetworkImage(
        httpHeaders: const {
          'Connection': 'keep-alive',
        },
        cacheKey: logoUrl,
        imageUrl: logoUrl,
        cacheManager: CacheManager(
          Config(
            logoUrl,
            stalePeriod: const Duration(minutes: 1),
          ),
        ),
        width: 150,
        color: ColorCustom.blue1F479C,
        progressIndicatorBuilder: (context, url, progress) =>
            CircularProgressIndicator(value: progress.progress),
        errorWidget: (context, url, error) {
          return const Icon(Icons.error);
        },
      );
    }

    List<Widget> actions() {
      return [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        )
      ];
    }

    AppBar appBarLoaded() {
      return AppBar(
        title: title(),
        actions: actions(),
        backgroundColor: ColorCustom.grayD8D8D8,
        surfaceTintColor: ColorCustom.grayD8D8D8,
      );
    }

    AppBar appBarEmpty() => AppBar();

    final providerDataList = context.watch<DataListProvider>();
    final state = providerDataList.state;

    AppBar result = state.maybeWhen(
      loaded: (data) {
        logoUrl = data.data.isNotEmpty ? data.data.first.logo : '';
        return appBarLoaded();
      },
      orElse: () => appBarEmpty(),
    );

    return result;
  }

  void _menuAndWidget1Initialize(BuildContext context) {
    _menuAndWidget1 = {
      _MenuText1.produk.key: _buildViewProduk(context),
      _MenuText1.materi.key: _buildEmptyView(_MenuText1.materi.value),
      _MenuText1.layanan.key: _buildEmptyView(_MenuText1.layanan.value),
      _MenuText1.alatPembelajaran.key:
          _buildEmptyView(_MenuText1.alatPembelajaran.value),
    };
  }

  Widget _buildContainerBody(BuildContext context) {
    Widget container() {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(bottom: 16),
        decoration: const BoxDecoration(
            // border: Border.all(color: Colors.black),
            ),
        child: Column(
          children: [
            _buildBodyContent1(context),
            const Gap(8),
            _buildBodyContent2(),
            const Gap(8),
            _buildBodyContent3(),
          ],
        ),
      );
    }

    const loading = Center(child: CircularProgressIndicator());
    Widget error(String value) {
      return Center(
        child: Text(value),
      );
    }

    final providerDataList = context.watch<DataListProvider>();
    final state = providerDataList.state;

    Widget result = state.when(
      initial: () => loading,
      loading: () => loading,
      loaded: (data) {
        if (!_isMenuAndWidget1Initialize) {
          _isMenuAndWidget1Initialize = true;
          _menuAndWidget1Initialize(context);
        }
        return container();
      },
      error: (message) => error(message),
    );

    return result;
  }

  Widget _buildBodyContent1(BuildContext context) {
    Widget imageOrVideoPlayerExample() {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
          ),
          // width: double.infinity,
          // height: 200,
          child: const Text('Image or Video'),
        ),
      );
    }

    // Widget videoPlayer() => AspectRatio(
    //   aspectRatio: 16 / 9,
    //   child: VimeoVideoPlayer(
    //     url: 'https://vimeo.com/598879402',
    //     autoPlay: true,
    //   ),
    // );

    // Widget videoPlayer() {
    //   return AspectRatio(
    //     aspectRatio: 16 / 9,
    //     child: VimeoPlayer(
    //       videoId: '598879402',
    //     ),
    //   );
    // }

    Widget videoPlayerOrImage() {
      final providerDataList = context.read<DataListProvider>();
      final state = providerDataList.state;

      if (_menuProdukIndex >= 0) {
        Playlist? playlist = state.maybeWhen(
          loaded: (data) => data.data.firstOrNull?.playlist[_menuProdukIndex],
          orElse: () => null,
        );

        if (playlist!.type == 'video') {
          if (_isVideoInitialize) {
            final providerVideo = context.watch<VideoProvider>();
            final isPlay = providerVideo.isPlay;

            return GestureDetector(
              onTap: () {
                if (_controller!.value.isPlaying) {
                  _controller!.pause();
                } else {
                  _controller!.play();
                }
              },
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Stack(
                  children: [
                    VideoPlayer(_controller!),
                    !isPlay
                        ? const Align(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.play_circle,
                              color: Colors.white,
                              size: 60,
                            ),
                          )
                        : const SizedBox.shrink(),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: VideoProgressIndicator(_controller!,
                          allowScrubbing: true),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        } else if (playlist!.type == 'image') {
          final playUrl = playlist!.url;

          return AspectRatio(
            aspectRatio: 16 / 9,
            child: CachedNetworkImage(
              httpHeaders: const {
                'Connection': 'keep-alive',
              },
              cacheKey: playUrl,
              imageUrl: playUrl,
              cacheManager: CacheManager(
                Config(
                  playUrl,
                  stalePeriod: const Duration(minutes: 1),
                ),
              ),
              fit: BoxFit.contain,
              progressIndicatorBuilder: (context, url, progress) =>
                  CircularProgressIndicator(value: progress.progress),
              errorWidget: (context, url, error) {
                return const Icon(Icons.error);
              },
            ),
          );
        } else {
          return imageOrVideoPlayerExample();
        }
      } else {
        return imageOrVideoPlayerExample();
      }
    }

    Widget titleAndDescription() {
      final providerDataList = context.read<DataListProvider>();
      final state = providerDataList.state;

      if (_menuProdukIndex >= 0) {
        Playlist? playlist = state.maybeWhen(
          loaded: (data) => data.data.firstOrNull?.playlist[_menuProdukIndex],
          orElse: () => null,
        );

        String? title = playlist!.title;
        String? description = playlist.description;

        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: const BoxDecoration(
              // border: Border.all(color: Colors.green),
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(description),
            ],
          ),
        );
      } else {
        return const SizedBox.shrink();
      }
    }

    return Column(
      children: [
        videoPlayerOrImage(),
        const Gap(4),
        titleAndDescription(),
      ],
    );
  }

  Widget _buildBodyContent2() {
    FilledButton filledButton(
      void Function()? onPressed,
      String textButton,
      bool isSelected,
    ) {
      final backgroundColor =
          isSelected ? ColorCustom.blue0174F1 : ColorCustom.grayD8D8D8;
      const fontWeight = FontWeight.bold;
      final textColor = isSelected ? Colors.white : Colors.black;

      return FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          textButton,
          style: TextStyle(
            fontWeight: fontWeight,
            color: textColor,
          ),
        ),
      );
    }

    final itemList = _MenuText1.values.map((e) => e.value).toList();
    final itemCount = itemList.length;
    final listViewBuilder = ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        final paddingRight = index != itemCount - 1 ? 8.0 : 0.0;

        onPressed() {
          setState(() {
            _menuIndexSelected1 = index;
            _menuKeySelected1 = itemList[index].toLowerCase();
          });
        }

        final isSelected = index == _menuIndexSelected1;

        return Padding(
          padding: EdgeInsets.only(right: paddingRight),
          child: filledButton(
            onPressed,
            itemList[index],
            isSelected,
          ),
        );
      },
      itemCount: itemCount,
    );

    return Container(
      height: 50,
      width: double.infinity,
      decoration: const BoxDecoration(
          // border: Border.all(color: Colors.red),
          ),
      child: listViewBuilder,
    );
  }

  Widget _buildViewProduk(BuildContext context) {
    Widget listViewExample() {
      return Expanded(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    titleAlignment: ListTileTitleAlignment.center,
                    // leading: FlutterLogo(size: 72.0),
                    leading: const Icon(Icons.play_circle, size: 50),
                    title: const Text('Three-line ListTile'),
                    subtitle: const Text(
                        'A sufficiently long subtitle warrants three lines.'),
                    trailing: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: ColorCustom.blue0174F1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('Simpan'),
                    ),
                    isThreeLine: true,
                    contentPadding:
                        const EdgeInsets.only(left: 4.0, right: 4.0),
                  ),
                );
              },
              itemCount: 10,
            ),
          ),
        ),
      );
    }

    final providerDataList = context.read<DataListProvider>();
    final state = providerDataList.state;

    Widget result = state.maybeWhen(
      loaded: (data) {
        bool isDataEmpty() {
          if (data.data.isEmpty) {
            return true;
          } else if (data.data.first.playlist.isEmpty) {
            return true;
          } else {
            return false;
          }
        }

        Widget listViewPlayList() {
          final playList = data.data.first.playlist;
          final playListLength = playList.length;

          if (!_isMenuProdukSelectedIndexInitialize) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              setState(() {
                _isMenuProdukSelectedIndexInitialize = true;
                _menuProdukIndex = 0;
                // if (playList.first.type == 'image') {
                //   _menuProdukContentType = _ContentType.image;
                // } else if (playList.first.type == 'video') {
                //   _menuProdukContentType = _ContentType.video;
                // }
              });
            });
          }

          return Expanded(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final play = playList[index];

                    return Card(
                      clipBehavior: Clip.hardEdge,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _menuProdukIndex = index;
                            _controller?.pause();
                          });
                        },
                        child: ListTile(
                          titleAlignment: ListTileTitleAlignment.center,
                          leading: const Icon(Icons.play_circle, size: 50),
                          title: Text(play.title),
                          subtitle: Text(play.description),
                          trailing: FilledButton(
                            style: FilledButton.styleFrom(
                              backgroundColor: ColorCustom.blue0174F1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text('Simpan'),
                          ),
                          // trailing: SaveFileButton(
                          //   onPressedWhenFileNotDownloaded: () {},
                          //   isFileDownloaded: isFileDownloaded,
                          // ),
                          isThreeLine: true,
                          contentPadding:
                              const EdgeInsets.only(left: 4.0, right: 4.0),
                        ),
                      ),
                    );
                  },
                  itemCount: playListLength,
                ),
              ),
            ),
          );
        }

        final result2 =
            isDataEmpty() ? _buildEmptyView('Data kosong') : listViewPlayList();

        return result2;
      },
      orElse: () => _buildEmptyView('Data gagal dimuat'),
    );

    return result;
  }

  Widget _buildEmptyView(String title) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
        ),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green),
          ),
          child: Text(title),
        ),
      ),
    );
  }

  Widget _buildBodyContent3() {
    Widget result;

    if (_menuAndWidget1.containsKey(_menuKeySelected1)) {
      result = _menuAndWidget1[_menuKeySelected1]!;
    } else {
      result = _buildEmptyView('Error');
    }

    return result;
  }

  Widget _buildScaffold(BuildContext context) {
    final providerDataList = context.read<DataListProvider>();

    return Scaffold(
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: RefreshIndicator(
            onRefresh: () async {
              providerDataList.fetchDataList();
            },
            child: _buildContainerBody(context)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildScaffold(context);
  }
}

class SaveFileButton extends StatefulWidget {
  final void Function() onPressedWhenFileNotDownloaded;
  final void Function()? onPressedWhenFileDownloaded;
  final bool isFileDownloaded;

  const SaveFileButton({
    super.key,
    required this.onPressedWhenFileNotDownloaded,
    required this.isFileDownloaded,
    this.onPressedWhenFileDownloaded,
  });

  @override
  State<SaveFileButton> createState() => _SaveFileButtonState();
}

class _SaveFileButtonState extends State<SaveFileButton> {
  final String save = 'Simpan';

  final String saved = 'Tersimpan';

  final Color backgroundColorSave = ColorCustom.blue0174F1;

  final Color backgroundColorSaved = ColorCustom.grayD8D8D8;

  Widget filledButton({
    required void Function()? onPressedWhenFileNotDownloaded,
    required void Function()? onPressedWhenFileDownloaded,
    required bool isFileDownloaded,
  }) {
    final backgroundColor =
        isFileDownloaded ? backgroundColorSaved : backgroundColorSave;

    final style = FilledButton.styleFrom(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );

    final textButton = isFileDownloaded ? saved : save;

    final onPressed = isFileDownloaded
        ? onPressedWhenFileDownloaded
        : onPressedWhenFileNotDownloaded;

    return FilledButton(
      onPressed: onPressed,
      child: Text(
        textButton,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return filledButton(
      onPressedWhenFileNotDownloaded: widget.onPressedWhenFileNotDownloaded,
      onPressedWhenFileDownloaded: widget.onPressedWhenFileDownloaded,
      isFileDownloaded: widget.isFileDownloaded,
    );
  }
}
