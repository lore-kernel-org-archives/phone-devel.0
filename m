Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b="vOFJfOhT"
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A78D1DD;
	Sat, 25 Nov 2023 04:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
	t=1700914777; bh=pUnc6hxaXO6k+t6qAK0K2kjbeQ69laez4MfOMiNz8t0=;
	h=From:Subject:Date:To:Cc;
	b=vOFJfOhT+k769Xljz9LeEMNUiBxOB5yd0EgijokaMF+mvSYUJvoTt+rGytYUDxQSG
	 VBIfJT9PFDzYSyB5QAYNEswS+NabnAKf1RROXllI35xFUnV3ypXGcP/sxdRcfv1pQR
	 swnBso414sqv/1pMXxP8biNEzkyB+yZBMmvQsoBE=
From: Luca Weiss <luca@z3ntu.xyz>
Subject: [PATCH v2 0/2] Small dtsi fixes for msm8953 SoC
Date: Sat, 25 Nov 2023 13:19:26 +0100
Message-Id: <20231125-msm8953-misc-fixes-v2-0-df86655841d9@z3ntu.xyz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE7mYWUC/32NSw6CQBBEr0J6bZv5iAyuvIdhgUOP9AIw00j4h
 Ls7cgCXryqvagOhyCRwyzaINLHw0Ccwpwx8W/cvQm4Sg1HGaqVz7KRzZW6xY/EYeCZBVwRbWKN
 sKB0k8R3pKJL3qBK3LOMQl+Nj0r/079ykUeHTKdWQr0u6XO+r7cfPeV5WqPZ9/wKPeqA1tAAAA
 A==
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=754; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=pUnc6hxaXO6k+t6qAK0K2kjbeQ69laez4MfOMiNz8t0=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBlYeZW2TWHha+1ZSps8ueycuUS/D86jC1Ft1rR8
 g0fHeCtQO+JAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZWHmVgAKCRBy2EO4nU3X
 VqImEADVTHqVBLbtRz9EIEHtpMvVHgobZi48tcKfPM+unqB8xnwu2cLVw+frphPgvJ82aNuuPjL
 VH20C6ypW35zT9P3F6Hfwi6AvWFehJHa+8GMi4ui82B8tgQFcZX5vqtggRju+WQU2Gl65/4Ekpm
 DAy5iiYZ9wBNENfofhzyow6S2pV+uBzThpJaqzlPRe2iUH9yTSPpu8Ub/SiwSQ1loyS+fK5BhfT
 uP3AjCuEWj04R6ladenvKzUgNWRIDoRQsbt81P/KZFtXMkLEgeGSdAgTSzvghP+fPgyP9oyvVNz
 REj34czSGfLlnc10EVuahCpOr5Uv/CGmDlzCPxR+upaFNulhPjRnYMPS+SlbByjbrXAVLa7vXOu
 m8RTifp0BcmIWxc2DxA0Offc2mtzIGSLiRs0QjyfAAVCs7RgGxjKWFyNx7AGRQ64FyDy5aVp+W6
 yRS4Po++wwyQs8gPwl4c8RBIYd70cmvEPHNxKBIwNhSFjfDONlkPIznsJnW469SNT5epp7ci5lF
 WkITFjDUEAak4D4MR5aQR7FpYCZsBsgxUoiWMD5NM0kp7cxO1p20vR3WqZrPmSKL/e4PLJRsSCh
 Mo+lcpeM1Xe1dVDtvJHUAPrY49n5ggPbDGad4pvzAE1LkGEN+NIjRBSg5lDPtGRH5VIcgZteSq1
 5rlfUE6Ss8qA3/g==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Fix some small things in the qcom/msm8953.dtsi file to make dtbs_check
happier than before.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
Changes in v2:
- Expand on RAM address commit message (Stephan)
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20231015-msm8953-misc-fixes-v1-0-b800deca9e46@z3ntu.xyz

---
Luca Weiss (2):
      arm64: dts: qcom: msm8953: Set initial address for memory
      arm64: dts: qcom: msm8953: Use non-deprecated qcom,domain in LPASS

 arch/arm64/boot/dts/qcom/msm8953.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 8c9660f6515396aba78d1168d2e17951d653ebf2
change-id: 20231015-msm8953-misc-fixes-87f373203f98

Best regards,
-- 
Luca Weiss <luca@z3ntu.xyz>

