import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:taxi_app/client_app/authentication/widgets/primary_button.dart';

class DriverProfileDocuments extends StatefulWidget {
	const DriverProfileDocuments({Key? key}) : super(key: key);

	@override
	State<DriverProfileDocuments> createState() => _DriverProfileDocumentsState();
}

class _DriverProfileDocumentsState extends State<DriverProfileDocuments> {
		// uploaded files
		File? frontFile;
		File? backFile;
		String? frontName;
		String? backName;
		int? frontSize;
		int? backSize;

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: Colors.white,
			appBar: AppBar(
				backgroundColor: Colors.white,
				elevation: 0,
				leading: IconButton(
					icon: const Icon(Icons.arrow_back, color: Colors.black87),
					onPressed: () => Navigator.of(context).pop(),
				),
				title: const Text('Driving license', style: TextStyle(color: Colors.black87, fontSize: 16)),
				centerTitle: true,
			),
			body: Padding(
				padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						const SizedBox(height: 8),
						_buildBullet('Photocopies And Printouts Of Documents Will Not Be Accepted'),
						const SizedBox(height: 8),
						_buildBullet('The Photo And All Details Must Clearly Be Visible'),
						const SizedBox(height: 8),
						_buildBullet('Only Documents That Are Less Than 10Mb In Size And In JPEG, PNG OR PDF Format Will Be Accepted'),
						const SizedBox(height: 18),

									// dashed upload container (tap to pick front then back)
									GestureDetector(
										onTap: () async => await _pickDocument(),
										child: Container(
											width: double.infinity,
											height: 120,
											decoration: BoxDecoration(
												color: const Color(0xFFF7F7F7),
												borderRadius: BorderRadius.circular(8),
												border: Border.all(color: const Color(0xFFDADADA), style: BorderStyle.solid, width: 1),
											),
											child: Center(
												child: Column(
													mainAxisSize: MainAxisSize.min,
													children: const [
														Icon(Icons.cloud_upload_outlined, size: 36, color: Colors.black45),
														SizedBox(height: 8),
														Text('Upload Documents', style: TextStyle(color: Colors.black54)),
													],
												),
											),
										),
									),
						const SizedBox(height: 8),
						const Text('Note: Please upload both sides of driving license', style: TextStyle(fontSize: 12, color: Colors.black54)),
						const SizedBox(height: 12),

									Row(
										children: [
											_buildThumb('Front', file: frontFile, name: frontName, size: frontSize, onRemove: () {
												setState(() {
													frontFile = null;
													frontName = null;
													frontSize = null;
												});
											}),
											const SizedBox(width: 12),
											_buildThumb('Back', file: backFile, name: backName, size: backSize, onRemove: () {
												setState(() {
													backFile = null;
													backName = null;
													backSize = null;
												});
											}),
										],
									),

						const Spacer(),

						SizedBox(
							width: double.infinity,
							height: 52,
							child: PrimaryButton(
								label: 'Update',
								onPressed: () {
									// TODO: update upload
									Navigator.of(context).pop();
								},
							),
						),
					],
				),
			),
		);
	}

	Widget _buildBullet(String text) {
		return Row(
			crossAxisAlignment: CrossAxisAlignment.start,
			children: [
				const Padding(
					padding: EdgeInsets.only(top: 6.0, right: 8),
					child: Icon(Icons.radio_button_unchecked, size: 16, color: Colors.black54),
				),
				Expanded(child: Text(text, style: const TextStyle(fontSize: 13, color: Colors.black87))),
			],
		);
	}

		Widget _buildThumb(String label, {File? file, String? name, int? size, required VoidCallback onRemove}) {
			return Expanded(
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						Stack(
							children: [
								Container(
									height: 90,
									decoration: BoxDecoration(
										color: const Color(0xFFEFEFEF),
										borderRadius: BorderRadius.circular(8),
									),
									child: file != null
											? ClipRRect(
													borderRadius: BorderRadius.circular(8),
													child: Image.file(file, fit: BoxFit.cover, width: double.infinity, height: 90),
												)
											: const SizedBox.shrink(),
								),
								Positioned(
									right: 6,
									top: 6,
									child: GestureDetector(
										onTap: onRemove,
										child: Container(
											width: 22,
											height: 22,
											decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.black54),
											child: const Icon(Icons.close, size: 14, color: Colors.white),
										),
									),
								),
							],
						),
						const SizedBox(height: 6),
						Text(label, style: const TextStyle(fontSize: 12, color: Colors.black54)),
						if (name != null) ...[
							const SizedBox(height: 4),
							Text(name, style: const TextStyle(fontSize: 11, color: Colors.black45)),
						],
						if (size != null) ...[
							const SizedBox(height: 2),
							Text(_formatBytes(size), style: const TextStyle(fontSize: 10, color: Colors.black38)),
						]
					],
				),
			);
		}

		Future<void> _pickDocument() async {
			// If front not set, pick front; else pick back
			final result = await FilePicker.platform.pickFiles(
				type: FileType.custom,
				allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
				withData: false,
			);
			if (result == null || result.files.isEmpty) return;
			final picked = result.files.first;
			final path = picked.path;
			if (path == null) return;

			setState(() {
				if (frontFile == null) {
					frontFile = File(path);
					frontName = picked.name;
					frontSize = picked.size;
				} else {
					backFile = File(path);
					backName = picked.name;
					backSize = picked.size;
				}
			});
		}

		String _formatBytes(int bytes, [int decimals = 1]) {
				if (bytes <= 0) return '0 B';
				const suffixes = ['B', 'KB', 'MB', 'GB', 'TB'];
				var i = (math.log(bytes) / math.log(1024)).floor();
				return ((bytes / math.pow(1024, i)).toStringAsFixed(decimals)) + ' ' + suffixes[i];
		}
}

