import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnimationCard extends StatefulWidget {
  final String title;
  final String description;
  final String? codeSnippet;
  final Widget child;

  const AnimationCard({
    super.key,
    required this.title,
    required this.description,
    this.codeSnippet,
    required this.child,
  });

  @override
  State<AnimationCard> createState() => _AnimationCardState();
}

class _AnimationCardState extends State<AnimationCard> {
  bool _showCode = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.description,
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                if (widget.codeSnippet != null)
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _showCode = !_showCode;
                      });
                    },
                    icon: Icon(
                      _showCode ? Icons.code_off : Icons.code,
                      color: Colors.blue,
                    ),
                    tooltip: _showCode ? 'Hide Code' : 'Show Code',
                  ),
              ],
            ),

            const SizedBox(height: 16),

            // Animation Demo
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: widget.child,
            ),

            // Code Snippet (expandable)
            if (_showCode && widget.codeSnippet != null) ...[
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Code:',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            Clipboard.setData(
                              ClipboardData(text: widget.codeSnippet!),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Code copied to clipboard!'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.copy,
                            color: Colors.white70,
                            size: 16,
                          ),
                          tooltip: 'Copy Code',
                        ),
                      ],
                    ),
                    Text(
                      widget.codeSnippet!,
                      style: const TextStyle(
                        color: Colors.greenAccent,
                        fontFamily: 'monospace',
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
