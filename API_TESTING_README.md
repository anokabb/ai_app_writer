# API Testing Scripts

This directory contains Python scripts to test the Gemini and OpenAI API integrations before using them in the Flutter app.

## Files

- `test_gemini_api.py` - Tests Google Gemini API
- `test_openai_api.py` - Tests OpenAI API

## Prerequisites

1. **Python 3.7+** installed on your system
2. **requests** library: `pip install requests`

## Setup

### 1. Get API Keys

**For Gemini:**
1. Go to [Google AI Studio](https://makersuite.google.com/app/apikey)
2. Create a new API key
3. Copy the API key

**For OpenAI:**
1. Go to [OpenAI Platform](https://platform.openai.com/api-keys)
2. Create a new API key
3. Copy the API key

### 2. Configure Scripts

Edit each script and replace the placeholder API keys:

**In `test_gemini_api.py`:**
```python
GEMINI_API_KEY = "your_actual_gemini_api_key_here"
```

**In `test_openai_api.py`:**
```python
OPENAI_API_KEY = "your_actual_openai_api_key_here"
```

## Usage

### Test Gemini API
```bash
python test_gemini_api.py
```

### Test OpenAI API
```bash
python test_openai_api.py
```

## What the Scripts Test

Both scripts test:

1. **Text Analysis** - Determines if text was written by AI or human
2. **Text Humanization** - Makes AI-generated text sound more human-like

### Test Cases

The scripts test three types of text:
1. **AI-like text** - Technical, formal language
2. **Human-like text** - Conversational, personal language  
3. **Mixed text** - Combination of both styles

## Expected Output

### Text Analysis
- Source classification (ai/human/mixed)
- AI probability score (0-1)
- Human probability score (0-1)
- Detailed explanation
- Improvement suggestions

### Text Humanization
- Original text
- Humanized version with conversational elements

## Troubleshooting

### Common Issues

1. **API Key Error**
   - Make sure you've replaced the placeholder API keys
   - Verify the API keys are valid and have sufficient credits

2. **Network Error**
   - Check your internet connection
   - Verify the API endpoints are accessible

3. **Rate Limiting**
   - The scripts include delays between tests
   - If you hit rate limits, increase the delay in the scripts

### Error Messages

- `❌ Please set your actual API key` - Replace the placeholder API key
- `❌ Error: 401` - Invalid API key
- `❌ Error: 429` - Rate limit exceeded
- `❌ Error: 500` - Server error, try again later

## Integration with Flutter

Once the Python scripts work correctly, you can:

1. Use the same API keys in your Flutter app
2. Copy the request/response formats to your Dart code
3. Test the same functionality in the Flutter app

## Security Notes

- Never commit API keys to version control
- Use environment variables or secure storage in production
- The test scripts are for development only
- Consider using API key rotation in production

## Next Steps

After successful testing:

1. Update the Flutter app with your API keys
2. Test the Flutter integration
3. Implement proper error handling
4. Add rate limiting and retry logic
5. Set up monitoring for API usage

