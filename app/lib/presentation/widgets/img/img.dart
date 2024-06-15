import 'package:flutter/material.dart';

class ImgItem extends StatefulWidget {
  final List<String> photos;
  final int index;
  final List<String> selectedImgs;

  const ImgItem({
    super.key,
    required this.photos,
    required this.index,
    required this.selectedImgs,
  });

  @override
  State<ImgItem> createState() => _ImgItemState();
}

class _ImgItemState extends State<ImgItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (widget.selectedImgs.contains(widget.photos[widget.index])) {
            widget.selectedImgs.remove(widget.photos[widget.index]);
            return;
          }
          widget.selectedImgs.add(widget.photos[widget.index]);
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(
                widget.photos[widget.index],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Center(
                  child: Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            if (widget.selectedImgs.contains(widget.photos[widget.index]))
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(2, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.check_circle,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
