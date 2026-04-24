import sys
sys.path.append('d:/GitHub/Clones/online-ide/Backend/Genai')
from app import get_output_api, app, get_output

code = "print(1)"
language = "python"

with app.test_request_context('/get-output'):
    try:
        res = get_output(code, language)
        if hasattr(res, 'response'):
            for chunk in res.response:
                print(chunk)
        else:
            print("Return:", res)
    except Exception as e:
        import traceback
        traceback.print_exc()
