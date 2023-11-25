Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b="oDkTpJPD"
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B3CD19B9;
	Sat, 25 Nov 2023 04:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
	t=1700913953; bh=2U8bVfVTiNnmOScG1kUH5cHE9mH112yIEJEnz08nM4w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=oDkTpJPD7CoOaWMBnkLuR3a/2lMcPNHbeGnPTuCYxD3b+8dhMxY9ey7li0KnApRz8
	 Don65v4Nu9EPmgfoBIaCJMGy9hI/uCzEPnccLV+MZosXo17wbEJh+fSEAyrhcIR30q
	 p2xLUbWZpj7cs+xVYE3mmh8Kg81n8PcTvhzLZ3j0=
From: Luca Weiss <luca@z3ntu.xyz>
Date: Sat, 25 Nov 2023 13:05:33 +0100
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: document HTC
 Corporation
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231125-htc-memul-v3-1-e8f4c5839e23@z3ntu.xyz>
References: <20231125-htc-memul-v3-0-e8f4c5839e23@z3ntu.xyz>
In-Reply-To: <20231125-htc-memul-v3-0-e8f4c5839e23@z3ntu.xyz>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca@z3ntu.xyz>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=852; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=2U8bVfVTiNnmOScG1kUH5cHE9mH112yIEJEnz08nM4w=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBlYeMey+tYnBBM5g/Uiktpf+3JoRfg8hd+Qxumd
 9QjzdI1REKJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZWHjHgAKCRBy2EO4nU3X
 ViylD/9vjS91y59QExKhM0w5FXnQ5lDd+u2ivkzvhU6Qze8JPxhliSi7mZM6y7ulCRAtR4LYPG1
 LvuXo3GXZHTjsMcmP2tA57F+AFbMTTFKv1q/ZAo9gj0RFyZdjR67nWuXdliYeMwqTf3gXGRkqdr
 EJsLkoNetM/II1dgX3/0horgkZxqdBrJ4G/vJZ/RgjtTd+J011sRt5NfKe0gwFKESg+uL11pFDz
 WeGs+z0z2vFo8iEAsKwkwngFwg84vrxZpTMuJI8J+HOJihtQ3Wd9krVibkHeTYSAb0LK4AHW2lv
 7m1ZRyNe3oyN2/27zMIHPz4BADyO/Y/B8OVz5YvA0GroySPwFuufJhY8A/FmB83Nt3/143RALZl
 4+MMqnnix3tBzAF6DTglc866E5CpNjkAUlWqvpiA8K2mtXPuCVosx8iTUil+4PJAXbXTUJ8UXNi
 rMdcSI1pLlvtJDA3Ej72zktlQiSpjNVE2EcGmulYnYWCDin8cY/wNZpgxUpySBU4YChMLyaDjYe
 pi+VEWqXmuKkKpbB7ercyc2zV/4pXA8JdHDphjqCl3g7b9qgnYbVD7ELkEDua7Y6g2PfDTccq32
 CqfVOny7Kgs2F99whB8g+6U8EarRFS8Exa1UlJrjmH9IYZMFI8FnOviDIt0ceojVAyBEDWHvs/I
 vmsWJu8nDBRoZig==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add the vendor prefix for HTC (https://www.htc.com/).

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 309b94c328c8..b752f8902367 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -597,6 +597,8 @@ patternProperties:
     description: Hewlett Packard Enterprise
   "^hsg,.*":
     description: HannStar Display Co.
+  "^htc,.*":
+    description: HTC Corporation
   "^huawei,.*":
     description: Huawei Technologies Co., Ltd.
   "^hugsun,.*":

-- 
2.43.0

